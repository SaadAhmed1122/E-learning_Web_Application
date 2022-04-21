package dao;


import com.example.webtoreregistration.MVC.Bean.LoginBean;
import com.example.webtoreregistration.MVC.Controller.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {
    public String authorizeLogin(LoginBean loginBean)
    {
        String email= loginBean.getEmail_id();
        String password= loginBean.getPassword();

        String dbemail="";
        String dbpassword="";

        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement pstm= null;
            PreparedStatement pstm2= null;
           // Statement stmt = con.createStatement();
            pstm = con.prepareStatement("select * from lms_student " +
                    "where email=? and password=('"+password+"')");

            pstm2 = con.prepareStatement("select * from lms_admin " +
                    "where email=? and password=('"+password+"')");

           //// pstm= con.prepareStatement("select * from students where email_id = " + email + " and password = ('" + password + "')");

            //String sql="select * from students where email_id = " + email + " and password = ('" + password + "')";
            //ResultSet rs = stmt.executeQuery (sql);

            pstm.setString(1,email);;
            pstm2.setString(1,email);;

           ResultSet rs= pstm.executeQuery();
           ResultSet rs2= pstm2.executeQuery();

            if (rs.next()){
                dbemail= rs.getString("email");
                dbpassword= rs.getString("password");

//                if(!rs.getBoolean("approval"))
//                {
//                    System.out.println("Authontication is not approved");
//                       }
                // if request is accepted by Admin
                  if(rs.getBoolean("approved"))
                    {
                        return "SUCCESS LOGIN";
                    }
//                if(email.equals(dbemail) && password.equals(dbpassword)){
//                    return "SUCCESS LOGIN";
//                }
            }
                else if (rs2.next()){
                    return "SUCCESS LOGIN ADMIN";
                }
                pstm2.close();
            pstm.close();

            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return "WRONG EMAIL AND PASSWORD";
    }
}
