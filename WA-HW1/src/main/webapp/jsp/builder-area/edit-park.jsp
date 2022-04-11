<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
       <meta charset="utf-8">
       <title>edit park</title>
       <script src="../../js/utils.js"></script>
       <script src="../../js/edit-park-page.js"></script>
    </head>
    <body>
        <c:choose>
            <c:when test="${park!=null}">
                <h1>Edit "${park.name}"</h1>


                <form method="POST" action="<c:url value="/park/edit/update/"/>">
                    <input type="hidden" id="original_name" name="original_name" value="${park.name}"/>
                    <label for="email">email:</label>
                    <input name="email" type="text" value="${park.email}"/><br/><br/>
                    <label for="address">address:</label>
                    <input name="address" type="text" value="${park.address}"/><br/><br/>
                    <button type="submit">Submit</button><br/>
                </form>
                <button id="delete-button">Delete</button><br/>
            </c:when>
            <c:otherwise>
                <h1>Insert new park</h1>


                <form method="POST" action="<c:url value="/park/edit/insert/"/>">
                    <label for="name">park name:</label>
                    <input name="name" type="text"/><br/><br/>
                    <label for="email">email:</label>
                    <input name="email" type="text"/><br/><br/>
                    <label for="address">address:</label>
                    <input name="address" type="text"/><br/><br/>
                    <button type="submit">Submit</button><br/>

                </form>

            </c:otherwise>
        </c:choose>


        <c:choose>
            <c:when test="${message.error}">
                <p><c:out value="${message.message}"/></p>
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>
    </body>
</html>