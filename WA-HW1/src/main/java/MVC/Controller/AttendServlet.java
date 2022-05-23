package MVC.Controller;

import MVC.Bean.Attend_Bean;
import MVC.dao.Attend_dao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/AttendServlet")
public class AttendServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("submit_subject")!= null){
            int student_id = Integer.parseInt(req.getParameter("student_id"));
            int course_id= Integer.parseInt(req.getParameter("genderdropdown_course"));
            boolean approved = false;

            Attend_Bean attendBean = new Attend_Bean(student_id, course_id, approved);
            attendBean.setStudent_id(student_id);
            attendBean.setCourse_id(course_id);
            attendBean.setApproval(approved);

            Attend_dao attenddao= new Attend_dao();
            String registervalidate= attenddao.assignattend(attendBean);

            if(registervalidate.equals("SUCCESSFULLY REGISTER")){
                req.setAttribute("RegisterSuccessMsg",registervalidate);
                RequestDispatcher re = req.getRequestDispatcher("./StudentPanel.jsp");
                re.forward(req,resp);
            }
            else {
                req.setAttribute("RegisterSuccessMsg",registervalidate);
                RequestDispatcher re= req.getRequestDispatcher("./StudentPanel.jsp");
                re.include(req,resp);
            }
        }
    }
}
