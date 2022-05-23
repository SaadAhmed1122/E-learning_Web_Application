<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="MVC.Controller.DatabaseConnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%--
<%--
  Created by IntelliJ IDEA.
  User: sepid
  Date: 5/20/2022
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Messaging Page</h1>
    <center>
            <%
                if (session.getAttribute("login") == null || session.getAttribute("login") == "") {
                    response.sendRedirect("index.jsp");
                }

            %>
        <%@ include file="styling/header.jsp" %>
        <br>
        <div class="col-md-12 col-lg-12">
            <form method="post" action="./MessagingController" onsubmit="return validate();">

                <div class="form-group">
                    <label for="topic">Enter Topic</label>
                    <input class="form-group" type="text" name="topic" id="topic" placeholder="Topic" title="Enter Topic">
                </div>

                <div class="form-group">
                    <label for="text">Enter Your Message</label>
                    <input class="form-group" type="text" name="text" id="text" placeholder="Text" title="Type Your Message">
                </div>

                <%
                    int stud_id = 0;
                    Connection con0;

                    ResultSet rs0;
                    String student_mail0 = (String) session.getAttribute("login");

                    con0 = DatabaseConnection.initializeDatabase();
                    String query0 = "select lms_student.student_id from lms_student where lms_student.email='" + student_mail0 + "'";
                    Statement st0 = con0.createStatement();

                    rs0 = st0.executeQuery(query0);

                    while (rs0.next()) {
                        stud_id = rs0.getInt(1);
                    }


                    Connection con;
                    ResultSet rs;

                    con = DatabaseConnection.initializeDatabase();
                    String query = "select lms_teacher.teacher_id, lms_teacher.name from lms_teacher";
                    Statement st = con.createStatement();

                    rs = st.executeQuery(query);
                %>
                <div class=" form-group">
                    <label for="teacher">Select teacher</label>
                    <select class="form-group" name = "teacherdropdown" id="teacher">
                        <% while(rs.next()) {  %>
                        <option value = "<%= rs.getString("teacher_id")%>" selected><%=rs.getString("name")%></option>
                        <% }  %>
                    </select>
                    <input type="hidden" name="student_id" value="<%=stud_id%>"/>
                </div>

                <br>
                <input class="btn btn-primary" type="submit" name="btn_send" value="Send">
                <h3><a href="StudentPanel.jsp">Cancel</a></h3>

            </form>
        </div>
</body>
</html>
