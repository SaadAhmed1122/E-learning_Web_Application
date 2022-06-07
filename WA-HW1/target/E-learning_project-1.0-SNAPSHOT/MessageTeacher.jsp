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
    <title>Inbox</title>
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


</style>
<body>
    <center><h1>Messaging Page</h1></center>

            <%
                if (session.getAttribute("login") == null || session.getAttribute("login") == "") {
                    response.sendRedirect("index.jsp");
                }
            %>
<%--        <%@ include file="styling/header.jsp" %>--%>
        <br>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">

            <form method="post" action="./MessagingController" onsubmit="return validate();">
                <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                    <thead>
                    <tr>
                    <th><label for="topic">Enter Topic</label></th>
                    <th><input class="form-group" type="text" name="topic" id="topic" placeholder="Topic" title="Enter Topic"></th>
                </tr>

                <tr >
                    <th><label for="text">Enter Your Message</label></th>
                   <th> <input class="form-group" type="text" name="text" id="text" placeholder="Text" title="Type Your Message"></th>
                </tr>

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
                <tr >
                    <th><label for="teacher">Select teacher</label></th>
                    <th><select class="form-group" name = "teacherdropdown" id="teacher">
                        <% while(rs.next()) {  %>
                        <option value = "<%= rs.getString("teacher_id")%>" selected><%=rs.getString("name")%></option>
                        <% }  %>
                    </select>
                    </th>
                    <input type="hidden" name="student_id" value="<%=stud_id%>"/>
                </tr>
                    <div>${RegisterSuccessMsg}</div>
                <br>
                    <tr>
                        <th>
                <input class="btn btn-primary" type="submit" name="btn_send" value="Send">
                        </th></tr>
                    <tr>
                        <th>
                            <h3><a href="StudentPanel.jsp">Cancel</a></h3></th></tr>
                    </thead>
                </table>
            </form>
            </div>
            <div class="col-md-3"></div>
        </div>
</body>
</html>
