<%--
  Created by IntelliJ IDEA.
  User: maritfh
  Date: 14/04/2022
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teacher</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="teacher.css" type="text/css">
</head>
<body>
    <div class="header">
        <h1>TORE</h1>
    </div>
    <div class="container-fluid ">
        <div class="row">
            <div class="col-2">
                <a href="${pageContext.request.contextPath}/jsp/teacher.jsp">Dashboard</a><br/>
                <a href="${pageContext.request.contextPath}/jsp/teacher-studentlist.jsp">List of Students</a><br/>
                <a href="${pageContext.request.contextPath}/jsp/teacher-newpost.jsp">Post Material</a><br/>
            </div>
            <div class="col">
                <h1>Teacher dashboard</h1>
            </div>
        </div>
    </div>
</body>
</html>
