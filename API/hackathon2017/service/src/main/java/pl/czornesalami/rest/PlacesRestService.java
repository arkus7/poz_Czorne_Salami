package pl.czornesalami.rest;


import pl.czornesalami.repository.PlacesDao;
import pl.czornesalami.repository.ProfileDao;
import pl.czornesalami.rest.filter.JWTTokenNeeded;
import pl.czornesalami.rest.model.PlacesDto;
import pl.czornesalami.rest.model.ProfileDto;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.Optional;

@Path("/")
public class PlacesRestService {

    @Inject
    private PlacesDao placesDao;

    @GET
    @Path("/places")
    @Produces({MediaType.APPLICATION_JSON + ";charset=utf-8"})
    public Response addOrUpdateProfile() {

        PlacesDto places = placesDao.getPlaces();

        return Response
                .status(Response.Status.OK)
                .entity(places)
                .build();
    }

}
