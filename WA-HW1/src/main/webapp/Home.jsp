<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>HomePage</title>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
	<link rel="stylesheet" type="text/css" href="assets/css/homepage-style.css"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="assets/css/lightbox.min.css">
    <link rel="icon" type="image/png" href="assets/images/iict.jpg">

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



<!------------------------------------------ top signup, login, phone-no, & email area START HERE ------------------------------------------>
<div class="top">
	<div class="container-fluid"> <!-- container-fluid start here -->
		<div class="row"> <!-- row start here -->
		<div class="col-lg-6 left-corner text-white"> <!-- left-corner for email and phone-no start here -->
			<i class="fa fa-envelope-o email-icon" aria-hidden="true"></i><a class="email" href="#">director@dei.unipd.it</a>
			<i class="fa fa-phone phone-icon" aria-hidden="true"></i><a class="phone-no" href="#">022-3456444</a> 
		</div> <!-- left-corner for email and phone-no end here -->
		<div class="col-lg-6 right-corner text-white"> <!-- right-corner for sign-up and log-in start here -->
			<i class="fa fa-user-plus signup-icon" aria-hidden="true"></i><a class="signup" href="register.jsp">SIGN UP</a>
			<i class="fa fa-unlock-alt login-icon" aria-hidden="true"></i><a class="login" href="index.jsp">LOGIN</a>
		</div> <!-- right-corner for sign-up and log-in end here -->
		</div> <!-- row end here -->
	</div> <!-- container-fluid end here -->
</div>
<!------------------------------------------ top signup, login, phone-no, & email area END HERE ------------------------------------------>



<!----------------------------------------------------------- navigation bar START HERE ----------------------------------------------------------->
<nav class="navbar navbar-expand-lg navbar-light home-nav">
  	<div class="container"> <!-- container strat here -->
  		<a class="navbar-brand" href="homepage.html"><img class="img-fluid logo" width="100" src="assets/images/homepage-logo2.png"></a> <!-- logo img -->
  		<!-- button for nav-bar responsive -->
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
		</button>
		<!-- list of item in nav START HERE -->
		<div class="collapse navbar-collapse home-list" id="navbarSupportedContent">
		    <ul class="navbar-nav ml-auto">
		      <li class="nav-item"> <!-- list1 home -->
		        <a class="nav-link homenav-link" href="#">Home</a>
		      </li>
		      <li class="nav-item"> <!-- list2 Events and news -->
		        <a class="nav-link homenav-link" href="#">Events & News</a>
		      </li>
		      <li class="nav-item"> <!-- list3 gallery -->
		        <a class="nav-link homenav-link" href="#">Gallery</a>
		      </li>
		      <li class="nav-item"> <!-- list4 staff -->
		        <a class="nav-link homenav-link" href="#">Staff</a>
		      </li>
		      <li class="nav-item"> <!-- list5 courses -->
		        <a class="nav-link homenav-link" href="#">Courses</a>
		      </li>
		      <li class="nav-item"> <!-- list6 About -->
		        <a class="nav-link homenav-link" href="#">About</a>
		      </li>
		    </ul>   
		</div>
		<!-- list of item in nav END HERE -->
	</div> <!-- container end here -->
</nav>
<!----------------------------------------------------------- navigation bar END HERE ----------------------------------------------------------->



