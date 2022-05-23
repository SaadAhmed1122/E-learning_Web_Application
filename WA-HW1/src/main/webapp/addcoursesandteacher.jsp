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
<%
    if(session.getAttribute("login_admin")==null || session.getAttribute("login_admin")=="")
    {
        response.sendRedirect("index.jsp");
    }

%>
<%@ include file="styling/header.jsp" %>
<h1>Add Course</h1>
<br>
<div class="col-md-4">
    <form method="post" action="./AddCourseServlet">

        <div class="form-group">
            <label for="coursename">Course Name</label>
            <input class="form-group" type="text" name="coursename" id="coursename" placeholder="Course name" title="Enter Course Name" required>
        </div>

        <div class=" form-group">
            <label for="desc">Course Description</label>
            <input class="form-group" name="desc" id="desc" placeholder="Course Description" title="Course Description" required>
        </div>


        <div class=" form-group">
            <label for="prereq">Prerequisite</label>
            <input multiple="multiple" class="form-group"  id="prereq" name="prereq" placeholder="Prerequisite" title="Make a list of Prerequisite of the course" required>
        </div>
        <br>
        <input class="btn btn-primary" type="submit" name="btn_register" value="Register">
        <h3><a href="Adminpage.jsp">Cancel</a></h3>

    </form>

</div>
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Assign Course to Teacher</button>
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
                <p>From Below boxes selected the teacher and assign the subject.</p>
<%--                <form  method="POST" action="./AddCourseServlet" >--%>
                <form  method="POST" action="./AddCourseServlet" >
                        <%
                PreparedStatement pst,pst2;
                ResultSet rs,rs2;

                Connection con = DatabaseConnection.initializeDatabase();
//                int id = Integer.parseInt(request.getParameter("id"));
                pst = con.prepareStatement("select * from lms_teacher");
                pst2 = con.prepareStatement("select * from lms_course");
                rs2= pst2.executeQuery();
                rs = pst.executeQuery();


            %>
                    <div class="col-md-4">
                            <div align="left">
                                <select name = "genderdropdown_teacher">
                                   <% while(rs.next()) {  %>
                                    <option value = "<%= rs.getString("name")%>" selected><%= rs.getString("name")%></option>
                                    <% }  %>
                                </select>
                            </div>
                    </div>
                </br>
                    <div class="col-md-4">
                            <div align="left">
                                <select name = "genderdropdown_course">
                                   <% while(rs2.next()) {  %>
                                    <option value = "<%= rs2.getString("name")%>" selected><%= rs2.getString("name")%></option>
                                    <% }  %>
                                </select>
                            </div>
                    </div>

                    </br>

                    <div alight="right">
                        <a href="index.jsp"> <input type="submit" id="submit" value="submit" name="assign_course" class="btn btn-info"></a>
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
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

</body>
<%--<%@ include file="styling/footer.jsp" %>--%>
</html>
