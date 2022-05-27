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
<%@ page import="MVC.Controller.DatabaseConnection" %>


<%
    int id = Integer.parseInt(request.getParameter("id"));
    int teacher_id = Integer.parseInt(request.getParameter("teacher_id"));
    PreparedStatement pst;
    PreparedStatement pst2,pst3;
    ResultSet rs;
    Connection con = DatabaseConnection.initializeDatabase();
    pst = con.prepareStatement("delete from lms_student where student_id = ?");

    pst3 = con.prepareStatement("delete from lms_assign_courses where teacher_id = ?");
    pst3.setInt(1,teacher_id);
    pst3.executeUpdate();
    pst2 = con.prepareStatement("delete from lms_teacher where teacher_id = ?");
    if(id != 0){
        pst.setInt(1, id);
        pst.executeUpdate();
        response.sendRedirect("UserView.jsp");
    }
    else if(teacher_id!= 0) {
        pst2.setInt(1, teacher_id);
        pst2.executeUpdate();
        response.sendRedirect("TeacherList.jsp");
    }

%>

<script>

    alert("Record Delete");
<%--    <c:redirect url="/Adminpage.jsp"/>--%>

</script>
</body>
</html>
