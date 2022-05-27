<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="MVC.Controller.DatabaseConnection" %><%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 5/5/2022
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Course</title>
</head>
<body>
<%@ include file="styling/header.jsp" %>
<center><h1>Add Course</h1></center>

<div class="row">
    <div class="col-md-2"></div>
    <div class="col-sm-8">
        <div class="panel-body">
            <!-- Trigger the modal with a button -->
            <button type="button" class='m btn btn-success' data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus-sign"></span> Assign Course to Teacher</button>
            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Assign Course to Teacher</h4>
                        </div>
                        <div class="modal-body">
                            <p>From Below boxes select the teacher and assign the subject</p>
                            <form  method="POST" action=./AddCourseServlet >
                                <%
                                    PreparedStatement pst,pst2;
                                    ResultSet rs,rs2;

                                    Connection con = DatabaseConnection.initializeDatabase();

                                    pst = con.prepareStatement("select teacher_id, name from lms_teacher");
                                    pst2 = con.prepareStatement("select course_id, name from lms_course where course_id not in (select course_id from lms_assign_courses)");
                                    rs2= pst2.executeQuery();
                                    rs = pst.executeQuery();
                                %>
                                <div class="col-md-4">
                                    <div align="left">
                                        <select name = "genderdropdown_teacher_admin">
                                            <% while(rs.next()) {  %>
                                            <option value = "<%= rs.getString("teacher_id")%>" selected><%= rs.getString("name")%></option>
                                            <% }  %>
                                        </select>
                                    </div>
                                </div>
                                </br>
                                <div class="col-md-4">
                                    <div align="left">
                                        <select name = "genderdropdown_course_admin">
                                            <% while(rs2.next()) {  %>
                                            <option value = "<%= rs2.getString("course_id")%>" selected><%= rs2.getString("name")%></option>
                                            <% }  %>
                                        </select>
                                    </div>
                                </div>
                                </br>
                                <div alight="right">
                                    <input type="submit" id="submit_assign" value="submit_assign" name="submit_assign" class="btn btn-info">
                                    <input type="reset" id="reset" value="Reset" name="reset" class="btn btn-warning">
                                </div>

                                <div align="right">
                                    <p><a href="addcoursesandteacher.jsp">Click Back</a></p>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <form method="post" action="./AddCourseServlet">
                <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                    <thead>
                    <tr>
                        <th>Course Name</th>
                        <th><input class="form-group" type="text" name="coursename" id="coursename" placeholder="Course name" title="Enter Course Name" required></th>
                    </tr>
                    <tr>
                        <th>Course Description</th>
                        <th><input class="form-group" name="desc" id="desc" placeholder="Course Description" title="Course Description" required></th>
                    </tr>
                    <tr>
                        <th>Prerequisite</th>
                        <th><input multiple="multiple" class="form-group"  id="prereq" name="prereq" placeholder="Prerequisite" title="Make a list of Prerequisite of the course" required></th>
                    </tr>

                    <div>${RegisterSuccessMsg}</div>
                    <tr>

                        <th><a class="btn btn-danger" href="Adminpage.jsp">Cancel</a></th>
                        <th><input class="btn btn-info" type="submit" name="btn_register" value="Register"></th>
                    </tr>
                    </thead>
                </table>
            </form>
        </div>
    </div>
</div>


<%@ include file="styling/footer.jsp" %>
</body>

</html>
