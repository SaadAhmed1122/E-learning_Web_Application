<%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 4/17/2022
  Time: 1:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teacher Registration</title>
</head>
<body>
<%@ include file="styling/header.jsp" %>
<h1>Teacher Registration Form</h1>
<br>
<div class="col-md-3"></div>
<div class="col-md-4">
<form method="post" action="./TeacherRegistrationController" onsubmit="return validate();">

    <div class="form-group">
        <label for="name">Name</label>
        <input class="form-group" type="text" name="name" id="name" placeholder="Full name" pattern="[A-Z a-z]{2,}\s{1}[A-Z a-z]{3,}" title="Enter Teacher Name" required>
    </div>

    <div class=" form-group">
        <label for="email">Email</label>
        <input class="form-group" name="email" id="email" placeholder="Email ID" pattern="[a-z0-9.!#$%&_]+@[a-z0-9]+\.[a-z]{2,4}$" title="Must be like : characters@characters.domain" required>
    </div>

    <div class=" form-group">
        <label for="gender">Select Gender</label>
        <select class="form-group" name = "genderdropdown" id="gender">
            <option value = "Male" selected>Male</option>
            <option value = "Female">Female</option>
        </select>
    </div>

    <div  class=" form-group">
        <label for="address">Address</label>
        <input class="form-group" name="address" id="address" placeholder="Address" >
    </div>

    <div class=" form-group">
        <label for="password">Password</label>
        <input class="form-group" type="password" id="password" name="password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" required>
    </div>
    <br>
    <input class="btn btn-primary" type="submit" name="btn_register" value="Register">
    <h3><a href="Adminpage.jsp">Cancel</a></h3>

</form>
</div>
</body>
<%@ include file="styling/footer.jsp" %>
</html>
