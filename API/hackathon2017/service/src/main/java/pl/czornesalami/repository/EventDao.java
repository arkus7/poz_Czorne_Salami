package pl.czornesalami.repository;

import pl.czornesalami.rest.model.EventDto;
import pl.czornesalami.rest.model.EventWithProbabilityDto;
import pl.czornesalami.rest.model.ProfileDto;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class EventDao {

    @Inject
    private Repo repo;

    public int addEvent(String username, EventDto event) {
        return repo.addEvent(username, event);
    }

    public void joinToEvent(String username, int eventId) {
        repo.joinToEvent(username, eventId);
    }

    public List<EventWithProbabilityDto> getEventsWithProbability(String username) {
        return repo.getEventsWithProbability(username);
    }

    public Optional<EventDto> getEvent(int id) {
        return repo.getEvent(id);
    }

}
