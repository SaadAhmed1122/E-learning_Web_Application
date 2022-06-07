<%@page import="MVC.Controller.DatabaseConnection"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 5/21/2022
  Time: 2:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Student Subject Request</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="styling/main.css" rel="stylesheet">
</head>
</head>
<body>
<%@ include file="styling/header.jsp" %>

<center><h1>Request of Student for subject</h1></center>

<div class="row">
    <div class="col-md-3"></div>
    <div class="col-sm-8">
    <div class="panel-body">
            <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">

            <form class="form-default" action="./Approve_student_response.jsp" method="POST">
                <thead>
                <tr>

            <th class="name">Student Name</th>
            <th class="email">Email</th>
           <th class="course_name">Course Name</th>
            <th class="accept">Accept / Decline</th>
                </tr>
                </thead>

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
                <tbody>
                <tr>
                    <td>
                <%
                    out.println("No Pending request");
                %>
                    </td>
                </tr>
        <%
            }
                else{
            while(rs.next())
            {

                %>
                <tr>


                <%
                int student_id= rs.getInt(1) ;
                    Statement stmt2 = con.createStatement();

                    String second_query= "select name,email from lms_student where student_id='"+student_id+"'";
                ResultSet rs2 = stmt2.executeQuery (second_query);
                    while(rs2.next())
                    {
                %>

            <td>
                <%= rs2.getString(1) %>
            </td>
            <td>
                <%= rs2.getString(2) %>
            </td>

                <%
                    }
                    int course_id= rs.getInt(2);
                    Statement stmt3 = con.createStatement();

                    String third_query= "select name from lms_course where course_id='"+course_id+"'";
                ResultSet rs3 = stmt3.executeQuery (third_query);
                    while(rs3.next())
                    {

        %>

           <td>
                <%= rs3.getString(1) %>
            </td>
            <%
                }
            %>

            <td><input type="checkbox" name="subjects" value="<%= rs.getInt(2)%>"></td>
        </tr>
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
                </tbody>
            </table>
        <div class="form-input pt-30 request">
            <input class="genric-btn primary-border" type="submit" name="accept_subject" value="Accept Request">
        </div>
        <div class="form-input pt-30 request">
            <input class="genric-btn primary-border" type="submit" name="reject" value="Delete Requests">
        </div>
            </form>

                </div>
                </div>
                </div>

</body>
<%@ include file="styling/footer.jsp" %>
</html>