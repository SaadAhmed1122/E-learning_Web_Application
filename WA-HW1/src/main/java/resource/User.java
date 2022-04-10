package resource;

import org.json.JSONObject;

public class User {
    final String email;
    private String password;
    private String first_name;
    private String last_name;
    private String role;

    public User(String email){
        this.email = email;
    }

    public User(String email, String password){
        this.email = email;
        this.password = password;
    }

    public User(String email, String first_name, String last_name, String role) {
        this.email = email;
        this.first_name = first_name;
        this.last_name = last_name;
        this.role = role;
    }

    public User(String email, String password, String first_name, String last_name, String role) {
        this.email = email;
        this.password = password;
        this.first_name = first_name;
        this.last_name = last_name;
        this.role = role;
    }


    public String toString(){
        return "USER - email: %s first name: %s last name: %s role: %s".formatted(email, first_name, last_name, role);
    }


    public String getEmail() {
        return email;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public String getRole() {
        return role;
    }

    public String getPassword() {
        return password;
    }



    public JSONObject toJSON(){
        JSONObject uJson = new JSONObject();
        uJson.put("email", email);
        uJson.put("first_name", first_name);
        uJson.put("last_name", last_name);
        uJson.put("role", role);

        return uJson;
    }
}
