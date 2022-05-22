<%@ page import="java.sql.Connection" %>
<%@ page import="MVC.Controller.DatabaseConnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Mozil
  Date: 5/21/2022
  Time: 2:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Subject Request</title>
    <meta charset="utf-8">

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="styling/main.css" rel="stylesheet">
</head>
</head>
<body>
<%@ include file="styling/header.jsp" %>

<h3>Request</h3>

<div class="progress-table">
    <form class="form-default" action="./Approve_student_response.jsp" method="POST">
        <div class="table-head">
            <div class="id">Student Id</div>
            <div class="name">Student Name</div>
            <div class="email">Email</div>
           <div class="course_name">Course Name</div>
            <div class="accept">Accept / Decline</div>
        </div>

        <%
            try
            {
                Connection con = DatabaseConnection.initializeDatabase();
                // create a SQL statement
                Statement stmt = con.createStatement();

                String first_query= "select student_id,course_id,approved from lms_attend where approved=false";
                ResultSet rs = stmt.executeQuery (first_query);
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
                else{
            while(rs.next())
            {

                %>
        <div class="table-row">
            <div class="id">
                <%= rs.getInt(1) %>
            </div>

                <%
                int student_id= rs.getInt(1) ;
                    Statement stmt2 = con.createStatement();

                    String second_query= "select name,email from lms_student where student_id='"+student_id+"'";
                ResultSet rs2 = stmt2.executeQuery (second_query);
                    while(rs2.next())
                    {
                %>

            <div class="name">
                <%= rs2.getString(1) %>
            </div>
            <div class="email">
                <%= rs2.getString(2) %>
            </div>

                <%
                    }
                    int course_id= rs.getInt(2);
                    Statement stmt3 = con.createStatement();

                    String third_query= "select name from lms_course where course_id='"+course_id+"'";
                ResultSet rs3 = stmt3.executeQuery (third_query);
                    while(rs3.next())
                    {

        %>

            <div class="course_name">
                <%= rs3.getString(1) %>
            </div>
            <%
                }
            %>

            <div class="accept"><input type="checkbox" name="subjects" value="<%= rs.getInt(2)%>"></div>
        </div>
        <%

            }
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
            <input class="genric-btn primary-border" type="submit" name="accept_subject" value="Accept Request">
        </div>
        <div class="form-input pt-30 request">
            <input class="genric-btn primary-border" type="submit" name="reject" value="Delete Requests">
        </div>
    </form>
</div>



</body>
</html>
