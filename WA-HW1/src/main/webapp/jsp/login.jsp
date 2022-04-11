




<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
       <meta charset="utf-8">
       <title>login</title>
    </head>
    <body>

        <form method="POST" action="<c:url value="/user/login/"/>">
            <label for="email">email:</label>
            <input name="email" type="text"/><br/><br/>
            <label for="password">password:</label>
            <input name="password" type="password"/><br/><br/>
            <button type="submit">Submit</button><br/>

        </form>

        <c:choose>
            <c:when test="${message.error}">
                <p><c:out value="${message.message}"/></p>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>
    </body>
</html>