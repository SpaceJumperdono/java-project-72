package hexlet.code.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Url {
    private long id;
    private String name;
    private String timestamp;

    public Url(String name, String timestamp) {
        this.name = name;
        this.timestamp = timestamp;
    }
}
