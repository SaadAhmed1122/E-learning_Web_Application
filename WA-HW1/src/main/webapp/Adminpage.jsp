<%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 4/10/2022
  Time: 2:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Page</title>

</head>
<body>
<%@ include file="styling/header.jsp" %>
<center>
    <h1>
        <%
            if(session.getAttribute("login_admin")==null || session.getAttribute("login_admin")=="")
            {
                response.sendRedirect("index.jsp");
            }

        %>
        Welcome,<%= session.getAttribute("login_admin")%>

        <a href="./StudentManagmentServlet"> <input type="button" name="showstudent" value="Student List"></a>
        
        <!--
        <h3 style="text-align: end">
            <a href="logout.jsp">Logout</a>
        </h3>-->
    </h1>
</center>
</body>
<%@ include file="styling/footer.jsp" %>
</html>
