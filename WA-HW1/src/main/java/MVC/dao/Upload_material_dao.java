package MVC.dao;

import MVC.Bean.CourseBean;
import MVC.Bean.Material_Bean;
import MVC.Controller.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Upload_material_dao {
    public String insertmatereial(Material_Bean material_bean) {
        String topic= material_bean.getTopic();
        String text= material_bean.getText();
        String link = material_bean.getImg_file();
        int course_id = material_bean.getCourse_id();
        int teacher_id = material_bean.getTeacher_id();
        try {
            Connection con = DatabaseConnection.initializeDatabase();

            PreparedStatement p = null;

            p= con.prepareStatement("insert into lms_material (topic,text,img_file,course_id,teacher_id)" +
                    "values('"+topic+"','" + text + "','" + link + "','" + course_id + "','" + teacher_id + "')");


            p.executeUpdate();
            p.close();
            con.close();
            return "SUCCESS UPLOAD";
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return "FAIL UPLOAD";


    }
}
