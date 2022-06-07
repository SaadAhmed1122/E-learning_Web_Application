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
<center><h1>Teacher Registration Form</h1></center>
<br>

<div class="row"></div>

<div class="col-md-2"></div>
<div class="col-sm-8">
    <div class="panel-body">
        <form method="post" action="./TeacherRegistrationController" onsubmit="return validate();">
            <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                <thead>
                <tr>
                    <td>
                        <label for="name">Email</label>
                    </td>
                    <td>
                        <input class="form-group" name="email" id="email" placeholder="Email ID" pattern="[a-z0-9.!#$%&_]+@[a-z0-9]+\.[a-z]{2,4}$" title="Must be like : characters@characters.domain" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="name">Name</label>
                    </td>
                    <td>
                        <input class="form-group" type="text" name="name" id="name" placeholder="Full name" pattern="[A-Z a-z]{2,}\s{1}[A-Z a-z]{3,}" title="Enter Teacher Name" required>
                    </td>
                </tr>
                <tr class=" form-group">
                    <td><label for="gender">Select Gender</label></td>
                    <td>
                        <select class="form-group" name = "genderdropdown" id="gender">
                            <option value = "Male" selected>Male</option>
                            <option value = "Female">Female</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="address">Address</label>
                    </td>
                    <td>
                        <input class="form-group" name="address" id="address" placeholder="Address" >
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="password">Password</label>
                    </td>
                    <td>
                        <input class="form-group" type="password" id="password" name="password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input class="btn btn-primary" type="submit" name="btn_register" value="Register">
                    </td>
                </tr>
                </thead>
            </table>
        </form>
    </div>

</div>
<div class="col-md-2"></div>
</div>



</body>
<%--<%@ include file="styling/footer.jsp" %>--%>
</html>