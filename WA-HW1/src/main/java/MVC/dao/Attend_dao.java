package MVC.dao;

import MVC.Bean.Attend_Bean;
import MVC.Bean.TeacherBean;
import MVC.Controller.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Attend_dao {
    public String assignattend(Attend_Bean assign_attend_bean) {
        int student_id = assign_attend_bean.getStudent_id();
        int course_id= assign_attend_bean.getCourse_id();
        boolean approval = assign_attend_bean.isApproval();

        try {
            Connection con = DatabaseConnection.initializeDatabase();

            PreparedStatement p = null;

            p= con.prepareStatement("insert into lms_attend (student_id, course_id, approved)" +
                    "values('" + student_id + "','" + course_id + "','" + approval + "')");

            p.executeUpdate();
            p.close();
            con.close();
            return "SUCCESSFULLY REGISTER";
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return "FAIL ASSIGNING";
    }
}
