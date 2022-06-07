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
    <link rel="icon" type="image/png" href="./assets/images/iict.jpg">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<style>
    body {
        overflow-x: hidden;
        font-family: 'Roboto', sans-serif;
        font-size: 16px;
        background-image: url("./assets/images/bg.jpg");
        background-color: #cccccc;
    }

    /* Toggle Styles */

    h1{
        padding-top: 30px;
        margin-top: 0 !important;
        margin: 0 !important;
    }
    element.style {
    }
    .table-responsive {
        min-height: .01%;
        overflow-x: auto;
    }
    .table-bordered {
        border: 1px solid #ddd;
    }
    .table {
        width: 100%;
        max-width: 100%;
        margin-bottom: 20px;
    }

    table {
        background-color: beige;
    }

    #viewport {
        padding-left: 250px;
        -webkit-transition: all 0.5s ease;
        -moz-transition: all 0.5s ease;
        -o-transition: all 0.5s ease;
        transition: all 0.5s ease;
    }

    #content {
        width: 100%;
        position: relative;
        margin-right: 0;
    }
    .red{
        font-color: red;
    }


</style>
<body>
<center>
<h1>Welcome to Course Page</h1>

        <%
            if(session.getAttribute("login_teacher_email")==null || session.getAttribute("login_teacher_email")=="")
            {
                response.sendRedirect("index.jsp");
            }

        %>

    <%

                        PreparedStatement pst;
                        ResultSet rs;

                        Connection con = DatabaseConnection.initializeDatabase();
                        int id = Integer.parseInt(request.getParameter("id"));

                        pst = con.prepareStatement("select * from lms_material where lms_material.course_id = ?");
                        pst.setInt(1, id);
                        rs = pst.executeQuery();

    %>

            <a class="btn btn-success" href="enrolledstudentlist.jsp?course_id=<%=id%>">Enrolled Students</a>
            <a class="btn btn-success" href="Upload_course_material.jsp?course_id=<%=id%>" >Upload Material</a>
            <a href="teacher_main.jsp"><button type="button" class="btn btn-secondary btn-group-lg">Back</button></a></center>
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
                        <th>Action</th>
                    </tr>
                        <%

                        while(rs.next())
                        {

                    %>
                    <tr>
                        <td><%=rs.getString("topic") %></td>
                        <td><%=rs.getString("text") %></td>
                        <td><a href="<%=rs.getString("img_file")%>"/><%=rs.getString("img_file")%></td>

                        <td>

                            <a class="btn btn-danger btn-sm" href="removematerial.jsp?material_id=<%=rs.getString("material_id") %>&course_id=<%=id%>"><span class="glyphicon glyphicon-trash"></span> Delete</a>
                        </td>
                    </tr>
                        <%
                                  }
                        %>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
