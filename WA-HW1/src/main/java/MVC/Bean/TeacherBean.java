package MVC.Bean;

public class TeacherBean {
    int teacher_id;
    String name,email,password,gender,address;

    public TeacherBean() {
    }

    public TeacherBean(String name, String email, String password, String gender, String address) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.address = address;
    }

    public int getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
