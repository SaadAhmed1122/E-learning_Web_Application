package resource;

import org.json.JSONObject;

public class Cource {

    final String id;

    private String name;

    public Cource(String id){
        this.id = id;
    }

    public String toString() {return "COURCE - id: %s name: %s".formatted(id, name);}

    public String getId() {return id;}

    public String getName() {return name;}

    public JSONObject toJSON(){
        JSONObject uJson = new JSONObject();
        uJson.put("id", id);
        uJson.put("name", name);
        return uJson;
    }
}
