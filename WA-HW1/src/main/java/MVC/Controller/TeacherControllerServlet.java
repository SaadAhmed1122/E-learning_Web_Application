package MVC.Controller;


import MVC.Bean.TeacherBean;
import MVC.dao.TeacherManagmentDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/TeacherControllerServlet")
public class TeacherControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/teacher_register.jsp";
    private static String LIST_USER = "/TeacherList.jsp";
    private static String UPDATE_TEACHER = "/teacher_update.jsp";
    private TeacherManagmentDao dao;

    public TeacherControllerServlet() {
        super();
        dao = new TeacherManagmentDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
//        String forward="";
//        String action = req.getParameter("action");
//        if (action.equalsIgnoreCase("delete")){
//            int teacher_id =
//                    Integer.parseInt(req.getParameter("teacher_id"));
//            //dao.deleteUser(teacher_id);
//            forward = LIST_USER;
//            req.setAttribute("teachers", dao.getAllUsers());
//        } else if (action.equalsIgnoreCase("edit")){
//            forward = UPDATE_TEACHER;
//            int teacher_id =
//                    Integer.parseInt(req.getParameter("teacher_id"));
//            TeacherBean user = dao.getteacherById(teacher_id);
//            req.setAttribute("teacher", user);
//
//        } else if (action.equalsIgnoreCase("listUser")){
//            forward = LIST_USER;
//            req.setAttribute("teachers", dao.getAllUsers());
//        } else {
//            //forward = INSERT_OR_EDIT;
//            forward = LIST_USER;
//        }
//        RequestDispatcher view = req.getRequestDispatcher(forward);
//        view.forward(req, resp);
}

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);

    }
}
