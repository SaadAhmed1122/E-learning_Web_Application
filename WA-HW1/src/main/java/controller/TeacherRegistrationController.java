package controller;

import bean.TeacherBean;

import dao.TeacherRegistrationDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/TeacherRegistrationController")
public class TeacherRegistrationController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("btn_register")!= null){
            String name=req.getParameter("name");
            String email_id= req.getParameter("email");
            String password = req.getParameter("password");
            String gender=null;
            if(req.getParameter("genderdropdown")!=null)
            {
                gender=(req.getParameter("genderdropdown"));
            }
            String address= req.getParameter("address");

            TeacherBean teacherBean = new TeacherBean(name,email_id,password,gender,address);
            teacherBean.setName(name);
            teacherBean.setAddress(address);
            teacherBean.setGender(gender);
            teacherBean.setEmail(email_id);
            teacherBean.setPassword(password);

            TeacherRegistrationDao teacherdao= new TeacherRegistrationDao();
            String registervalidate= teacherdao.authorizeRegister(teacherBean);

            if(registervalidate.equals("SUCCESS REGISTER")){
                req.setAttribute("RegisterSuccessMsg",registervalidate);
                RequestDispatcher re = req.getRequestDispatcher("./Adminpage.jsp");
                re.forward(req,resp);
            }
            else {
                req.setAttribute("RegisterSuccessMsg",registervalidate);
                RequestDispatcher re= req.getRequestDispatcher("./register.jsp");
                re.include(req,resp);
            }
        }
    }
}

