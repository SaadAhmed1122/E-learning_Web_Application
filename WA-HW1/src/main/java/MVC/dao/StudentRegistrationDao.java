package MVC.dao;


import MVC.Bean.StudentBean;
import MVC.Controller.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentRegistrationDao {

    public String authorizeRegister(StudentBean registrationBean) {
        String name= registrationBean.getName();

        String email = registrationBean.getEmail();
        String address= registrationBean.getAddress();
        String date1= registrationBean.getBirthdate();
        String gender = registrationBean.getGender();
        String password = registrationBean.getPassword();
        boolean approval =false;



        try {
            Connection con = DatabaseConnection.initializeDatabase();

            PreparedStatement p = null;

            p= con.prepareStatement("insert into lms_student (name,email,password,gender,birthdate,address,approved)" +
                    "values('"+name+"','" + email + "','" + password + "','" + gender + "','" + date1 + "','" + address + "','" + approval + "')");

//            p.setString(1,name);
//            p.setString(2,email);
//            p.setString(3,password);
//            p.setString(4, String.valueOf(approval));
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
