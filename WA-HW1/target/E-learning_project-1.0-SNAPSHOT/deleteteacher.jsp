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
</head>
<body>
<%@page import="java.sql.*" %>
<%@ page import="MVC.Controller.DatabaseConnection" %>


<%
  int id = Integer.parseInt(request.getParameter("id"));
  int teacherid = Integer.parseInt(request.getParameter("teacher_id"));

  PreparedStatement pst;
  ResultSet rs;
  Connection con = DatabaseConnection.initializeDatabase();
  pst = con.prepareStatement("delete from lms_teacher where teacher_id = ?");
  if(teacherid != 0){
    pst.setInt(1, teacherid);
    pst.executeUpdate();
    response.sendRedirect("TeacherList.jsp");
  }

%>

<script>

  alert("Record Delete");
  <%--    <c:redirect url="/Adminpage.jsp"/>--%>

</script>
</body>
</html>
