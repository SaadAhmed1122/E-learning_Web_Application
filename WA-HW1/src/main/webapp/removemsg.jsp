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
    int topic_id = Integer.parseInt(request.getParameter("topic_id"));
    int teacherid = Integer.parseInt(request.getParameter("teacher_id"));

    PreparedStatement pst;
    ResultSet rs;
    Connection con = DatabaseConnection.initializeDatabase();
    pst = con.prepareStatement("delete from lms_message where topic_id = '"+topic_id+"'");

    if(topic_id != 0){
        pst.executeUpdate();
        response.sendRedirect("TeacherMessageInbox.jsp?teacher_id=" + teacherid);

    }


%>

<script>

    alert("Record Delete");
    <%--    <c:redirect url="/Adminpage.jsp"/>--%>

</script>
</body>
</html>
