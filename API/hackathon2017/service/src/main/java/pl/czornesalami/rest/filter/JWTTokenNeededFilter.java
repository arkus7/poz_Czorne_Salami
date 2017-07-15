package pl.czornesalami.rest.filter;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import pl.czornesalami.jwt.JwtAdapter;
import pl.czornesalami.repository.LoginDao;

import javax.annotation.Priority;
import javax.inject.Inject;
import javax.ws.rs.Priorities;
import javax.ws.rs.container.ContainerRequestContext;
import javax.ws.rs.container.ContainerRequestFilter;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.Provider;
import java.io.IOException;

@Provider
@JWTTokenNeeded
@Priority(Priorities.AUTHENTICATION)
public class JWTTokenNeededFilter implements ContainerRequestFilter {

    @Inject
    private JwtAdapter jwtAdapter;

    @Inject
    private LoginDao loginDao;

    @Override
    public void filter(ContainerRequestContext requestContext) throws IOException {

        // Get the HTTP Authorization header from the request
        String authorizationHeader = requestContext.getHeaderString(HttpHeaders.AUTHORIZATION);

        // Extract the token from the HTTP Authorization header
        String token = authorizationHeader.substring("Bearer".length()).trim();

        try {
            Jws<Claims> claim = jwtAdapter.getClaim(token);
            String username = claim.getBody().getSubject();

            if(!loginDao.usernameExists(username)) {
                throw new Exception("Username does not exist!");
            }

            requestContext.getHeaders().add("username", username);
        } catch (Exception ex) {
            requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).build());
        }


    }
}