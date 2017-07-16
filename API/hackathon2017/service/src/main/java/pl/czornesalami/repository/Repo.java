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

    public Optional<PlaceDto> getPlace(int placeId) {
        return Optional.ofNullable(places.get(placeId));
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

    public int addEvent(String username, EventDto event) {
        List<EventDto> eventsForUser = new ArrayList<>();
        if (events.containsKey(username)) {
            eventsForUser.addAll(events.get(username));
        }
        EventDto eventWithId = event.toBuilder()
                .withId(++eventActualId)
                .build();
        eventsForUser.add(eventWithId);
        events.put(username, eventsForUser);
        return eventWithId.getId();
    }

    public Optional<EventDto> getEvent(final int eventId) {
        return events.values().stream()
                        .flatMap(Collection::stream)
                        .filter(v -> v.getId() == eventId)
                        .findFirst();
    }

    public List<EventWithProbabilityDto> getEventsWithProbability(String username) {
        final ProfileDto profileDto = profileRepo.getOrDefault(username, ProfileDto.builder()
                .withPlaces(new int[0])
                .build());

        return events.entrySet()
                .stream()
                .flatMap(event -> event.getValue().stream().map(se ->
                        new AbstractMap.SimpleEntry<>(
                                event.getKey(), se
                        )
                ))
                .map(event -> EventWithProbabilityDto.builder()
                        .withAuthor(event.getKey())
                        .withJoinedUsers(usersJoinedToEvent.getOrDefault(event.getValue().getId(), Collections.emptySet()))
                        .withEvent(event.getValue())
                        .withProbability(countProbability(event.getValue(), profileDto.getPlaces()))
                        .build())
                .sorted((Comparator.comparingDouble(EventWithProbabilityDto::getProbability)))
                .collect(Collectors.toList());
    }

    private double countProbability(EventDto event, int[] userPlaces) {
        if (userPlaces.length == 0) {
            return 0.0;
        }
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


        return (double) countIntersect / (double) (event.getWayPoints().length + 2);

    }
}
