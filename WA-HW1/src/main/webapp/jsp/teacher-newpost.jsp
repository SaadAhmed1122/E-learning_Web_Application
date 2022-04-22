<%--
  Created by IntelliJ IDEA.
  User: maritfh
  Date: 14/04/2022
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Post Material</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="teacher.css" type="text/css">
</head>
<body>
    <div class="header">
        <h1>TORE</h1>
    </div>
    <div class="col">
        <h2>Post Material</h2>
        <form>
            <label for="topic">Topic</label>
            <input type="text" class="form-control" id="topic" name="topic">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" rows="3"></textarea>
            <input type="file" class="form-control-file" id="file">
            <button type="submit" class="btn btn-secondary">Post</button> <!-- needs to do something and be connected to correct cource -->
            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/jsp/teacher.jsp">Cancel</a><br/>
        </form>
    </div>
</body>
</html>
