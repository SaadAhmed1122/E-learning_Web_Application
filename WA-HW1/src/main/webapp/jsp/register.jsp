<%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 4/9/2022
  Time: 11:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Form</title>
</head>
<body>
<h1>Registration Form</h1>
<form method="post" action="./RegisterController" onsubmit="return validate();">

<div class="form-input">
    <input type="text" name="name" id="name" placeholder="Full name" pattern="[A-Z a-z]{2,}\s{1}[A-Z a-z]{3,}" title="Enter First Name and Last Name" required>
</div>
<div class="form-input">
    <input name="email" id="email" placeholder="Email ID" pattern="[a-z0-9.!#$%&_]+@[a-z0-9]+\.[a-z]{2,4}$" title="Must be like : characters@characters.domain" required>
</div>
<div class="form-input">
    <select name = "genderdropdown">
        <option value = "Male" selected>Male</option>
        <option value = "Female">Female</option>
    </select>
</div>
    <div class="form-input">
        <input name="address" id="address" placeholder="Address" >
    </div>
    <div class="form-input">
        <label for="birthday">Birthday:</label>
        <input type="date" id="birthday" name="birthday">
          </div>


<div class="form-input">
    <input type="password" id="password" name="password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" required>
</div>


</div>
    <input type="submit" name="btn_register" value="Register">
    <h3>You have a account? <a href="index.jsp">Login</a> </h3>
</form>
</body>
</html>
