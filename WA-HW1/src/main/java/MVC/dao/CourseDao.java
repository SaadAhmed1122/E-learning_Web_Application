package com.example.elearning_project.MVC.dao;

import com.example.elearning_project.MVC.Bean.CourseBean;
import com.example.elearning_project.MVC.Bean.TeacherBean;
import com.example.elearning_project.MVC.Controller.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CourseDao {
    public String insertCourse(CourseBean courseBean) {
        String cousename= courseBean.getName();

        String desc = courseBean.getDescription();
        String prereq= courseBean.getPrerequistie();

        try {
            Connection con = DatabaseConnection.initializeDatabase();

            PreparedStatement p = null;

            p= con.prepareStatement("insert into lms_course (name,description,prerequistie)" +
                    "values('"+cousename+"','" + desc + "','" + prereq + "')");


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
    public CourseBean getcourseByname(String coursename) {
        CourseBean coursebean = new CourseBean();
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement preparedStatement = con.
                    prepareStatement("select * from lms_course where name=?");
            preparedStatement.setString(1, coursename);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                coursebean.setCourse_id(rs.getInt("course_id"));
                coursebean.setName(rs.getString("name"));
                coursebean.setDescription(rs.getString("description"));
                coursebean.setPrerequistie(rs.getString("prerequistie"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return coursebean;
    }

}