<!----------------------------------------------------------- Slider START HERE ----------------------------------------------------------->
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <!-- bottom indicators three it means there slides START HERE-->		
  <ol class="carousel-indicators carousel-indicatorsicons">
    <li class="slider-icon1" data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li class="slider-icon1" data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li class="slider-icon1" data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <!-- bottom indicators three END HERE-->	
  <!-- slider images area START HERE -->
  <div class="carousel-inner">
    <div class="carousel-item active"> <!-- img1 start here -->
      <img class="d-block w-100" src="assets/images/s-img2.jpg" alt="First slide">
      <div class="carousel-caption homeslider-caption1"> <!-- Slider inner caption1 start here -->
	    <h5 class="homeslider-text1">DEPARTMENT OF<br> INFORMATION ENGINEERING</h5>
	     <p class="home-shortcap1"> University of Padua </p>
	  </div> <!-- Slider inner caption1 end here -->
    </div> <!-- img1 end here -->
    <div class="carousel-item"> <!-- img2 start here -->
      <img class="d-block w-100" src="assets/images/s-img3.jpg" alt="Second slide">
      <div class="carousel-caption homeslider-caption2"> <!-- Slider inner caption2 start here -->
	    <h5 class="homeslider-text2">NOTIFICATIONS<br> WEB APPLICATION</h5>
	     <p class="home-shortcap2"> Web Applications Project 2022 </p>
	  </div> <!-- Slider inner caption2 end here -->
    </div> <!-- img1 end here -->
    <div class="carousel-item"> <!-- img3 start here -->
      <img class="d-block w-100" src="assets/images/s-img1.jpg" alt="Third slide">
      <div class="carousel-caption homeslider-caption3"> <!-- Slider inner caption3 start here -->
	    <h5 class="homeslider-text3">ANYWHERE ANYTIME</h5>
	    <p class="home-shortcap3"> make your life easier and manageable </p>
	  </div> <!-- Slider inner caption3 end here -->
    </div> <!-- img1 end here -->
  </div>
  <!-- slider images area END HERE -->

  <!-- Previous and next buttons start here -->
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  <!-- Previous and next buttons end here -->

</div>
<!-------------------------------------------------------------- Slider END HERE -------------------------------------------------------------->

<!-------------------------------------------------------------- depart area START HERE -------------------------------------------------------------->

<div class="container-fluid home-departments">
	<div class="row">
		<div class="col-lg-3 col-md-6 col-sm-12 col-xs-12">
			<center>
			<div class="home-itdeprt">
				<img class="img-fluid" src="assets/images/it.png">
				<a class="InfoTech" href="#"><h4 class="info">Information</h4>
				<h6 class="tech">Technology</h6></a>
			</div>
			</center>
		</div>
		<div class="col-lg-3 col-md-6 col-sm-12 col-xs-12">
			<center>
			<div class="home-softdeprt">
				<img class="img-fluid" src="assets/images/soft.png">
				<a class="SoftEng" href="#"><h4 class="soft">Computer</h4>
				<h6 class="soft-eng">Engineering</h6></a>
			</div>
			</center>
		</div> 
		<div class="col-lg-3 col-md-6 col-sm-12 col-xs-12">
			<center>
			<div class="home-eledeprt">
				<img class="img-fluid" src="assets/images/ele.png">
				<a class="EleEng" href="#"><h4 class="ele">Internet</h4>
				<h6 class="ele-eng">Computing</h6></a>
			</div>
			</center>
		</div>
		<div class="col-lg-3 col-md-6 col-sm-12 col-xs-12">
			<center>
			<div class="home-teledeprt">
				<img class="img-fluid" src="assets/images/tele.png">
				<a class="TeleEng" href="#"><h4 class="tele">Telecom</h4>
				<h6 class="tele-eng">Engineering</h6></a>
			</div>
			</center> 
		</div>
	</div>
</div>

<!-------------------------------------------------------------- depart area END HERE -------------------------------------------------------------->

<!-------------------------------------------------------------- about area START HERE -------------------------------------------------------------->

<div class="about">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
				<h1 class="about-iict">Director of DEI</h1>
				<p class="director-info"> 
					Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's it has a more-or-less normal distribution standard dummy text ever <br> since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.<br> It was popularised in the 1960s with the Ipsum passages, and more but also the leap into electronic typesetting, recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.  
				</p>
				<!-- <a href="#"><button type="button" class="btn btn-outline-primary director-btn">read more</button></a> -->
			</div>
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
				<img class="img-fluid" src="assets/images/director1.png">
			</div>
		</div>
	</div>
</div>

