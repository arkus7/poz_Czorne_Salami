package pl.czornesalami.externalapi;

import pl.czornesalami.repository.Repo;

import javax.annotation.PostConstruct;
import javax.ejb.Singleton;
import javax.ejb.Startup;
import javax.inject.Inject;

@Startup
@Singleton
public class LoadPlacesOnStart {

    @Inject
    private Repo repo;

    @Inject
    private DefaultPlacesRest defaultPlacesRest;

    @PostConstruct
    private void init() {
        repo.putAllPlaces(defaultPlacesRest.getPlaces(2572));
    }
}
