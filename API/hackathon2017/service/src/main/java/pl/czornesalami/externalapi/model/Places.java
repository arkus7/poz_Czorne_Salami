package pl.czornesalami.externalapi.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Places {
    private List<Place> features;

    public List<Place> getFeatures() {
        return features;
    }
}
