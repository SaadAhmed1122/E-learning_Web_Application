<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="MVC.Controller.DatabaseConnection" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 5/17/2022
  Time: 1:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of Assign Courses</title>
</head>
<body>
<%
    if(session.getAttribute("login_admin")==null || session.getAttribute("login_admin")=="")
    {
        response.sendRedirect("index.jsp");
    }

%>
<%@ include file="styling/header.jsp" %>
<center><h1>Assign Courses list</h1></center>

<div class="row">
    <div class="col-md-2"></div>
    <div class="col-sm-8">
        <div class="panel-body">
            <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                <thead>
                <tr>
                    <th>Teacher Name</th>
                    <th>Email</th>
                    <th>gender</th>
                    <th>Course Name</th>
                </tr>
                    <%

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs,rs2,rs3;
                                con= DatabaseConnection.initializeDatabase();
                                  String query = "select * from lms_assign_courses";
                                  Statement st = con.createStatement();

                                    rs =  st.executeQuery(query);

                                        while(rs.next())
                                        {
                                            int teacher_id = rs.getInt("teacher_id");
                                            int course_id= rs.getInt("course_id");

                                            String query2= "select name,gender,email from lms_teacher where teacher_id='"+teacher_id+"'";
                                            String query3= "select name from lms_course where course_id='"+course_id+"'";
                                            Statement st2 = con.createStatement();
                                            Statement st3 = con.createStatement();
                                            rs2 =  st2.executeQuery(query2);
                                            rs3 =  st3.executeQuery(query3);

                                   %>
                <tr>
                    <% while(rs2.next()) {  %>
                    <td><%=rs2.getString("name") %></td>
                    <td><%=rs2.getString("email") %></td>
                    <td><%=rs2.getString("gender") %></td>
                    <% }  %>
                    <% while(rs3.next()) {  %>
                    <td><%=rs3.getString("name") %></td>
                    <% }  %>


                    <%--                    <td><a href="TeacherControllerServlet?action=edit&teacher_id=<%=teacher_id%>">Edit</a></td>--%>
                    <td><a href="deletestd.jsp?teacher_id=<%=teacher_id%>&course_id=<%=course_id%>&id=0">Delete</a></td>
                </tr>
                    <%
                                 }
                               %>
            </table>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>
</body>
</html>
