package pl.czornesalami.repository;


public class RoutePointsDto {
    String points;

    private RoutePointsDto() {
    }


    public static Builder builder() {
        return new Builder();
    }

    public String getPoints() {
        return points;
    }

    public Builder toBuilder() {
        return builder().from(this);
    }

    public static final class Builder {
        String points;

        private Builder() {
        }

        public Builder withPoints(String points) {
            this.points = points;
            return this;
        }

        public Builder but() {
            return builder().withPoints(points);
        }

        public Builder from(RoutePointsDto from) {
            this.points = from.points;
            return this;
        }

        public RoutePointsDto build() {
            RoutePointsDto routePointsDto = new RoutePointsDto();
            routePointsDto.points = this.points;
            return routePointsDto;
        }
    }
}
