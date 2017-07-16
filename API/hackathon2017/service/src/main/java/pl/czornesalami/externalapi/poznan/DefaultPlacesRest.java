package pl.czornesalami.externalapi.poznan;

import org.jboss.resteasy.client.jaxrs.ResteasyClient;
import org.jboss.resteasy.client.jaxrs.ResteasyClientBuilder;
import org.jboss.resteasy.client.jaxrs.ResteasyWebTarget;
import org.jsoup.Jsoup;
import pl.czornesalami.externalapi.poznan.model.Places;
import pl.czornesalami.rest.model.PlaceDto;

import javax.annotation.PostConstruct;
import javax.enterprise.context.Dependent;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Dependent
public class DefaultPlacesRest {


    private PlacesRest proxy;

    @PostConstruct
    private void init() {
        ResteasyClient client = new ResteasyClientBuilder().build();
        ResteasyWebTarget target = client.target("http://www.poznan.pl");

        proxy = target.proxy(PlacesRest.class);
    }


    public Map<Integer, PlaceDto> getPlaces(int categoryId) {
        Places places = proxy.getPlaces(
                "pub_transport",
                "class_objects",
                categoryId
        );

        Map<Integer, PlaceDto> placeMap = places.getFeatures()
                .stream()
                .map(place -> PlaceDto.builder()
                        .withId(place.getId())
                        .withAddress(place.getProperties().getAddress())
                        .withCategory(place.getProperties().getCategoryName())
                        .withCity(place.getProperties().getCity())
                        .withCoordinates(place.getGeometry().getCoordinates())
                        .withDescription(Jsoup.parse(
                                place.getProperties().getDescription()
                        ).text())
                        .withName(place.getProperties().getName())
                        .withImageUrl(String.format(
                                "http://www.poznan.pl/mim/main/object.html?co=picture&id_obiektu=%d&id_klasy=%d&lang=pl",
                                place.getId(),
                                place.getProperties().getCategoryId()
                                )
                        )
                        .build())
                .collect(Collectors.toMap(PlaceDto::getId, Function.identity()));

        return placeMap;
    }

}
