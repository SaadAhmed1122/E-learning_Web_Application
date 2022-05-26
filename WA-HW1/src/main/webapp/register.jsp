<%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 4/9/2022
  Time: 11:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
<html>
<head>
    <title>Register Form</title>
</head>
<body>
<h1>Registration Form</h1>
<form method="post" action="./StudentRegisterController" onsubmit="return validate();">

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
--%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
	<title>Student Registration Form</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="icon" type="image/png" href="assets/images/iict.jpg">

	<link rel="stylesheet" type="text/css" href="assets/css/stdRegistration-style.css">
</head>

<body>
	<a href="index.php"><img class="backimg img-fluid" src="assets/images/back.png"></a> <!-- back icon -->
	<div class="container">
		<!-- container start -->
		<div class="box">
			<!-- box start -->
			<div class="row stdregistration-form">
				<!-- Student Registration complete form coding starrt here -->
				<div class="col-lg-6 studentform-imgArea">
					<!-- image area of student registration form -->
					<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w-100" src="assets/images/stdimg2.png" alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="assets/images/stdimg1.png" alt="Second slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="assets/images/stdimg3.png" alt="Third slide">
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div> <!-- image area of student registration form end here -->

				<div class="col-lg-6 studentform-formArea">
					<!-- form area code here -->
					<h1 class="headingstdform">SIGN UP FOR STUDENT</h1>
					<form class="form-forStd-registration" method="POST" action="./StudentRegistrationController" onsubmit="return successmsg();">

						<div class="form-row">
							<!-- full.name -->
							<div class="form-group col-md-12">
								<input type="text" class="form-control formforstd" name="name" id="name" placeholder="Full name" pattern="[A-Z a-z]{2,}\s{1}[A-Z a-z]{3,}"  required>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-12">
								<input type="email" class="form-control formforstd" id="inputEmail4" placeholder="Email" required name="email" pattern="[a-z0-9.!#$%&_]+@[a-z0-9]+\.[a-z]{2,4}$">
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-12">
								<input type="date" class="form-control formforstd"  placeholder="Date of Birth" name="birthday" required>
							</div>
						</div>


						<div class="form-row">
							<div class="form-group col-md-12">
								<select class="custom-select stdpart" name="genderdropdown" required>
									<option selected="true" disabled="disabled">Select Gender</option>
									<option value = "Male">Male</option>
									<option value = "Female">Female</option>
								</select>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-12">
								<input type="text" class="form-control formforstd" id="inputPassword4" placeholder="Address" name="password" required>
							</div>
						</div>


						<div class="form-row">
							<!-- password n cnfrm password start -->
							<div class="form-group col-md-12">
								<input type="password" class="form-control formforstd" id="inputPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" placeholder="Password" name="Password" required>
							</div>

						</div> <!-- password n cnfrm password end -->
						
						<div class="form-row">
							<div class="form-group col-md-12">
								<input type="password" class="form-control formforstd" id="inputPassword5" placeholder="Confirm password" name="u_pass2" required>
							</div>
						</div>

						
						<center>
							<button type="submit" class="stdform btn btn-block btn-primary" name="btn_register" value="Register">SIGN UP</button> <!-- btn for sign-up -->
						</center>
					</form>
				</div> <!-- form area code end here -->
			</div> <!-- Student Registration complete form coding end here -->
		</div> <!-- box end  -->
	</div> <!-- container end -->


	<!-- // Restricts input for the given textbox to the given inputFilter function. -->
	<script>
		setInputFilter(document.getElementById("u_phone"), function(value) {
			return /^\d*\.?\d*$/.test(value); // Allow digits and '.' only, using a RegExp
		});

		function setInputFilter(textbox, inputFilter) {
			["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function(event) {
				textbox.addEventListener(event, function() {
					if (inputFilter(this.value)) {
						this.oldValue = this.value;
						this.oldSelectionStart = this.selectionStart;
						this.oldSelectionEnd = this.selectionEnd;
					} else if (this.hasOwnProperty("oldValue")) {
						this.value = this.oldValue;
						this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
					} else {
						this.value = "";
					}
				});
			});
		}

		function successmsg()
		{
			alert("Successfully Registered");
			return true;

		}
	</script>
	<!-- links copy from bootstrap web for slider and other use -->
	<!-- jquery and javascript links -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>

</html>