package MVC.Controller;

import MVC.Bean.Attend_Bean;
import MVC.Bean.MessagingBean;
import MVC.dao.Attend_dao;
import MVC.dao.MessagingDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/MessagingController")
public class MessagingController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("btn_send")!= null){
            int student_id = Integer.parseInt(req.getParameter("student_id"));
            int teacher_id= Integer.parseInt(req.getParameter("teacherdropdown"));
            String topic=req.getParameter("topic");
            String text=req.getParameter("text");

            MessagingBean messageBean = new MessagingBean(student_id, teacher_id, topic, text);
            messageBean.setStudent_id(student_id);
            messageBean.setTeacher_id(teacher_id);
            messageBean.setTopic(topic);
            messageBean.setText(text);

            MessagingDao messagedao= new MessagingDao();
            String registervalidate= messagedao.sendmessage(messageBean);

            if(registervalidate.equals("SUCCESSFULLY SENT")){
                req.setAttribute("RegisterSuccessMsg",registervalidate);
                RequestDispatcher re = req.getRequestDispatcher("./MessageTeacher.jsp");
                re.forward(req,resp);
            }
            else {
                req.setAttribute("RegisterSuccessMsg",registervalidate);
                RequestDispatcher re= req.getRequestDispatcher("./MessageTeacher.jsp");
                re.include(req,resp);
            }
        }
    }
}
