package pl.czornesalami.rest;


import pl.czornesalami.jwt.JwtAdapter;
import pl.czornesalami.repository.LoginDao;
import pl.czornesalami.repository.ProfileDao;
import pl.czornesalami.rest.filter.JWTTokenNeeded;
import pl.czornesalami.rest.model.LoginRequestDto;
import pl.czornesalami.rest.model.ProfileDto;

import javax.inject.Inject;
import javax.validation.constraints.NotNull;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import java.util.Optional;

import static javax.ws.rs.core.HttpHeaders.AUTHORIZATION;

@Path("/")
public class ProfileRestService {

    @Inject
    private ProfileDao profileDao;

    @POST
    @Path("/profile")
    @Consumes({MediaType.APPLICATION_JSON + ";charset=utf-8"})
    @JWTTokenNeeded
    public Response addOrUpdateProfile(
            @HeaderParam("username") String username,
            @NotNull ProfileDto data) {

        profileDao.addOrUpdateProfile(username, data.toBuilder().withUsername(username).build());

        return Response
                .status(Response.Status.CREATED)
                .build();
    }

    @GET
    @Path("/profile")
    @Produces({MediaType.APPLICATION_JSON + ";charset=utf-8"})
    @JWTTokenNeeded
    public Response getProfile(@HeaderParam("username") String username) {

        Optional<ProfileDto> profile = profileDao.getProfile(username);

        if(profile.isPresent()) {
            return Response
                    .status(Response.Status.CREATED)
                    .entity(profile.get())
                    .build();
        }
        return Response
                .status(Response.Status.NOT_FOUND)
                .build();
    }
}
