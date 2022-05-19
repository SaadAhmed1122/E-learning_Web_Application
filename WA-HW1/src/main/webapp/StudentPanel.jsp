<%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 4/10/2022
  Time: 12:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Wellcome In Student Page</h1>
<center>
    <h2>
        <%
            if(session.getAttribute("login")==null || session.getAttribute("login")=="")
            {
                response.sendRedirect("index.jsp");
            }

        %>
        Wellcome,<%= session.getAttribute("login")%>



        <h3>
            <a href="logout.jsp">Logout</a>
        </h3>
    </h2>
</center>
</body>
</html>
