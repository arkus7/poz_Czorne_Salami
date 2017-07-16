package pl.czornesalami.rest.model;

import java.util.Map;


public class ProfileDto {
    private String username;
    private String name;
    private String surname;
    private Map<String, int[]> timetable;
    private int[] places;

    private ProfileDto() {
    }

    public static Builder builder() {
        return new Builder();
    }

    public String getUsername() {
        return username;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public Map<String, int[]> getTimetable() {
        return timetable;
    }

    public int[] getPlaces() {
        return places;
    }


    public Builder toBuilder() {
        return builder().from(this);
    }

    public static final class Builder {
        private String username;
        private String name;
        private String surname;
        private Map<String, int[]> timetable;
        private int[] places;

        private Builder() {
        }

        public Builder withUsername(String username) {
            this.username = username;
            return this;
        }

        public Builder withName(String name) {
            this.name = name;
            return this;
        }

        public Builder withSurname(String surname) {
            this.surname = surname;
            return this;
        }

        public Builder withTimetable(Map<String, int[]> timetable) {
            this.timetable = timetable;
            return this;
        }

        public Builder withPlaces(int[] places) {
            this.places = places;
            return this;
        }

        public Builder but() {
            return builder().withUsername(username).withName(name).withSurname(surname).withTimetable(timetable).withPlaces(places);
        }

        public Builder from(ProfileDto from) {
            this.username = from.username;
            this.name = from.name;
            this.surname = from.surname;
            this.timetable = from.timetable;
            this.places = from.places;
            return this;
        }

        public ProfileDto build() {
            ProfileDto profileDto = new ProfileDto();
            profileDto.name = this.name;
            profileDto.places = this.places;
            profileDto.surname = this.surname;
            profileDto.timetable = this.timetable;
            profileDto.username = this.username;
            return profileDto;
        }
    }
}
