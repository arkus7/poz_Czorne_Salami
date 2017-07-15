package pl.czornesalami.rest.app;

import pl.czornesalami.rest.LoginRestService;

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
        return resources;
    }

}
