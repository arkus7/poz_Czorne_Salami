package pl.czornesalami.rest.model;

import java.util.List;
import java.util.Set;

public class EventWithProbabilityDto {
    private String author;
    private Set<String> joinedUsers;
    private EventDto event;
    private double probability;

    private EventWithProbabilityDto() {
    }


    public static Builder builder() {
        return new Builder();
    }

    public String getAuthor() {
        return author;
    }

    public Set<String> getJoinedUsers() {
        return joinedUsers;
    }

    public EventDto getEvent() {
        return event;
    }

    public double getProbability() {
        return probability;
    }

    public Builder toBuilder() {
        return builder().from(this);
    }

    public static final class Builder {
        private String author;
        private Set<String> joinedUsers;
        private EventDto event;
        private double probability;

        private Builder() {
        }

        public Builder withAuthor(String author) {
            this.author = author;
            return this;
        }

        public Builder withJoinedUsers(Set<String> joinedUsers) {
            this.joinedUsers = joinedUsers;
            return this;
        }

        public Builder withEvent(EventDto event) {
            this.event = event;
            return this;
        }

        public Builder withProbability(double probability) {
            this.probability = probability;
            return this;
        }

        public Builder but() {
            return builder().withAuthor(author).withJoinedUsers(joinedUsers).withEvent(event).withProbability(probability);
        }

        public Builder from(EventWithProbabilityDto from) {
            this.author = from.author;
            this.joinedUsers = from.joinedUsers;
            this.event = from.event;
            this.probability = from.probability;
            return this;
        }

        public EventWithProbabilityDto build() {
            EventWithProbabilityDto eventWithProbabilityDto = new EventWithProbabilityDto();
            eventWithProbabilityDto.joinedUsers = this.joinedUsers;
            eventWithProbabilityDto.author = this.author;
            eventWithProbabilityDto.event = this.event;
            eventWithProbabilityDto.probability = this.probability;
            return eventWithProbabilityDto;
        }
    }
}
