<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="MVC.Controller.DatabaseConnection" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 5/20/2022
  Time: 4:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teacher</title>
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
<%
    if (session.getAttribute("login_teacher_email") == null || session.getAttribute("login_teacher_email") == "") {
        response.sendRedirect("index.jsp");
    }
%>


<div class="row">
    <div class="col-md-2"></div>
    <div class="col-sm-8">
        <div class="panel-body">
            <center>
            <h1>Welcome Teacher</h1>

            <h1>Dashboard <a class="btn btn-danger" href="logout.jsp">Logout</a></h1>
            </center><br><br>


            <table id="tbl-courses" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Course Description</th>

                    <th>Action</th>
                </tr>
                    <%
                Connection con;
                PreparedStatement pst;
                ResultSet rs;
                String teacher_mail = (String) session.getAttribute("login_teacher_email");
                con = DatabaseConnection.initializeDatabase();
                String query = "select lms_course.course_id, lms_assign_courses.teacher_id, lms_course.name, lms_course.description \n" +
                        "from lms_course, lms_assign_courses\n" +
                        "where lms_assign_courses.teacher_id = (select lms_teacher.teacher_id from lms_teacher where lms_teacher.email='" + teacher_mail + "')" +
                        "and lms_assign_courses.course_id = lms_course.course_id ";
                Statement st = con.createStatement();

                rs = st.executeQuery(query);

                int teacher_id=0;
                while (rs.next()) {
                    teacher_id = rs.getInt(2);
                    %>
                <tr>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("description")%></td>
                    <%--                    <td><%=rs.getString("prerequistie")%></td>--%>
                    <td><a class="btn btn-info" href="Teacher_course_list.jsp?id=<%=rs.getString("course_id")%>">View</a></td>
                </tr>
                    <%
                    con.close();
                }
                %>
            </table>
        </div>
        <a class="btn btn-success" href="TeacherMessageInbox.jsp?teacher_id=<%=teacher_id%>" class="btn btn-info btn-lg" role="button">Message Inbox</a>
    </div>
</div>

</body>
</html>
