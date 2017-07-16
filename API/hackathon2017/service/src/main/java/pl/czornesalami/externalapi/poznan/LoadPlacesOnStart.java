package pl.czornesalami.externalapi.poznan;

import com.fasterxml.jackson.databind.ObjectMapper;
import pl.czornesalami.repository.Repo;
import pl.czornesalami.rest.model.PlaceDto;
import pl.czornesalami.rest.model.PlacesDto;

import javax.annotation.PostConstruct;
import javax.ejb.Singleton;
import javax.ejb.Startup;
import javax.inject.Inject;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.function.Function;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@Startup
@Singleton
public class LoadPlacesOnStart {
    private static final Logger logger = Logger.getLogger(LoadPlacesOnStart.class.getName());

    private ObjectMapper objectMapper = new ObjectMapper();

    @Inject
    private Repo repo;

    @Inject
    private DefaultPlacesRest defaultPlacesRest;

    @PostConstruct
    private void init() {
        Map<Integer, PlaceDto> places;

        try {
            places = defaultPlacesRest.getPlaces(2572);
        } catch (Exception ex) {
            ex.printStackTrace();
            logger.warning("Error when try get places from poznan api. Read hard coded places.");

            InputStream hardCodedPlaces = Thread.currentThread().getContextClassLoader()
                    .getResourceAsStream("hard_coded_places.json");

            try {
                PlacesDto placesDto = objectMapper.readValue(hardCodedPlaces, PlacesDto.class);
                places = placesDto.getPlaces().stream()
                        .collect(Collectors.toMap(PlaceDto::getId, Function.identity()));

            } catch (IOException e) {
                throw new RuntimeException(ex);
            }
        }

        repo.putAllPlaces(places);
    }
}
