<%@ page import="java.sql.*" %>
<%@ page import="MVC.Controller.DatabaseConnection" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 4/19/2022
  Time: 8:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teacher Management</title>
</head>
<body>
<%@ include file="styling/header.jsp"%>
<center><h1>Teachers Management Section</h1> </center>



<div class="row">
    <div class="col-md-2"></div>
    <div class="col-sm-8">
        <div class="panel-body">
            <a href="teacher_register.jsp" class='m btn btn-success'><span class="glyphicon glyphicon-plus-sign"></span> Add Teacher</a>
            <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
                    <%

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
                                con= DatabaseConnection.initializeDatabase();
                                  String query = "select * from lms_teacher";
                                  Statement st = con.createStatement();

                                    rs =  st.executeQuery(query);

                                        while(rs.next())
                                        {
                                            int teacher_id = rs.getInt("teacher_id");
                                   %>
                <tbody>
                <tr>
                    <td><%=rs.getString("teacher_id") %></td>
                    <td><%=rs.getString("name") %></td>
                    <td><%=rs.getString("email") %></td>
                    <td><%=rs.getString("gender") %></td>
                    <td><%=rs.getString("address") %></td>


<%--                    <td><a href="TeacherControllerServlet?action=edit&teacher_id=<%=teacher_id%>">Edit</a></td>--%>
                    <td><a class='btn btn-primary btn-sm' href="teacher_update.jsp?id=<%=teacher_id%>"><span class="glyphicon glyphicon-edit"></span> Edit</a>
                        <a class="btn btn-danger btn-sm" href="deleteteacher.jsp?teacher_id=<%=teacher_id%>&id=0"><span class="glyphicon glyphicon-trash"></span> Delete</a>
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
<%--<div class="row">--%>
<%--    <div class="col-md-2"></div>--%>
<%--    <div class="col-sm-8">--%>
<%--        <div class="panel-body">--%>
<%--            <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th>ID</th>--%>
<%--                    <th>Name</th>--%>
<%--                    <th>Email</th>--%>
<%--                    <th>gender</th>--%>
<%--                    <th>Address</th>--%>
<%--                    <th>Actions</th>--%>
<%--                </tr>--%>
<%--                <c:forEach items="${teachers}" var="teachers">--%>
<%--                <tr>--%>
<%--                    <td><c:out value="${teachers.teacher_id}"/></td>--%>
<%--                    <td><c:out value="${teachers.name}"/></td>--%>
<%--                    <td><c:out value="${teachers.email}"/></td>--%>
<%--                    <td><c:out value="${teachers.gender}"/></td>--%>
<%--                    <td><c:out value="${teachers.address}"/></td>--%>
<%--                    <td><a href="TeacherControllerServlet?action=edit&teacher_id=<c:out value="${teachers.teacher_id}"/>">Edit</a></td>--%>
<%--                    <td><a href="TeacherControllerServlet?action=delete&teacher_id=<c:out value="${teachers.teacher_id}"/>">Delete</a></td>--%>
<%--                    </tr>--%>

<%--                </c:forEach>--%>
<%--            </table>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="col-md-2"></div>--%>
<%--</div>--%>

<%@ include file="styling/footer.jsp" %>
</body>
</html>