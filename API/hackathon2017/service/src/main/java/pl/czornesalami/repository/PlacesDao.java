package pl.czornesalami.repository;

import pl.czornesalami.rest.model.PlaceDto;
import pl.czornesalami.rest.model.PlacesDto;
import pl.czornesalami.rest.model.ProfileDto;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import java.util.Optional;

@ApplicationScoped
public class PlacesDao {

    @Inject
    private Repo repo;

    public PlacesDto getPlaces() {
        return repo.getPlaces();
    }

    public Optional<PlaceDto> getPlace(int id) {
        return repo.getPlace(id);
    }
}
