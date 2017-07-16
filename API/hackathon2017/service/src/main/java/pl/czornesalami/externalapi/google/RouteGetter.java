package pl.czornesalami.externalapi.google;


import org.jboss.resteasy.client.jaxrs.ResteasyClient;
import org.jboss.resteasy.client.jaxrs.ResteasyClientBuilder;
import org.jboss.resteasy.client.jaxrs.ResteasyWebTarget;
import pl.czornesalami.externalapi.google.model.Routes;
import pl.czornesalami.repository.EventDao;
import pl.czornesalami.repository.PlacesDao;
import pl.czornesalami.repository.RoutePointsDto;
import pl.czornesalami.rest.model.EventDto;
import pl.czornesalami.rest.model.PlaceDto;

import javax.annotation.PostConstruct;
import javax.enterprise.context.Dependent;
import javax.inject.Inject;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Dependent
public class RouteGetter {
    private static final String AVOID_VALUE = "highways";
    private static final String MODE_VALUE = "bicycling";


    private String googleApiKey;

    @Inject
    private EventDao eventDao;

    @Inject
    private PlacesDao placesDao;

    private GooleApiDirectionRest proxy;

    @PostConstruct
    private void init() {
        googleApiKey = System.getProperty("google.api.key");

        ResteasyClient client = new ResteasyClientBuilder().build();
        ResteasyWebTarget target = client.target("https://maps.googleapis.com");

        proxy = target.proxy(GooleApiDirectionRest.class);
    }

    public RoutePointsDto getRoute(int eventId) {
        EventDto event = eventDao.getEvent(eventId)
                .orElseThrow(() -> new RuntimeException("Event was not found!"));

        double[] startPlaceCoordinates = placesDao.getPlace(event.getStartPlace())
                .map(PlaceDto::getCoordinates)
                .orElseThrow(() -> new RuntimeException("Start place was not found!"));
        double[] endPlaceCoordinates = placesDao.getPlace(event.getEndPlace())
                .map(PlaceDto::getCoordinates)
                .orElseThrow(() -> new RuntimeException("End place was not found!"));

        List<double[]> wayPointCooridinates = IntStream.of(event.getWayPoints()).boxed()
                .map(placeId -> placesDao.getPlace(placeId)
                        .map(PlaceDto::getCoordinates)
                        .orElseThrow(() -> new RuntimeException("Place(" + placeId + ") was not found!")))
                .collect(Collectors.toList());

        Routes route = proxy.getRoute(
                concatCoordinates(startPlaceCoordinates),
                concatCoordinates(endPlaceCoordinates),
                createWaypoints(wayPointCooridinates),
                googleApiKey,
                AVOID_VALUE,
                MODE_VALUE
        );

        return route.getRoutes().stream()
                .findFirst()
                .map(googleRoute -> RoutePointsDto.builder()
                        .withPoints(googleRoute.getOverviewPolyline().getPoints())
                        .build())
                .orElseThrow(() -> new RuntimeException("Route points was not found!"));
    }

    private String concatCoordinates(double[] coordinates) {
        return coordinates[1] + "," + coordinates[0];
    }

    private String createWaypoints(List<double[]> wayPointCooridinates) {
        return "via:" + wayPointCooridinates.stream()
                .map(this::concatCoordinates)
                .collect(Collectors.joining("|via:"));
    }
}