<!-------------------------------------------------------------- about area END HERE -------------------------------------------------------------->


	
<!------------------------------------------------------------ Meet Professionals area START HERE ------------------------------------------------------->
<div class="staff">
<div class="container">
	<h1 class="meet-professionals">Meet Professionals</h1>
		<img class="bottom-border" src="assets/images/border1.png">
		<p class="staff-para">Lorem Ipsum is simply dummy text the industry's it has a more-or-less normal distribution standard dummy text ever<br>Lorem Ipsum is simply dummy text the industry's it has a more-or-less normal distribution standard dummy text ever</p>

		<div class="row staff-half1"> <!-- staff-half1 start here -->

			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 staff1">
				<img class="img-fluid" width="250" src="assets/images/staffimg1.png">	
			</div>

			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 staff2">
				<h4 class="home-teacherName1">FERRO NICOLA</h4>
				<h6 class="home-teachtitle1">Professore ordinario</h6>
				<div class="iconsforteacher">
				<a href="https://www.dei.unipd.it/~ferro"><i class="fa fa-facebook fbicon" aria-hidden="true"></i></a>
				<a href="https://www.dei.unipd.it/~ferro"><i class="fa fa-twitter twiticon" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-linkedin inicon" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-google-plus gmailicon" aria-hidden="true"></i></a>
				</div>
			</div>

			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 staff3">
				<img class="img-fluid" width="200" src="assets/images/staffimg2.png">	
			</div>

			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 staff4">
				<h4 class="home-teacherName2">ZINGIRIAN NICOLA</h4>
				<h6 class="home-teachtitle2">Professore associato confermato</h6>
				<div class="iconsforteacher">
				<a href="https://www.dei.unipd.it/~panico"><i class="fa fa-facebook fbicon" aria-hidden="true"></i></a>
				<a href="https://www.dei.unipd.it/~panico"><i class="fa fa-twitter twiticon" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-linkedin inicon" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-google-plus gmailicon" aria-hidden="true"></i></a>
				</div>
			</div>

		</div> <!-- staff-half1 end here -->
<br><br>
		<div class="row staff-half2"> <!-- staff-half1 start here -->

			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 staff5">
				<img class="img-fluid" width="200" src="assets/images/staffimg3.png">	
			</div>

			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 staff6">
				<h4 class="home-teacherName3">FISCHETTI MATTEO</h4>
				<h6 class="home-teachtitle3">Professore ordinario</h6>
				<div class="iconsforteacher">
				<a href="https://www.dei.unipd.it/~fisch"><i class="fa fa-facebook fbicon" aria-hidden="true"></i></a>
				<a href="https://www.dei.unipd.it/~fisch"><i class="fa fa-twitter twiticon" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-linkedin inicon" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-google-plus gmailicon" aria-hidden="true"></i></a>
				</div>
			</div>

			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 staff7">
				<img class="img-fluid" class="staffimg4" width="200" src="assets/images/staffimg4.jpg">	
			</div>

			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 staff8">
				<h4 class="home-teacherName4">DALLA MAN CHIARA</h4>
				<h6 class="home-teachtitle4">Professore associato confermato</h6>
				<div class="iconsforteacher">
				<a href="#"><i class="fa fa-facebook fbicon" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-twitter twiticon" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-linkedin inicon" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-google-plus gmailicon" aria-hidden="true"></i></a>
				</div>
			</div>

		</div> <!-- staff-half1 end here -->
		<!-- <center><a href="#"><button type="button" class="btn btn-outline-primary staff-btn">view all</button></a></center> -->

	
</div>
</div>

<!---------------------------------------------------------- Meet Professionals area END HERE ------------------------------------------------------------>

<!----------------------------- Gallery portion start here ------------------------------->

<div class="container gallery-heading">
	<h1 class="gallery-title">Gallery</h1>
	<img class="bottom-border1" src="assets/images/border1.png">
	<p class="gallery-para">Lorem ipsum dolor sit amet, consectetur adip</p>
</div>

