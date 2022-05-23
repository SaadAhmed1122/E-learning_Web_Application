<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@ page import="MVC.Controller.DatabaseConnection" %>

<html>
    <head>
        <meta charset="utf-8">
         <title>E-Learning</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="styling/main.css" rel="stylesheet">
    </head>

    <body>
    <%
        if(session.getAttribute("login_admin")==null || session.getAttribute("login_admin")=="")
        {
            response.sendRedirect("index.jsp");
        }

    %>
    <%@ include file="styling/header.jsp" %>

    <h3>Request</h3>
    <div class="progress-table">
                    <form class="form-default" action="admin_student_requests_action.jsp" method="POST">
                        <div class="table-head">
                            <div class="id">Student Id</div>
                            <div class="name">Name</div>
                            <div class="email">Email</div>
                            <div class="gender">Gender</div>
                            <div class="dob">BirthDate</div>
                            <div class="address">Address</div>
                            <div class="accept">Accept / Decline</div>
                        </div>



                        <%
		try
		{
            Connection con = DatabaseConnection.initializeDatabase();

            // create a SQL statement
			Statement stmt = con.createStatement();
			String sql = "select student_id,name, email, gender, birthdate,address from lms_student where approved = false";

			// execute the statement
			ResultSet rs = stmt.executeQuery (sql);

			// for no requests pending 
			if (rs == null)
			{
%>
                            <div class="table-row">
                                <div class="name">
                                    <%
						out.println("No Pending request");
%>
                                </div>
                            </div>
                            <%
			}

			while(rs.next())
			{
%>
                                <div class="table-row">
                                    <div class="id">
                                        <%= rs.getInt(1) %>
                                    </div><div class="name">
                                        <%= rs.getString(2) %>
                                    </div>
                                    <div class="email">
                                        <%= rs.getString(3) %>
                                    </div>
                                    <div class="gender">
                                        <%= rs.getString(4) %>
                                    </div>
                                    <div class="dob">
                                        <%= rs.getString(5) %>
                                    </div>
                                    <div class="address">
                                        <%= rs.getString(6) %>
                                    </div>

                                    <div class="accept"><input type="checkbox" name="ad" value="<%= rs.getInt(1)%>"></div>
                                </div>
                                <%
			}

			// close the connection
			stmt.close();
			con.close();
		}
		catch (Exception e)
		{
			out.println(e);
		}
%>
                                    <div class="form-input pt-30 request">
                                        <input class="genric-btn primary-border" type="submit" name="accept" value="Accept Request">
                                    </div>
                                    <div class="form-input pt-30 request">
                                        <input class="genric-btn primary-border" type="submit" name="reject" value="Delete Requests">
                                    </div>
                    </form>
    </div>



    </body>
<%@ include file="styling/footer.jsp" %>
    </html>