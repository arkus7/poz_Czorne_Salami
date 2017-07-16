package pl.czornesalami.rest.model;

import java.util.Collections;
import java.util.List;


public class PlacesDto {
    private List<PlaceDto> places = Collections.emptyList();

    private PlacesDto() {
    }


    public static Builder builder() {
        return new Builder();
    }

    public List<PlaceDto> getPlaces() {
        return places;
    }

    public Builder toBuilder() {
        return builder().from(this);
    }

    public static final class Builder {
        private List<PlaceDto> places = Collections.emptyList();

        private Builder() {
        }

        public Builder withPlaces(List<PlaceDto> places) {
            this.places = places;
            return this;
        }

        public Builder but() {
            return builder().withPlaces(places);
        }

        public Builder from(PlacesDto from) {
            this.places = from.places;
            return this;
        }

        public PlacesDto build() {
            PlacesDto places = new PlacesDto();
            places.places = this.places;
            return places;
        }
    }
}
