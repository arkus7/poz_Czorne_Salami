package pl.czornesalami.rest.model;

public class PlaceDto {
    private int id;
    private double[] coordinates;
    private String name;
    private String category;
    private String address;
    private String city;

    private String imageUrl;
    private String description;

    private PlaceDto() {
    }


    public static Builder builder() {
        return new Builder();
    }

    public int getId() {
        return id;
    }

    public double[] getCoordinates() {
        return coordinates;
    }

    public String getName() {
        return name;
    }

    public String getCategory() {
        return category;
    }

    public String getAddress() {
        return address;
    }

    public String getCity() {
        return city;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public String getDescription() {
        return description;
    }

    public Builder toBuilder() {
        return builder().from(this);
    }

    public static final class Builder {
        private int id;
        private double[] coordinates;
        private String name;
        private String category;
        private String address;
        private String city;
        private String imageUrl;
        private String description;

        private Builder() {
        }

        public Builder withId(int id) {
            this.id = id;
            return this;
        }

        public Builder withCoordinates(double[] coordinates) {
            this.coordinates = coordinates;
            return this;
        }

        public Builder withName(String name) {
            this.name = name;
            return this;
        }

        public Builder withCategory(String category) {
            this.category = category;
            return this;
        }

        public Builder withAddress(String address) {
            this.address = address;
            return this;
        }

        public Builder withCity(String city) {
            this.city = city;
            return this;
        }

        public Builder withImageUrl(String imageUrl) {
            this.imageUrl = imageUrl;
            return this;
        }

        public Builder withDescription(String description) {
            this.description = description;
            return this;
        }

        public Builder but() {
            return builder().withId(id).withCoordinates(coordinates).withName(name).withCategory(category).withAddress(address).withCity(city).withImageUrl(imageUrl).withDescription(description);
        }

        public Builder from(PlaceDto from) {
            this.id = from.id;
            this.coordinates = from.coordinates;
            this.name = from.name;
            this.category = from.category;
            this.address = from.address;
            this.city = from.city;
            this.imageUrl = from.imageUrl;
            this.description = from.description;
            return this;
        }

        public PlaceDto build() {
            PlaceDto place = new PlaceDto();
            place.imageUrl = this.imageUrl;
            place.description = this.description;
            place.id = this.id;
            place.address = this.address;
            place.city = this.city;
            place.name = this.name;
            place.category = this.category;
            place.coordinates = this.coordinates;
            return place;
        }
    }
}
