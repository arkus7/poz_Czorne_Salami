package pl.czornesalami.rest.model.adapter;

import javax.xml.bind.annotation.adapters.XmlAdapter;
import java.time.LocalDateTime;

public class LocalDateTimeAdapter  extends XmlAdapter<String, LocalDateTime> {

    @Override
    public LocalDateTime unmarshal(String v) throws Exception {
        if (v == null) {
            return null;
        }
        try {
            return LocalDateTime.parse(v);
        } catch (Exception ex) {
            return LocalDateTime.now();
        }
    }

    @Override
    public String marshal(LocalDateTime v) throws Exception {
        if (v == null) {
            return null;
        }
        return v.toString();
    }
}
