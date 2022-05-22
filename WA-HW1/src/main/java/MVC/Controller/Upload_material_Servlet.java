package MVC.Controller;

import MVC.Bean.Assign_course_Bean;
import MVC.Bean.CourseBean;
import MVC.Bean.Material_Bean;
import MVC.Bean.TeacherBean;
import MVC.dao.Assign_course_dao;
import MVC.dao.CourseDao;
import MVC.dao.TeacherManagmentDao;
import MVC.dao.Upload_material_dao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/Upload_material_Servlet")
public class Upload_material_Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
        if(req.getParameter("upload_material")!= null){
            String topic=req.getParameter("topic");
            String Description= req.getParameter("Description");
            String link = req.getParameter("link");
            int course_id= Integer.parseInt(req.getParameter("course_id"));
            String teacher_email = req.getParameter("teacher_email");
            TeacherManagmentDao teacherDao= new TeacherManagmentDao();
            TeacherBean teacher_data= teacherDao.getteacherByemail(teacher_email);
            int teacher_id = teacher_data.getTeacher_id();

//            Beans
            Material_Bean material_bean = new Material_Bean(topic,Description,link,course_id,teacher_id);
//            Dao
            Upload_material_dao upload_material_dao = new Upload_material_dao();
            String msg= upload_material_dao.insertmatereial(material_bean);


            if(msg.equals("SUCCESS UPLOAD")){

                //Todo: Error in Redirect
                RequestDispatcher requestDispatcher = req
                        .getRequestDispatcher("./teacher_main.jsp");
                requestDispatcher.forward(req, resp);
            }
            else {
                req.setAttribute("SUCCESS UPLOAD",msg);
                RequestDispatcher re= req.getRequestDispatcher("./Upload_course_material.jsp");
                re.include(req,resp);
            }
        }

    }
}
