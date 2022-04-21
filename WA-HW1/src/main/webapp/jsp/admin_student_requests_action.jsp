<%@ page language="java" import="java.sql.*"%>
<%@ page import="com.example.webtoreregistration.MVC.Controller.DatabaseConnection" %>

<%

	String c[]= request.getParameterValues("ad");

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
				String qy = "delete from lms_student where student_id ='" + s + "'";
				stmt.executeUpdate(qy);
			}
		}
		// else if accept request is made
		else if(request.getParameter("accept") != null)
		{
			for(String s:c)
			{
				String qy = "update lms_student set approved = true where student_id ='" + s + "'";
				stmt.executeUpdate(qy);
			}
		}
	}
	catch(Exception e)
	{
		out.println(e.getMessage());
	}
	response.sendRedirect("admin_student_requests.jsp");				// redirect to requsts' page
%>