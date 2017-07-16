package pl.czornesalami.rest;


import pl.czornesalami.externalapi.google.RouteGetter;
import pl.czornesalami.repository.RoutePointsDto;
import pl.czornesalami.rest.filter.JWTTokenNeeded;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/")
public class RouteRestService {

    @Inject
    private RouteGetter routeGetter;

    @GET
    @Path("/route/{eventId}")
    @Produces({MediaType.APPLICATION_JSON + ";charset=utf-8"})
    @JWTTokenNeeded
    public Response addOrUpdateProfile(@PathParam("eventId") int eventId) {

        RoutePointsDto route = routeGetter.getRoute(eventId);
        return Response
                .status(Response.Status.OK)
                .entity(route)
                .build();
    }
}
