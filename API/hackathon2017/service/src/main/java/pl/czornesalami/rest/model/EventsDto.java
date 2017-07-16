package pl.czornesalami.rest.model;

import java.util.List;

public class EventsDto {
    private List<EventWithProbabilityDto> events;

    private EventsDto() {
    }


    public static Builder builder() {
        return new Builder();
    }

    public List<EventWithProbabilityDto> getEvents() {
        return events;
    }

    public Builder toBuilder() {
        return builder().from(this);
    }

    public static final class Builder {
        private List<EventWithProbabilityDto> events;

        private Builder() {
        }

        public Builder withEvents(List<EventWithProbabilityDto> events) {
            this.events = events;
            return this;
        }

        public Builder but() {
            return builder().withEvents(events);
        }

        public Builder from(EventsDto from) {
            this.events = from.events;
            return this;
        }

        public EventsDto build() {
            EventsDto eventsDto = new EventsDto();
            eventsDto.events = this.events;
            return eventsDto;
        }
    }
}
