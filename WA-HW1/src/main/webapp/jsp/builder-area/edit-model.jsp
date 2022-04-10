<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
       <meta charset="utf-8">
       <title>edit model</title>
       <script src="../../js/utils.js"></script>
       <script src="../../js/edit-model-page.js"></script>
    </head>
    <body>
        <c:choose>
            <c:when test="${model!=null}">
                <h1>Edit Model: "${model.name}"</h1>


                <form method="POST" action="<c:url value="/model/update/"/>">
                    <input type="hidden" id="original_name" name="original_name" value="${model.name}"/>
                    <label for="description">description:</label>
                    <input name="description" type="text" value="${model.description}"/><br/><br/>
                    <button type="submit">Submit</button><br/>
                </form>
                <button id="delete-button">Delete</button><br/>
            </c:when>
            <c:otherwise>
                <h1>Insert new model</h1>


                <form method="POST" action="<c:url value="/model/insert/"/>">
                    <label for="name">model name:</label>
                    <input name="name" type="text"/><br/><br/>
                    <label for="description">description:</label>
                    <input name="description" type="text"/><br/><br/>
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