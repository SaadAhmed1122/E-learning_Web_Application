package com.example.elearning_project.MVC.dao;


import com.example.elearning_project.MVC.Bean.TeacherBean;
import com.example.elearning_project.MVC.Controller.DatabaseConnection;

import java.sql.*;
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
    public void deletetecher(int teacher_id) {
        try {
            PreparedStatement preparedStatement = con
                    .prepareStatement("delete from lms_teacher where teacher_id=?");
            // Parameters start with 1
            preparedStatement.setInt(1, teacher_id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateteacher(TeacherBean teacher) {
        try {
            PreparedStatement preparedStatement = con
                    .prepareStatement("update lms_teacher set name=?, email=?, gender=?, address=?,password=?" +
                            "where teacher_id=?");
            // Parameters start with 1
            preparedStatement.setString(1, teacher.getName());
            preparedStatement.setString(2, teacher.getEmail());
            preparedStatement.setString(3, teacher.getGender());
            preparedStatement.setString(4, teacher.getAddress());
            preparedStatement.setString(5, teacher.getPassword());
            //preparedStatement.setDate(3, new java.sql.Date(user.getDob().getTime()));
           // preparedStatement.setString(4, user.getEmail());
            //preparedStatement.setInt(5, user.getUserid());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public TeacherBean getteacherByname(String teacher_name) {
        TeacherBean teacher = new TeacherBean();
        try {
            PreparedStatement preparedStatement = con.
                    prepareStatement("select * from lms_teacher where name=?");
            preparedStatement.setString(1, teacher_name);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                teacher.setTeacher_id(rs.getInt("teacher_id"));
                teacher.setName(rs.getString("name"));
                teacher.setEmail(rs.getString("email"));
                teacher.setGender(rs.getString("gender"));
                teacher.setAddress(rs.getString("address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return teacher;
    }



}
