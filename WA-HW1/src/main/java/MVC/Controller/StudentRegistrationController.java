package com.example.elearning_project.MVC.Controller;

import com.example.elearning_project.MVC.Bean.StudentBean;
import com.example.elearning_project.MVC.dao.StudentRegistrationDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/StudentRegistrationController")
public class StudentRegistrationController extends HttpServlet {
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

            String date=req.getParameter("birthday");
            System.out.println("dateString:"+date);


//            String utilDate= null;
//            try {
//                utilDate = (Date) new SimpleDateFormat("yyyy-mm-dd").parse(date);
//            } catch (ParseException e) {
//                e.printStackTrace();
//            }
//            System.out.println("date:"+utilDate);

            StudentBean registrationBean = new StudentBean(name,email_id,password,gender,address,date);
            registrationBean.setName(name);
            registrationBean.setAddress(address);
            registrationBean.setBirthdate(date);
            registrationBean.setGender(gender);
            registrationBean.setEmail(email_id);
            registrationBean.setPassword(password);

            StudentRegistrationDao registrationDao= new StudentRegistrationDao();
            String registervalidate= registrationDao.authorizeRegister(registrationBean);

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
