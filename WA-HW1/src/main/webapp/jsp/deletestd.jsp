<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 4/15/2022
  Time: 5:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Student</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%@ page import="com.example.webtoreregistration.MVC.Controller.DatabaseConnection" %>


<%
    int id = Integer.parseInt(request.getParameter("id"));
    PreparedStatement pst;
    ResultSet rs;
    Connection con = DatabaseConnection.initializeDatabase();
    pst = con.prepareStatement("delete from lms_student where student_id = ?");
    pst.setInt(1, id);
    pst.executeUpdate();


%>

<script>

    alert("Record Deletee");
    <c:redirect url="/UserView.jsp"/>

</script>
</body>
</html>
