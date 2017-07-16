package pl.czornesalami.rest.app;

import pl.czornesalami.rest.*;
import pl.czornesalami.rest.filter.JWTTokenNeededFilter;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;

@ApplicationPath("/")
public class MainWebApplication extends Application {

    public MainWebApplication() {
    }

    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> resources = new HashSet<>();
        resources.addAll(addRestResourceClasses());
        return resources;
    }

    private Set<Class<?>> addRestResourceClasses() {
        Set<Class<?>> resources = new HashSet<>();
        resources.add(LoginRestService.class);
        resources.add(ProfileRestService.class);
        resources.add(PlacesRestService.class);
        resources.add(EventRestService.class);
        resources.add(RouteRestService.class);
        resources.add(JWTTokenNeededFilter.class);
        return resources;
    }

}
