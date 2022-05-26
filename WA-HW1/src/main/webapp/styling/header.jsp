<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Header</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<style>


body {
  overflow-x: hidden;
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
  background-image: url("./assets/images/bg.jpg");
  background-color: #cccccc;
}

/* Toggle Styles */

h1{
    padding-top: 30px;
    margin-top: 0 !important;
    margin: 0 !important;
}
element.style {
}
.table-responsive {
    min-height: .01%;
    overflow-x: auto;
}
.table-bordered {
    border: 1px solid #ddd;
}
.table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 20px;
}

table {
    background-color: beige;
}

#viewport {
  padding-left: 250px;
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
}

#content {
  width: 100%;
  position: relative;
  margin-right: 0;
}

/* Sidebar Styles */

#sidebar {
  z-index: 1000;
  position: fixed;
  left: 250px;
  width: 250px;
  height: 100%;
  margin-left: -250px;
  overflow-y: auto;
  background: #337ab7;
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
}

#sidebar header {
  background-color: #d9534f;
  font-size: 20px;
  line-height: 52px;
  text-align: center;
}

#sidebar header a {
  color: #fff;
  display: block;
  text-decoration: none;
}

#sidebar header a:hover {
  color: #fff;
  background-color: #d9534f;
}

#sidebar .nav{
  
}

#sidebar .nav a{
  background: none;
  border-bottom: 1px solid #455A64;
  color: #CFD8DC;
  font-size: 14px;
  padding: 16px 24px;
}

#sidebar .nav a:hover{
  background: none;
    background-color: #d9534f;
  color: #ECEFF1;
}

#sidebar .nav a i{
  margin-right: 16px;

}
.m {
margin-bottom: 5px;
margin-top: 5px;
}

</style>
<body>
    <!-- 
<div class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">

                <div class="navbar-header">
                    <button class="navbar-toggle" data-target="#mobile_menu" data-toggle="collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    <a href="#" class="navbar-brand">E-learning</a>
                </div>
                <div class="navbar-collapse collapse" id="mobile_menu">
                <ul class="nav navbar-nav">
            <li >
                <a  href="Adminpage.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li >
                <a  href="UserView.jsp"   name="showstudent" value="Student List">Add Student</a>
            </li>
            <li >
                <a  href="TeacherList.jsp">Add Teacher</a>
            </li>
            <li >
                <a  href="admin_student_requests.jsp">Student Request</a>
            </li>
                    <li >
                <a  href="addcoursesandteacher.jsp">Add Courses and Teacher</a>
            </li>
        </ul>


        <ul class="nav navbar-nav navbar-right">
            <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
            
        </ul>
                </div>
            </div>
        </div>
    </div>
</div>
    -->
    <div id="viewport">
        <!-- Sidebar -->
        <div id="sidebar">
          <header>
            <a href="#">E-Learning</a>
          </header>
          <ul class="nav">
            <li>
              <a href="Adminpage.jsp">
                <i class="zmdi zmdi-view-dashboard"><span class="glyphicon glyphicon-home"></span></i> Dashboard
              </a>
            </li>
            <li>
              <a href="UserView.jsp">
                <i class="zmdi zmdi-link"><span class="glyphicon glyphicon-education"></span></i> Add Student
              </a>
            </li>
            <li>
              <a href="TeacherList.jsp">
                <i class="zmdi zmdi-widgets"><span class="glyphicon glyphicon-user"></span></i> Add Teacher
              </a>
            </li>
            <li>
              <a href="admin_student_requests.jsp">
                <i class="TeacherList.jsp"><span class="glyphicon glyphicon-hourglass"></span></i> Student Requests
              </a>
            </li>
            <li>
              <a href="addcoursesandteacher.jsp">
                <i class="zmdi zmdi-info-outline"><span class="glyphicon glyphicon-book"></span></i> Add Courses and Teachers
              </a>
            </li>
            <li>
              <a href="Student_subject_request.jsp">
                <i class="zmdi zmdi-info-outline"><span class="glyphicon glyphicon-plus"></span></i> Course Requests
              </a>
            </li>
              <li >
                  <a  href="showassignteacher.jsp">
                  <i class="zmdi zmdi-info-outline"><span class="glyphicon glyphicon-copy"></span></i> Show Assigned Courses
                  </a>
              </li>
            
            <li><a href="logout.jsp"><i class="zmdi zmdi-info-outline"><span class="glyphicon glyphicon-log-out"></span></i> Logout</a></li>
            
          </ul>
        </div>
        <!-- Content -->
        <div id="content">
                  <!--   
          <div class="container-fluid">
            <h1>Simple Sidebar</h1>
            <p>
              Make sure to keep all page content within the 
              <code>#content</code>.
            </p>
          </div>
         -->