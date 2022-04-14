<%--
  Created by IntelliJ IDEA.
  User: maritfh
  Date: 14/04/2022
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of Students</title>
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
                <h1>List of Students</h1>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Course</th>
                        <th scope="col">Email</th>
                        <th scope="col">Phone No</th>
                        <th scope="col">Modify</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">Marit</th>
                        <td>Web Applications</td>
                        <td>marit@studenti.unipd.it</td>
                        <td>12345678</td>
                        <td><a href="${pageContext.request.contextPath}/jsp/teacher.jsp">Remove</a><br/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
