package pl.czornesalami.externalapi.poznan.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Place {
    private Geometry geometry;
    private int id;
    private Properties properties;

    public Geometry getGeometry() {
        return geometry;
    }

    public int getId() {
        return id;
    }

    public Properties getProperties() {
        return properties;
    }
}
