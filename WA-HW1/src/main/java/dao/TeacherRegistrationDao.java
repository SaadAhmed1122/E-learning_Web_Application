package dao;


import bean.TeacherBean;
import controller.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TeacherRegistrationDao {
    public String authorizeRegister(TeacherBean registrationBean) {
        String name= registrationBean.getName();

        String email = registrationBean.getEmail();
        String address= registrationBean.getAddress();
        String gender = registrationBean.getGender();
        String password = registrationBean.getPassword();

        try {
            Connection con = DatabaseConnection.initializeDatabase();

            PreparedStatement p = null;

            p= con.prepareStatement("insert into lms_teacher (name,email,password,gender,address)" +
                    "values('"+name+"','" + email + "','" + password + "','" + gender + "','" + address + "')");


            p.executeUpdate();
            p.close();
            con.close();
            return "SUCCESS REGISTER";
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return "FAIL REGISTER";


    }

}
