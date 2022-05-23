package resource;

public class Park {

    final String name;
    private String email;
    private String address;

    public Park(String name) {
        this.name = name;
    }

    public Park(String name, String email, String address) {
        this.name = name;
        this.email = email;
        this.address = address;
    }

    public String toString(){
        return "park: %s email: %s address: %s".formatted(name, name, address);
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }
}
