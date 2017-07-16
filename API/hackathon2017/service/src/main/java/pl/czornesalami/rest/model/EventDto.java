package pl.czornesalami.rest.model;

import pl.czornesalami.rest.model.adapter.LocalDateTimeAdapter;

import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;
import java.time.LocalDateTime;

public class EventDto {
    private int id;
    private String title;
    private String descripton;
    @XmlJavaTypeAdapter(LocalDateTimeAdapter.class)
    private LocalDateTime dateTime;
    private int startPlace;
    private int endPlace;
    private int[] wayPoints;

    private EventDto() {
    }


    public static Builder builder() {
        return new Builder();
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDescripton() {
        return descripton;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public int getStartPlace() {
        return startPlace;
    }

    public int getEndPlace() {
        return endPlace;
    }

    public int[] getWayPoints() {
        return wayPoints;
    }

    public Builder toBuilder() {
        return builder().from(this);
    }

    public static final class Builder {
        private int id;
        private String title;
        private String descripton;
        private LocalDateTime dateTime;
        private int startPlace;
        private int endPlace;
        private int[] wayPoints;

        private Builder() {
        }

        public Builder withId(int id) {
            this.id = id;
            return this;
        }

        public Builder withTitle(String title) {
            this.title = title;
            return this;
        }

        public Builder withDescripton(String descripton) {
            this.descripton = descripton;
            return this;
        }

        public Builder withDateTime(LocalDateTime dateTime) {
            this.dateTime = dateTime;
            return this;
        }

        public Builder withStartPlace(int startPlace) {
            this.startPlace = startPlace;
            return this;
        }

        public Builder withEndPlace(int endPlace) {
            this.endPlace = endPlace;
            return this;
        }

        public Builder withWayPoints(int[] wayPoints) {
            this.wayPoints = wayPoints;
            return this;
        }

        public Builder but() {
            return builder().withId(id).withTitle(title).withDescripton(descripton).withDateTime(dateTime).withStartPlace(startPlace).withEndPlace(endPlace).withWayPoints(wayPoints);
        }

        public Builder from(EventDto from) {
            this.id = from.id;
            this.title = from.title;
            this.descripton = from.descripton;
            this.dateTime = from.dateTime;
            this.startPlace = from.startPlace;
            this.endPlace = from.endPlace;
            this.wayPoints = from.wayPoints;
            return this;
        }

        public EventDto build() {
            EventDto eventDto = new EventDto();
            eventDto.title = this.title;
            eventDto.id = this.id;
            eventDto.dateTime = this.dateTime;
            eventDto.wayPoints = this.wayPoints;
            eventDto.descripton = this.descripton;
            eventDto.startPlace = this.startPlace;
            eventDto.endPlace = this.endPlace;
            return eventDto;
        }
    }
}
