package com.example.elearning_project.MVC.dao;

import com.example.elearning_project.MVC.Bean.Assign_course_Bean;
import com.example.elearning_project.MVC.Controller.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Assign_course_dao {
    public String assigncoursefun(Assign_course_Bean assign_course_bean) {
        int teacher_id = assign_course_bean.getTeacher_id();
        int course_id= assign_course_bean.getCourse_id();

        try {
            Connection con = DatabaseConnection.initializeDatabase();

            PreparedStatement p = null;

            p= con.prepareStatement("insert into lms_assign_courses (teacher_id,course_id)" +
                    "values('"+teacher_id+"','" + course_id + "')");

            p.executeUpdate();
            p.close();
            con.close();
            return "SUCCESS ASSIGN";
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return "FAIL ASSIGNING";


    }
}