<div class="gallery-bg">
<div class="container-fluid">
	<div class="gallery">
		<div class="row gallery-row1">
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 gallery-img1">
				<a href="assets/images/img1full.jpg" data-lightbox="vacation">
				<img src="assets/images/img1.png" class="img-fluid a"/>
				</a>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 gallery-img2">
				<a href="assets/images/img2full.jpg" data-lightbox="vacation">
				<img src="assets/images/img2.png" class="img-fluid b"/>
				</a>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 gallery-img3">
				<a href="assets/images/img3full.jpg" data-lightbox="vacation">
				<img src="assets/images/img3.png" class="img-fluid c"/>
				</a>
			</div>
		</div>
		
		<div class="row gallery-row2">
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 gallery-img4">
				<a href="assets/images/img4full.jpg" data-lightbox="vacation">
				<img src="assets/images/img4.png" class="img-fluid a"/>
				</a>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 gallery-img5">
				<a href="assets/images/img5full.jpg" data-lightbox="vacation">
				<img src="assets/images/img5.png" class="img-fluid b"/>
				</a>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 gallery-img6">
				<a href="assets/images/img6full.png" data-lightbox="vacation">
				<img src="assets/images/img6.png" class="img-fluid c"/>
				</a>
			</div>
		</div>

		<div class="row gallery-row3">
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 gallery-img7">
				<a href="assets/images/img7full.jpg" data-lightbox="vacation">
				<img src="assets/images/img7.png" class="img-fluid a"/>
				</a>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 gallery-img8">
				<a href="assets/images/img8full.jpg" data-lightbox="vacation">
				<img src="assets/images/img8.png" class="img-fluid b"/>
				</a>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 gallery-img9">
				<a href="assets/images/img9full.jpg" data-lightbox="vacation">
				<img src="assets/images/img9.png" class="img-fluid c"/>
				</a>
			</div>
		</div>   
 </div>
 	<!-- <center><a href="#"><button type="button" class="btn btn-outline-primary gallery-btn">view all</button></a></center> -->
</div> 
</div>



<!----------------------------- Gallery portion End here --------------------------------->


<!----------------------------- news and events portion End here --------------------------------->
<div class="events&news">
	
<div class="container news-heading">
	<h1 class="news-title">Events & News</h1>
	<img class="bottom-border2" src="assets/images/border1.png">
	<p class="news-para">Lorem ipsum dolor sit amet, consectetur adip</p>
</div>

<div class="container-fluid">

	<div class="row events&news-row">

		

			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 newspart1">
				<img class="img-fluid" src="assets/images/news-img1.png">
				<p class="news-paraleft">5/Dec/2022</p>
				<p class="news-pararight">Seminar for IT students</p>
				<p class="newspara-img1">IT Professionals join us on Mon 11am, Mr Matteo disscus about freelancing, abput big data IT Professionals join us on Mon 11am, Mr Ferro disscus about freelancing, abput big data IT Professionals join us on Mon 11am, IT Professionals join us on Mon 11am, IT Professionals join us on Mon 11am, Mr Kamran disscus about freelancing,</p>
			</div>

			<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 newspart2">
				<div class="event-one">
					<img class="img-fluid" src="assets/images/news-img2.png">
					<h6 class="event1-date">5/Dec/2022 / Disscussions</h6>
					<p class="event1para">IT Professionals join us 11am</p>	
				</div>

				<div class="event-two">
					<img class="img-fluid" src="assets/images/news-img3.png">
					<h6 class="event1-date">5/Dec/2022 / Disscussions</h6>
					<p class="event1para">IT Professionals join us 11am</p>	
				</div>

			</div>

			<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 newspart3">
				<div class="event-one">
					<img class="img-fluid" src="assets/images/news-img2.png">
					<h6 class="event1-date">5/Dec/2022 / Disscussions</h6>
					<p class="event1para">IT Professionals join us 11am</p>
				</div>

				<div class="event-two">
					<img class="img-fluid" src="assets/images/news-img3.png">
					<h6 class="event1-date">5/Dec/2022 / Disscussions</h6>
					<p class="event1para">IT Professionals join us 11am</p>	
				</div>

			</div>			

			
		

		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 newspart4">
			<img class="img-fluid" src="assets/images/sideimg.png">
			<div class="upcomingevent-text1">
				<h1 class="coming-date1">13</h1>
				<h2 class="coming-month1">Jan</h2>
				<p class="coming-topic1">final year project display open day <br> presentations and seminar held</p>
				<h6 class="coming-border1"></h6>
				<i class="coming-clockicon1 fa fa-clock-o" aria-hidden="true"></i><h4 class="tyimg1">8:00 am - 6:00 pm</h4>
				<i class="coming-locationicon1 fa fa-map-marker" aria-hidden="true"></i><h4 class="location1">DEI, UniPD</h4>
			</div>
			<div class="upcomingevent-text2">
				<h1 class="coming-date2">14</h1>
				<h2 class="coming-month2">Jan</h2>
				<p class="coming-topic2">final year project display open day <br> presentations and seminar held</p>
				<h6 class="coming-border2"></h6>
				<i class="coming-clockicon2 fa fa-clock-o" aria-hidden="true"></i><h4 class="tyimg2">8:00 am - 6:00 pm</h4>
				<i class="coming-locationicon2 fa fa-map-marker" aria-hidden="true"></i><h4 class="location2">DEI, UniPD</h4>
			</div>
			<div class="upcomingevent-text3">
				<h1 class="coming-date3">15</h1>
				<h2 class="coming-month3">Jan</h2>
				<p class="coming-topic3">final year project display open day <br> presentations and seminar held</p>
				<h6 class="coming-border3"></h6>
				<i class="coming-clockicon3 fa fa-clock-o" aria-hidden="true"></i><h4 class="tyimg3">8:00 am - 6:00 pm</h4>
				<i class="coming-locationicon3 fa fa-map-marker" aria-hidden="true"></i><h4 class="location3">DEI, UniPD</h4>
			</div>
		</div>

	</div>

