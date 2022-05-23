<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="MVC.Controller.DatabaseConnection" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: sepid
  Date: 5/22/2022
  Time: 1:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TeacherInbox</title>
</head>
<body>
<%
    if (session.getAttribute("login_teacher_email") == null || session.getAttribute("login_teacher_email") == "") {
        response.sendRedirect("index.jsp");
    }
%>
<%@ include file="styling/header.jsp" %>

<div class="row">
    <div class="col-md-2"></div>
    <div class="col-sm-8">
        <div class="panel-body">
            <table id="tbl-courses" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                <thead>
                <tr>
                    <th>Student Name</th>
                    <th>Student Email</th>
                    <th>Message Topic</th>
                    <th>Message Text</th>
                </tr>
                    <%
                Connection con;
                String id = request.getParameter("teacher_id");

                ResultSet rs;
                con = DatabaseConnection.initializeDatabase();
                String query = "select lms_student.name, lms_student.email, lms_message.topic, lms_message.text from lms_message, lms_student \n" +
                                "where lms_message.teacher_id ='" + id + "' and lms_message.student_id = lms_student.student_id ";
                Statement st = con.createStatement();

                rs = st.executeQuery(query);

                while (rs.next()) {
                    %>
                <tr>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("topic")%></td>
                    <td><%=rs.getString("text")%></td>
                </tr>
                    <%
                }
                %>
            </table>
        </div>
    </div>
</div>
<h3>
    <a href="teacher_main.jsp">Back</a>
</h3>

</body>
</html>
