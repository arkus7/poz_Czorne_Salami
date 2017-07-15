package pl.czornesalami.rest.model;

import java.util.Map;


public class ProfileDto {
    private String name;
    private String surname;
    private Map<String, int[]> timetable;
    private int[] places;

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
}
