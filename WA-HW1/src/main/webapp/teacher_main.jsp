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
</head>
<body>
<%
    if (session.getAttribute("login_teacher_email") == null || session.getAttribute("login_teacher_email") == "") {
        response.sendRedirect("index.jsp");
    }
%>
<h1>Welcome Teacher</h1>

<h1>Dashboard</h1>

<div class="row">
    <div class="col-md-2"></div>
    <div class="col-sm-8">
        <div class="panel-body">
            <table id="tbl-courses" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Course Description</th>

                    <th>View Course</th>
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
                    <td><a href="Teacher_course_list.jsp?id=<%=rs.getString("course_id")%>">View</a></td>
                </tr>
                    <%
                    con.close();
                }
                %>
            </table>
        </div>
        <a href="TeacherMessageInbox.jsp?teacher_id=<%=teacher_id%>" class="btn btn-info btn-lg" role="button">Message Inbox</a>
    </div>
</div>
<h3>
    <a href="logout.jsp">Logout</a>
</h3>
</body>
</html>
