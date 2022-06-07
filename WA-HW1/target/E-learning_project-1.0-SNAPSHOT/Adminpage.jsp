<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="MVC.Controller.DatabaseConnection" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 4/10/2022
  Time: 2:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Page</title>
    <style>
        .flex_container
        {
            display: flex;
            justify-content: center;
        }
        .flex_item
        {
            width: 300px;
            height: 300px;
            margin: 50px;
            border: 1px solid black;
        }
    </style>
</head>
<body>
<%@ include file="styling/header.jsp" %>
<center>
    <h1>
        <%
            if(session.getAttribute("login_admin")==null || session.getAttribute("login_admin")=="")
            {
                response.sendRedirect("index.jsp");
            }

        %>
        Welcome,<%= session.getAttribute("login_admin")%>

<%--        <a href="./StudentManagmentServlet">--%>
<%--            <input type="button" name="showstudent" value="Student List"></a>--%>

        <div class="flex_container">
            <div class="flex_item"><br><span class="glyphicon glyphicon-user" style="font-size: 70px; color: blue" aria-hidden="true"></span> <br><br><br> Total Students<br>
                <%
                    Connection con;
                    ResultSet rs0;

                    con = DatabaseConnection.initializeDatabase();

                    String query0 = "select count (*) as num from lms_student";
                    Statement st0 = con.createStatement();

                    rs0 = st0.executeQuery(query0);

                    while (rs0.next()) {
                %>

                <%=Integer.parseInt(rs0.getString("num"))%>

                <%
                    }
                %>
            </div>
            <div class="flex_item"><br><span class="glyphicon glyphicon-education" style="font-size: 70px; " aria-hidden="true"></span> <br><br><br>Total Teachers<br>
                <%
                    ResultSet rs1;
                    con = DatabaseConnection.initializeDatabase();
                    String query1 = "select count (*) as num from lms_teacher";
                    Statement st1 = con.createStatement();

                    rs1 = st1.executeQuery(query1);

                    while (rs1.next()) {
                %>
                <%=Integer.parseInt(rs1.getString("num"))%>

                <%
                    }
                %>
            </div>
            <div class="flex_item"><br><span class="glyphicon glyphicon-book" style="font-size: 70px; color: red" aria-hidden="true"></span> <br><br><br>Total Courses<br>
                <%
                    ResultSet rs2;
                    con = DatabaseConnection.initializeDatabase();
                    String query2 = "select count (*) as num from lms_course";
                    Statement st2 = con.createStatement();

                    rs2 = st2.executeQuery(query2);

                    while (rs2.next()) {
                %>
                <%=Integer.parseInt(rs2.getString("num"))%>

                <%
                    }
                %>
            </div>
        </div>
        <!--
        <h3 style="text-align: end">
            <a href="logout.jsp">Logout</a>
        </h3>-->
    </h1>
</center>
</body>
<%@ include file="styling/footer.jsp" %>
</html>
