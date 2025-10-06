package hexlet.code.model;

import lombok.Getter;
import lombok.Setter;
import java.sql.Timestamp;

@Getter
@Setter
public class Url {
    private long id;
    private String name;
    private Timestamp timestamp;

    public Url(String name, Timestamp timestamp) {
        this.name = name;
        this.timestamp = timestamp;
    }
}
