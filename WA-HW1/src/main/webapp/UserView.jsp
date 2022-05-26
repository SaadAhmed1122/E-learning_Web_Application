<%@ page import="java.sql.*" %>
<%@ page import="MVC.Controller.DatabaseConnection" %><%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 4/10/2022
  Time: 3:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <title>Students List</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <title>Admin panel</title>
</head>
<body>
<%--<center>--%>
<%--    <h1>Student Management</h1>--%>
<%--    <h2>--%>
<%--        <a href="/new">Add New Student</a>--%>
<%--        &nbsp;&nbsp;&nbsp;--%>
<%--        <a href="/list">List All Student</a>--%>

<%--    </h2>--%>
<%--</center>--%>
<%--<div align="center">--%>
<%--    <table border="1" cellpadding="5">--%>
<%--        <caption><h2>List of Student</h2></caption>--%>
<%--        <tr>--%>
<%--            <th>ID</th>--%>
<%--            <th>Name</th>--%>
<%--            <th>Email</th>--%>
<%--            <th>Approval</th>--%>
<%--            <th>Actions</th>--%>
<%--        </tr>--%>
<%--        <c:forEach var="std" items="${liststd}">--%>
<%--            <tr>--%>
<%--                <td><c:out value="${std.id}" /></td>--%>
<%--                <td><c:out value="${std.name}" /></td>--%>
<%--                <td><c:out value="${std.email}" /></td>--%>
<%--                <td><c:out value="${std.approval}" /></td>--%>
<%--                <td>--%>
<%--                    <a href="/edit?id=<c:out value='${std.id}' />">Edit</a>--%>
<%--                    &nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--                    <a href="/delete?id=<c:out value='${std.id}' />">Delete</a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</div>--%>

<%--<center>--%>
<%--    <h1>Student Management</h1>--%>
<%--    <h2>--%>
<%--        <a href="/new">Add New Student</a>--%>
<%--        &nbsp;&nbsp;&nbsp;--%>
<%--        <a href="/list">List All Student</a>--%>

<%--    </h2>--%>
<%--</center>--%>
<%--<table border=1 width=50% height=50%>--%>
<%--    <tr>--%>
<%--        <th>ID</th>--%>
<%--        <th>Name</th>--%>
<%--        <th>Email</th>--%>
<%--        <th>Approval</th>--%>
<%--        <th>Edit</th>--%>
<%--        <th>Delete</th>--%>
<%--    </tr>--%>
<%--<%--%>
<%--String jdbcURL = "jdbc:postgresql://localhost:5432/web_tore";--%>
<%--     String jdbcUsername = "postgres";--%>
<%--     String jdbcPassword = "root";--%>
<%--try--%>
<%--        {--%>
<%--         Class.forName("org.postgresql.Driver");--%>
<%--            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);--%>


<%--            PreparedStatement stmt = connection.prepareStatement("select * from students");--%>
<%--            ResultSet rs = stmt.executeQuery();--%>
<%--            while (rs.next()){--%>

<%--            %>--%>

<%--    <tr>--%>
<%--        <td><%=rs.getInt("id")%></td>--%>
<%--        <td><%=rs.getString("name")%></td>--%>
<%--        <td><%=rs.getString("email_id")%></td>--%>
<%--        <td><%=rs.getBoolean("approval")%></td>--%>

<%--        <td><a href="register.jsp?edit_id=<%=rs.getInt("id")%>"></a> </td>--%>
<%--        <td><a href="register.jsp?delete_id=<%=rs.getInt("id")%>"></a> </td>--%>

<%--    </tr>--%>

<%--           <%}--%>
<%--            stmt.close();--%>
<%--            connection.close();--%>
<%--           }catch (Exception e){--%>
<%--    e.printStackTrace();--%>
<%--           }--%>
<%--%>--%>
<%--</table>--%>





