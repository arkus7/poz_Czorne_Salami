package pl.czornesalami.externalapi.google.model;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class OverviewPolyline {
    private String points;

    public String getPoints() {
        return points;
    }
}