</div>



</div>

<!----------------------------- news and events portion End here --------------------------------->


<!----------------------------- Footer start here --------------------------------->

<br>
<br>

<div class="Footer">
	<div class="container-fluid">
		<img class="footerlogo-img img-fluid" width="100" src="assets/images/footer-logo.png">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 aboutusfooter">
				<h1 class="footer-heading1">About us</h1>
				<p class="footer-paraAbout1">Lorem ipsum dolor sit amet, meet us lorem ipsum eiusmod tempor incidid unt university labore. sindh it amet, consectetur adipis jamshorrorr incidid unt ut labore. Lorem ipsum dolor sit amet, meet us lorem ipsum eiusmod tempor.</p>
				<!-- <a href="#"><button type="button" class="btn btn-outline-primary footer-btn">read more</button></a> -->
			</div>

			<div class="col-lg-4 col-md-2 col-sm-12 col-xs-12 explorefooter">
				<h1 class="footer-heading2">Explore</h1>
				<a class="a" href="#"><li>Home</li></a>
				<a class="b" href="#"><li>News & Events</li></a>
				<a class="c" href="#"><li>Gallery</li></a>
				<a class="d" href="#"><li>Staff</li></a>
				<a class="e" href="#"><li>Courses</li></a>
				<a class="f" href="#"><li>About</li></a>
			</div>

			<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 visitfooter">
				<h1 class="footer-heading3">visit</h1>
				<p class="footer-paraAbout3">university of sindh jamshoro iict institute of information communication and technology</p>
				<div class="social-icon">
				<a class="a-icon" href="#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a>
				<a class="b-icon" href="#"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a>	
				<a class="c-icon" href="#"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a>
				<a class="d-icon" href="#"><i class="fa fa-twitter-square" aria-hidden="true"></i></a>	
				</div>
				 <form class="form-inline my-2 my-lg-0">
     				<input class="form-control mr-sm-2 footer-form" type="search" placeholder="Search" aria-label="Search">
    			 	<button class="btn btn-outline-success my-2 my-sm-0 footer-search" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
   				 </form>
			</div>
			
		</div>	
	</div>
</div>



<!----------------------------- Footer end End here --------------------------------->









	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<script src="assets/js/jquery-3.2.1.min.js"></script>
	<script src="assets/js/bootstrap.js"></script> 
	<script type="text/javascript" src="assets/js/lightbox.min.js"></script>

</body>
</html>