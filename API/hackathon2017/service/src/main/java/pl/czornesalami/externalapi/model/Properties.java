package pl.czornesalami.externalapi.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.xml.bind.annotation.XmlElement;


@JsonIgnoreProperties(ignoreUnknown = true)
public class Properties {
    @JsonProperty("nazwa")
    private String name;

    @JsonProperty("opis_klasy")
    private String categoryName;

    @JsonProperty("adres")
    private String address;

    @JsonProperty("miasto")
    private String city;

    @JsonProperty("id_klasy")
    private int categoryId;

    @JsonProperty("opis")
    private String description;

    public String getName() {
        return name;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public String getAddress() {
        return address;
    }

    public String getCity() {
        return city;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public String getDescription() {
        return description;
    }
}
