<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<form method="post" action="./LoginController" name="LoginForm" onsubmit="return validate();">
    Email: <input type="email" name="txt_email">
    password: <input type="password" name="txt_password">
    <input type="submit" name="btn_login" value="Login">
    <h3>You don't have acount ?<a href="register.jsp">Register</a> </h3>
</form>
</body>
</html>

comment -->

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
	<title>Login</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="assets/css/loginstyle.css">
	<link rel="icon" type="image/png" href="./assets/images/iict.jpg">
        
</head>

<body>
<%
	if(!(session.getAttribute("login_admin")==null || session.getAttribute("login_admin")==""))
	{
		response.sendRedirect("Adminpage.jsp");
	}
	else if(!(session.getAttribute("login_teacher_email")==null || session.getAttribute("login_teacher_email")==""))
	{
		response.sendRedirect("teacher_main.jsp");
	}
	else if(!(session.getAttribute("login")==null || session.getAttribute("login")==""))
	{
		response.sendRedirect("StudentPanel.jsp");
	}

%>
<a href="Home.jsp"><img class="backimg img-fluid" src="assets/images/back.png"></a> <!-- back icon -->

<!--- login page --->
	<div class="login-container d-flex align-items-center justify-content-center">
		<form class="login-form text-center" method="post" action="./LoginController" name="LoginForm" onsubmit="return validate();">
			<img class="img-fluid mb-5" src="./assets/images/logo2.png"> <!-- logo -->
                        <!-- for username or email -->
			<div class="form-group">
				<i class="fa fa-user user-icon" aria-hidden="true"></i> <!-- icon from font awesome -->
				<input type="text" class="form-control form-control-lg" name="txt_email" placeholder="Email">
			</div>
			<!-- for username or email End -->
			<!-- password start -->
			<div class="form-group">
				<i class="fa fa-lock lock-icon" aria-hidden="true"></i> <!-- icon from font awesome -->
				<input type="Password" class="form-control form-control-lg" name="txt_password" placeholder="Password" >
			</div>
			<!-- For selection -->
			<!-- <div class="form-group">
				<select class="form-control form-control-lg" name="category">
					<option selected="true" disabled="disabled">Student/Teacher/Clerk</option>
					<?php global $con;
					$get_classes = "Select * from user_category where user_cat_name != 'All'";
					$run_classes = mysqli_query($con, $get_classes);
					while ($row = mysqli_fetch_array($run_classes)) {
						$user_cat_id = $row['user_cat_id'];
						$user_cat_name = $row['user_cat_name'];
						echo "<option value = '$user_cat_id'>$user_cat_name</option>";
					} ?>
				</select>

			</div> -->
			<!-- password end here -->
			<div class="forget-link d-flex align-items-center justify-content-between">
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="remember">
					<label for="remember">Remember Me</label>
				</div>

			</div>
			<div style="color:red">${WrongLoginMsg}</div>
			<button type="submit" class="btn mt-4 btn-custom btn-block btn-lg" name="btn_login" value="Login">Login</button>
			<p class="mt-3 font-weight-normal">Don't have an account? <a href="register.jsp"> <strong>Register here</strong></a></p>
		</form>
	</div>

	<!-- For login -->
	
	<!-- javascript and jquery links -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>

</html>