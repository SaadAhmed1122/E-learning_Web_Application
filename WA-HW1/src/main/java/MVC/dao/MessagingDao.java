package MVC.dao;

import MVC.Bean.Attend_Bean;
import MVC.Bean.MessagingBean;
import MVC.Controller.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MessagingDao {
    public String sendmessage(MessagingBean message_bean) {
        int student_id = message_bean.getStudent_id();
        int teacher_id= message_bean.getTeacher_id();
        String topic = message_bean.getTopic();
        String text =  message_bean.getText();

        try {
            Connection con = DatabaseConnection.initializeDatabase();

            PreparedStatement p = null;

            p= con.prepareStatement("insert into lms_message (student_id, teacher_id, topic, text)" +
                    "values('" + student_id + "','" + teacher_id + "','" + topic + "','" + text + "')");

            p.executeUpdate();
            p.close();
            con.close();
            return "SUCCESSFULLY SENT";
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return "FAIL SENT";
    }
}
