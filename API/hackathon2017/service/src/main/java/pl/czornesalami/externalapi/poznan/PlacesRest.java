package pl.czornesalami.externalapi.poznan;

import pl.czornesalami.externalapi.poznan.model.Places;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

@Path("/mim/plan/")
public interface PlacesRest {

    @GET
    @Path("map_service.html")
    @Produces({MediaType.APPLICATION_JSON})
    Places getPlaces(@QueryParam("mtype") String mtype,
                @QueryParam("co") String co,
                @QueryParam("class_id") int classId);

}
