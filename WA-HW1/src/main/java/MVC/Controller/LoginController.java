package com.example.elearning_project.MVC.Controller;

import com.example.elearning_project.MVC.Bean.LoginBean;
import com.example.elearning_project.MVC.dao.LoginDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        if(request.getParameter("btn_login")!=null){
            String email= request.getParameter("txt_email");
            String password = request.getParameter("txt_password");

            LoginBean loginBean = new LoginBean();
            loginBean.setEmail_id(email);
            loginBean.setPassword(password);

            LoginDao loginDao = new LoginDao();
            String authorize = loginDao.authorizeLogin(loginBean);

            if(authorize.equals("SUCCESS LOGIN")){
                HttpSession session = request.getSession();
                session.setAttribute("login",loginBean.getEmail_id());
                RequestDispatcher rd= request.getRequestDispatcher("StudentPanel.jsp");
                rd.forward(request,response);

            }
            else if(authorize.equals("SUCCESS LOGIN ADMIN")){
                HttpSession session = request.getSession();
                session.setAttribute("login_admin",loginBean.getEmail_id());
                RequestDispatcher rd= request.getRequestDispatcher("Adminpage.jsp");
                rd.forward(request,response);

            }

            else{
                request.setAttribute("WrongLoginMsg",authorize);
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.include(request,response);
            }

        }
    }
}
