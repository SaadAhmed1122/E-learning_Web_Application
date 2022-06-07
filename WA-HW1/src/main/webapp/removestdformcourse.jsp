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
    int cid = Integer.parseInt(request.getParameter("cid"));

    PreparedStatement pst;
    ResultSet rs;
    Connection con = DatabaseConnection.initializeDatabase();
    pst = con.prepareStatement("delete from lms_attend where student_id = ?");

     if(id != 0){
        pst.setInt(1, id);
        pst.executeUpdate();
        response.sendRedirect("enrolledstudentlist.jsp?course_id=" + cid);

    }


%>

<script>

    alert("Record Delete");
    <%--    <c:redirect url="/Adminpage.jsp"/>--%>

</script>
</body>
</html>