<%--<div align="center">--%>
<%--    <table border="1" cellpadding="5">--%>
<%--        <caption><h2>List of Student</h2></caption>--%>
<%--        <tr>--%>
<%--            <th>ID</th>--%>
<%--            <th>Name</th>--%>
<%--            <th>Email</th>--%>
<%--            <th>Approval</th>--%>
<%--            <th>Actions</th>--%>
<%--        </tr>--%>
<%--        <c:forEach var="std" items="${liststd}">--%>
<%--            <tr>--%>
<%--                <td><c:out value="${std.id}" /></td>--%>
<%--                <td><c:out value="${std.name}" /></td>--%>
<%--                <td><c:out value="${std.email}" /></td>--%>
<%--                <td><c:out value="${std.approval}" /></td>--%>
<%--                <td>--%>
<%--                    <a href="/edit?id=<c:out value='${std.id}' />">Edit</a>--%>
<%--                    &nbsp;&nbsp;&nbsp;&nbsp;--%>
<%--                    <a href="/delete?id=<c:out value='${std.id}' />">Delete</a>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</div>--%>
<%@ include file="styling/header.jsp" %>
<center>
<h1>Student Management Section</h1></center>
</br>
<div class="row">
<%--    <div class="col-sm-4">--%>
<%--        <form  method="POST" action="#" >--%>

<%--            <div alight="left">--%>
<%--                <label class="form-label">Student Id</label>--%>
<%--                <input type="text" class="form-control" placeholder="Student id" name="sid"  required >--%>
<%--            </div>--%>
<%--            <div alight="left">--%>
<%--                <label class="form-label">Student Name</label>--%>
<%--                <input type="text" class="form-control" placeholder="Student Name" name="sname"  required >--%>
<%--            </div>--%>
<%--<div alight="left">--%>
<%--                <label class="form-label">Student Email</label>--%>
<%--                <input type="text" class="form-control" placeholder="Student Email" name="semail" required >--%>
<%--            </div>--%>

<%--            <div alight="left">--%>
<%--                <label class="form-label">Approval</label>--%>
<%--                <input type="text" class="form-control" placeholder="Approval" name="approval"  required >--%>
<%--            </div>--%>

<%--            </br>--%>

<%--            <div alight="right">--%>
<%--                <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">--%>
<%--                <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">--%>
<%--            </div>--%>

<%--        </form>--%>
<%--    </div>--%>
<div class="col-md-2"></div>
    <div class="col-sm-8">
        <div class="panel-body">
            <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                <thead>
                <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Gender</th>
                                <th>Date of Birth</th>
                                <th>Address</th>
                                <th>Approval</th>
                                <th>Actions</th>
                            </tr>
                            </thead>

                    <%

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;

                               con= DatabaseConnection.initializeDatabase();
                                  String query = "select * from lms_student";
                                  Statement st = con.createStatement();

                                    rs =  st.executeQuery(query);

                                        while(rs.next())
                                        {
                                            int student_id = rs.getInt("student_id");
                                   %>
            <tbody>
                <tr>
                    <td scope="row"><%=rs.getString("student_id") %></td>
                    <td><%=rs.getString("name") %></td>
                    <td><%=rs.getString("email") %></td>
                    <td><%=rs.getString("gender") %></td>
                    <td><%=rs.getString("birthdate") %></td>
                    <td><%=rs.getString("address") %></td>
                    <td><%=rs.getString("approved") %></td>

                    <td><a class='btn btn-primary btn-sm' href="updatestd.jsp?id=<%=student_id%>"><span class="glyphicon glyphicon-edit"></span> Edit</a>   
                        <a class="btn btn-danger btn-sm" href="deletestd.jsp?id=<%=student_id%>&teacher_id=0"><span class="glyphicon glyphicon-trash"></span> Delete</a>
                    </td>
                </tr>
            </tbody>

                    <%

                                 }
                               %>

            </table>
        </div>

    </div>
    <div class="col-md-2"></div>
</div>

<%@ include file="styling/footer.jsp" %>
</body>
</html>
