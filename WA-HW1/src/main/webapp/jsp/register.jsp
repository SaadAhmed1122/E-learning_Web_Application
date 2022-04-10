<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
       <meta charset="utf-8">
       <title>register</title>
    </head>
    <body>

        <form method="POST" action="<c:url value="/user/register/"/>">
            <label for="email">email:</label>
            <input name="email" type="text"/><br/><br/>
            <label for="first_name">first name:</label>
            <input name="first_name" type="text"/><br/><br/>
            <label for="last_name">last name:</label>
            <input name="last_name" type="text"/><br/><br/>
            <label for="password">password:</label>
            <input name="password" type="password"/><br/><br/>
            <label for="rpassword">repeat password:</label>
            <input name="rpassword" type="password"/><br/><br/>
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