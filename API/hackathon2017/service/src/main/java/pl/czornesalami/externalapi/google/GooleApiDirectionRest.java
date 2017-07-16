package pl.czornesalami.externalapi.google;


import pl.czornesalami.externalapi.google.model.Routes;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

@Path("/maps/api/directions")
public interface GooleApiDirectionRest {


    @GET
    @Path("/json")
    @Produces({MediaType.APPLICATION_JSON})
    Routes getRoute(
            @QueryParam("origin") String startAddress,
            @QueryParam("destination") String endAddress,
            @QueryParam("waypoints") String waypoints,
            @QueryParam("key") String googleApiKey,
            @QueryParam("avoid") String avoid,
            @QueryParam("mode") String mode
    );
}
