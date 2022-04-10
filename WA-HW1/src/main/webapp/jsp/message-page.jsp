<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
       <meta charset="utf-8">
       <title>login</title>
    </head>
    <body>
        <p><c:out value="${message.message}"/></p>
        <a href="${pageContext.request.contextPath}/jsp/homepage.jsp">go back to the homepage</a>
    </body>
</html>