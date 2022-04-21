<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Login Form" %>
</h1>
<br/>
<form method="post" action="./LoginController" name="LoginForm" onsubmit="return validate();">
Email: <input type="email" name="txt_email">
    password: <input type="password" name="txt_password">
    <input type="submit" name="btn_login" value="Login">
    <h3>You don't have acount ?<a href="register.jsp">Register</a> </h3>
</form>
<a href="hh">Hello Servlet</a>
</body>
</html>