package pl.czornesalami.repository;

import pl.czornesalami.rest.model.PlaceDto;
import pl.czornesalami.rest.model.PlacesDto;
import pl.czornesalami.rest.model.ProfileDto;

import javax.enterprise.context.ApplicationScoped;
import java.util.ArrayList;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

@ApplicationScoped
public class Repo {

    private Map<Integer, PlaceDto> places = new ConcurrentHashMap<>();

    private Map<String, String> loginRepo = new ConcurrentHashMap<>();
    private Map<String, ProfileDto> profileRepo = new ConcurrentHashMap<>();

    public void addLogin(String username, String password) {
        loginRepo.put(username, password);
    }

    public Optional<String> getLoginPassword(String username) {
        return Optional.ofNullable(loginRepo.get(username));
    }

    public void addOrUpdateProfile(String username, ProfileDto profile) {
        profileRepo.put(username, profile);
    }

    public Optional<ProfileDto> getProfile(String username) {
        return Optional.ofNullable(profileRepo.get(username));
    }

    public void putAllPlaces(Map<Integer, PlaceDto> places) {
        this.places.putAll(places);
    }

    public PlacesDto getPlaces() {
        return PlacesDto.builder()
                .withPlaces(
                        new ArrayList<>(places.values())
                )
                .build();
    }
}
