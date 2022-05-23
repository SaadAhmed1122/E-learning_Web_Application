<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="MVC.Controller.DatabaseConnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%--
<%--
  Created by IntelliJ IDEA.
  User: sepid
  Date: 5/19/2022
  Time: 2:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course List</title>
</head>
<body>
<h1>Welcome to Course Page</h1>
<center>
        <%
            if(session.getAttribute("login")==null || session.getAttribute("login")=="")
            {
                response.sendRedirect("index.jsp");
            }

        %>
        <%@ include file="styling/header.jsp" %>
        <div class="row">
            <div class="col-md-2">

            </div>
            <div class="col-sm-8">
                <div class="panel-body">
                    <table id="tbl-courses" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                        <thead>
                        <tr>
                            <th>Marterial Topic</th>
                            <th>Material Text</th>
                            <th>Material Link</th>
                        </tr>
                        <%
                        PreparedStatement pst;
                        ResultSet rs;

                        Connection con = DatabaseConnection.initializeDatabase();
                        int id = Integer.parseInt(request.getParameter("id"));

                        pst = con.prepareStatement("select * from lms_material where lms_material.course_id = ?");
                        pst.setInt(1, id);
                        rs = pst.executeQuery();

                        while(rs.next())
                        {

                    %>
                    <tr>
                        <td><%=rs.getString("topic") %></td>
                        <td><%=rs.getString("text") %></td>
                        <td><%=rs.getString("img_file") %></td>
                    </tr>
                <%
                                  }
                        %>
                        </table>
                    </div>
                </div>
            </div>
</body>
</html>
