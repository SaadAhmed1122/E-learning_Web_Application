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
                <a href="${pageContext.request.contextPath}/jsp/teacher.jsp">Teacher dashboard</a><br/>
                <a href="${pageContext.request.contextPath}/jsp/teacher-studentlist.jsp">List of Students</a><br/>
            </div>
            <div class="col">
                <h2>Teacher dashboard</h2>
                <!-- For loop with all cources of that teacher -->
                <div class="card" style="width: 18rem;">
                    <img class="card-img-top" src="courceIcon.png" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Cource id name</h5> <!-- Get id and name form db -->
                        <p class="card-text">Info</p>  <!-- Get amout of students -->
                        <a href="${pageContext.request.contextPath}/jsp/cource.jsp" class="btn btn-primary">Go to cource</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
