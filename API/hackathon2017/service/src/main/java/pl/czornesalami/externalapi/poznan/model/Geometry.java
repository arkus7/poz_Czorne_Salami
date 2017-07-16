package pl.czornesalami.externalapi.poznan.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true)
public class Geometry {
    private double[] coordinates;

    public double[] getCoordinates() {
        return coordinates;
    }
}
