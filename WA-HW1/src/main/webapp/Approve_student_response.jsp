<%@ page import="java.sql.Connection" %>
<%@ page import="MVC.Controller.DatabaseConnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="static java.lang.System.out" %><%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 5/21/2022
  Time: 4:53 PM
  To change this template use File | Settings | File Templates.
--%>

<%
    String c[]= request.getParameterValues("subjects");

    try
    {
        Connection con = DatabaseConnection.initializeDatabase();
        // create a SQL statement
        Statement stmt = con.createStatement();

        // if delete request is made
        if(request.getParameter("reject") != null)
        {
            for(String s:c)
            {
                String qy = "delete from lms_attend where course_id ='" + s + "'";
                stmt.executeUpdate(qy);
            }
        }
        // else if accept request is made
        else if(request.getParameter("accept_subject") != null)
        {
            for(String s:c)
            {
                String qy = "update lms_attend set approved = true where course_id ='" + s + "'";
                stmt.executeUpdate(qy);
            }
        }
    }
    catch(Exception e)
    {
        out.println(e.getMessage());
    }
    response.sendRedirect("Student_subject_request.jsp");				// redirect to requsts' page

%>

