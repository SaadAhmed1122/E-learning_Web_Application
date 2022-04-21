package servlet;

import bean.StudentBean;
import dao.StudentManagmentDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/StudentManagmentServlet")
public class StudentManagmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public StudentManagmentDao studentManagmentDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
//                case "/insert":
//                    insertstd(request, response);
//                    break;
                case "/delete":
                    deletestd(request, response);
                    break;
//                case "/edit":
//                    showEditstd(request, response);
//                    break;
                case "/update":
                    updatestd(request, response);
                    break;
                default:
                    //liststd(request, response);
                    showstudenttable(request,response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }



}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    private void liststd(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        List<StudentBean> liststd = studentManagmentDao.listAllstudents();
         request.setAttribute("liststd", liststd);
         RequestDispatcher dispatcher = request.getRequestDispatcher("UserView.jsp");
         dispatcher.forward(request, response);

    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
    }
    private void showstudenttable(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        PrintWriter out = response.getWriter();
//        response.setContentType("text/html");
//        out.println("<html><body>");
//        try
//        {
//            Connection con = DatabaseConnection.initializeDatabase();
//            // Here dsnname- mydsn,user id- system(for oracle 10g),password is pintu.
//            Statement stmt = con.createStatement();
//            ResultSet rs = stmt.executeQuery("select * from students");
//            out.println("<table border=1 width=50% height=50%>");
//            out.println("<tr><th>Std Id</th><th>Name</th><th>Email</th><th>Approval</th><th>Action</th><tr>");
//            while (rs.next())
//            {
//                String name = rs.getString("name");
//                String email = rs.getString("email_id");
//                boolean approval = rs.getBoolean("approval");
//                int s = rs.getInt("id");
//                out.println("<tr><td>" + s + "</td><td>" + name + "</td><td>" + email + "</td><td>"+ approval + "</td><td>"+"Edit\tDelete"+"</td></tr>");
//            }
//            out.println("</table>");
//            out.println("</html></body>");
//            con.close();
//        }
//        catch (Exception e)
//        {
//            out.println("error");
//        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("UserView.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        StudentBean existingstd = studentManagmentDao.getstd(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        request.setAttribute("std", existingstd);
        dispatcher.forward(request, response);

    }

//    private void insertstd(HttpServletRequest request, HttpServletResponse response)
//            throws SQLException, IOException {
//        String name = request.getParameter("name");
//        String email = request.getParameter("email");
//        boolean approval = Boolean.parseBoolean((request.getParameter("approval")));
//
//        StudentsBean newstd = new StudentsBean(name, email, approval);
//        stdDAO.insertstd(newstd);
//        response.sendRedirect("list");
//    }

    private void updatestd(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        boolean approval = Boolean.parseBoolean((request.getParameter("approval")));

       // StudentBean stdbean = new StudentBean(name, email, approval, id);
       // studentManagmentDao.updatestudent(stdbean);
        response.sendRedirect("list");
    }

    private void deletestd(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

      //  StudentsBean stdbean = new StudentsBean(id);
       // studentManagmentDao.deleteStudent(stdbean);
        response.sendRedirect("list");

    }

}
