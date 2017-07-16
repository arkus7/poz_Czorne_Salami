package pl.czornesalami.rest;


import pl.czornesalami.jwt.JwtAdapter;
import pl.czornesalami.repository.LoginDao;
import pl.czornesalami.rest.model.LoginRequestDto;

import javax.crypto.KeyGenerator;
import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import static javax.ws.rs.core.HttpHeaders.AUTHORIZATION;

@Path("/")
public class LoginRestService {

    @Inject
    private LoginDao loginDao;

    @Inject
    private JwtAdapter jwtAdapter;

    @POST
    @Path("/login")
    @Consumes({MediaType.APPLICATION_JSON + ";charset=utf-8"})
    public Response login(LoginRequestDto data) {
        if(loginDao.login(data.getUsername(), data.getPassword())) {
            return Response
                    .noContent() //TODO: add info accountIsEmpty
                    .header(AUTHORIZATION, "Bearer " + jwtAdapter.generateToken(data.getUsername()))
                    .build();
        }
        return Response
                .status(Response.Status.UNAUTHORIZED)
                .build();
    }
}
