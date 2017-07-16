package pl.czornesalami.externalapi.google.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Routes {
    private List<Route> routes;

    public List<Route> getRoutes() {
        return routes;
    }
}
