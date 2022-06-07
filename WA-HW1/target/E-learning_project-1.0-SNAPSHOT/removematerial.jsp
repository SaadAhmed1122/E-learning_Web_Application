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
    int mid = Integer.parseInt(request.getParameter("material_id"));
    int course_id = Integer.parseInt(request.getParameter("course_id"));

    PreparedStatement pst;
    ResultSet rs;
    Connection con = DatabaseConnection.initializeDatabase();
    pst = con.prepareStatement("delete from lms_material where material_id = ?");

    if(mid != 0){
        pst.setInt(1, mid);
        pst.executeUpdate();
        response.sendRedirect("Teacher_course_list.jsp?id=" + course_id);
    }
%>

<script>

    alert("Record Delete");
    <%--    <c:redirect url="/Adminpage.jsp"/>--%>

</script>
</body>
</html>
