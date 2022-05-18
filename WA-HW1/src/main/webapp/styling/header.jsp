<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Header</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
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
                    <li >
                        <a  href="showassignteacher.jsp">Show Assigned Courses</a>
                    </li>
        </ul>


        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
            <li><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-log-in"></span> Login / Sign Up <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#">Login</a></li>
                    <li><a href="#">Sign Up</a></li>
                </ul>
            </li>
        </ul>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>