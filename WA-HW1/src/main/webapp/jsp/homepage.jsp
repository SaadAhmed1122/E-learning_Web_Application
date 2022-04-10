<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>homepage</title>
    <script src="${pageContext.request.contextPath}/js/utils.js"></script>
    <script src="${pageContext.request.contextPath}/js/homepage.js"></script>
</head>
<body>

<c:choose>
    <c:when test="${!empty sessionScope.email}">
        <p>you are logged in with the email "${sessionScope.email}"</p>
        <a href="${pageContext.request.contextPath}/user/logout/">logout</a><br/>
        <c:if test="${!sessionScope.role.equals('base')}">
            <a href="${pageContext.request.contextPath}/html/maintainer-area/maintainer-page.html">maintainer page</a><br/>
            <a href="${pageContext.request.contextPath}/html/maintainer-area/insert-session-file.html">Insert new session file.</a></br>
            <!--<a href="${pageContext.request.contextPath}/html/maintainer-area/measurement-page.html">measurement page</a><br/>-->
            <c:if test="${!sessionScope.role.equals('maintainer')}">
                <a href="${pageContext.request.contextPath}/html/builder-area/builder-page.html">builder page</a><br/>
                <c:if test="${!sessionScope.role.equals('builder')}">
                    <a href="${pageContext.request.contextPath}/html/admin-area/admin-page.html">admin page</a><br/>
                </c:if>
            </c:if>
        </c:if>
    </c:when>
    <c:otherwise> <p>login to access to all the functionalities</p>
        <a href="${pageContext.request.contextPath}/jsp/login.jsp">login page</a><br/>
        <a href="${pageContext.request.contextPath}/jsp/register.jsp">registration page</a><br/>
    </c:otherwise>
</c:choose>

<div id="homepage-content"></div>


</body>
</html>