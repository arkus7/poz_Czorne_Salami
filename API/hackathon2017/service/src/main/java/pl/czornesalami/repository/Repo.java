package pl.czornesalami.repository;

import pl.czornesalami.rest.model.*;

import javax.enterprise.context.ApplicationScoped;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@ApplicationScoped
public class Repo {
    private Map<String, String> loginRepo = new ConcurrentHashMap<>();
    private Map<String, ProfileDto> profileRepo = new ConcurrentHashMap<>();
    private Map<Integer, PlaceDto> places = new ConcurrentHashMap<>();

    private int eventActualId = 0;
    private Map<String, List<EventDto>> events = new ConcurrentHashMap<>();
    private Map<Integer, Set<String>> usersJoinedToEvent = new ConcurrentHashMap<>();

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

    public void joinToEvent(String username, int eventId) {
        Set<String> usernames = new HashSet<>();
        if (usersJoinedToEvent.containsKey(eventId)) {
            usernames.addAll(usersJoinedToEvent.get(eventId));
        }
        usernames.add(username);
        usersJoinedToEvent.put(eventId, usernames);
    }

    public void addEvent(String username, EventDto event) {
        List<EventDto> eventsForUser = new ArrayList<>();
        if (events.containsKey(username)) {
            eventsForUser.addAll(events.get(username));
        }
        eventsForUser.add(event.toBuilder()
                .withId(++eventActualId)
                .build());
        events.put(username, eventsForUser);
    }

    public List<EventWithProbabilityDto> getEventsWithProbability(String username) {
        ProfileDto profileDto = profileRepo.get(username);
        int countUserFavoritePlaces = profileDto.getPlaces().length;

        return events.entrySet()
                .stream()
                .flatMap(event -> event.getValue().stream().map(se ->
                        new AbstractMap.SimpleEntry<>(
                                event.getKey(), se
                        )
                ))
                .map(event -> EventWithProbabilityDto.builder()
                        .withAuthor(event.getKey())
                        .withJoinedUsers(usersJoinedToEvent.get(event.getValue().getId()))
                        .withEvent(event.getValue())
                        .withProbability(countProbability(event.getValue(), profileDto.getPlaces()))
                        .build())
                .sorted((Comparator.comparingDouble(EventWithProbabilityDto::getProbability)))
                .collect(Collectors.toList());
    }

    private double countProbability(EventDto event, int[] userPlaces) {
        List<Integer> userPlacesStream = IntStream.of(userPlaces).boxed().collect(Collectors.toList());

        IntStream.Builder eventPlacesStreamBuilder = IntStream.builder()
                .add(event.getStartPlace())
                .add(event.getEndPlace());

        for (int v : event.getWayPoints()) {
            eventPlacesStreamBuilder.add(v);
        }

        long countIntersect = eventPlacesStreamBuilder.build().boxed()
                .filter(userPlacesStream::contains)
                .count();


        return (double) countIntersect / (double) userPlacesStream.size();

    }
}
