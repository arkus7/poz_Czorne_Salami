package pl.czornesalami.rest;


import pl.czornesalami.repository.EventDao;
import pl.czornesalami.rest.filter.JWTTokenNeeded;
import pl.czornesalami.rest.model.EventDto;
import pl.czornesalami.rest.model.EventWithProbabilityDto;
import pl.czornesalami.rest.model.EventsDto;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/")
public class EventRestService {

    @Inject
    private EventDao eventDao;

    @POST
    @Path("/event")
    @Consumes({MediaType.APPLICATION_JSON + ";charset=utf-8"})
    @JWTTokenNeeded
    public Response addOrUpdateProfile(@HeaderParam("username") String username, EventDto data) {

        eventDao.addEvent(username, data);

        return Response
                .status(Response.Status.CREATED)
                .build();
    }

    @GET
    @Path("/event")
    @Produces({MediaType.APPLICATION_JSON + ";charset=utf-8"})
    @JWTTokenNeeded
    public Response getEvents(@HeaderParam("username") String username) {

        List<EventWithProbabilityDto> eventsWithProbability = eventDao.getEventsWithProbability(username);

        return Response
                .status(Response.Status.OK)
                .entity(EventsDto.builder()
                        .withEvents(eventsWithProbability)
                        .build())
                .build();
    }

    @POST
    @Path("/event/join/{id}")
    @JWTTokenNeeded
    public Response joinToEvent(@HeaderParam("username") String username, @PathParam("id") int id) {

        eventDao.joinToEvent(username, id);

        return Response
                .status(Response.Status.CREATED)
                .build();
    }

}
