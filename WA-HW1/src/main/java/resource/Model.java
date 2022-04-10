package resource;

public class Model {

    private final String name;
    private String description;

    public Model(String name){
        this.name = name;
    }

    public Model(String name, String description){
        this.name = name;
        this.description = description;
    }

    public String toString(){
        return "MODEL - name: %s description: %s".formatted(name, description);
    }


    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }
}
