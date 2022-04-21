package dao;

import com.example.webtoreregistration.MVC.Bean.TeacherBean;
import com.example.webtoreregistration.MVC.Controller.DatabaseConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TeacherManagmentDao {
    Connection con;

    {
        try {
            con = DatabaseConnection.initializeDatabase();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


    public List<TeacherBean> getAllUsers() {
        List<TeacherBean> users = new ArrayList<TeacherBean>();
        try {
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from lms_teacher");
            while (rs.next()) {
                TeacherBean teacherBean = new TeacherBean();
                teacherBean.setTeacher_id(rs.getInt("teacher_id"));
                teacherBean.setName(rs.getString("name"));
                teacherBean.setEmail(rs.getString("email"));
                teacherBean.setGender(rs.getString("gender"));
                teacherBean.setAddress(rs.getString("address"));
                users.add(teacherBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

}
