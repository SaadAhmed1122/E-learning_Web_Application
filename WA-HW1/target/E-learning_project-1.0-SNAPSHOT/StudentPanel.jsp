<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="MVC.Controller.DatabaseConnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%--
<%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 4/10/2022
  Time: 12:45 AM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Student Dashboard</title>
    <link rel="icon" type="image/png" href="./assets/images/iict.jpg">
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
    .red{
        font-color: red;
    }


</style>
<body>
<%
    int stud_id = 0;
    String student_name= "";
    Connection con0;

    ResultSet rs0;
    String student_mail0 = (String) session.getAttribute("login");

    con0 = DatabaseConnection.initializeDatabase();
    String query0 = "select lms_student.student_id,lms_student.name from lms_student where lms_student.email='" + student_mail0 + "'";
    Statement st0 = con0.createStatement();

    rs0 = st0.executeQuery(query0);

    while (rs0.next()) {
        stud_id = rs0.getInt(1);
        student_name= rs0.getString(2);
    }
%>
<center>



    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="panel-body">
                <h1>Student Dashboard</h1>
                <p>Welcome, <label class="red"><%=student_name%>!</label>                 <a class="btn btn-danger" href="logout.jsp">Logout</a></p>




            <%--                Model --%>
    <!-- Trigger the modal with a button -->
    <a href="MessageTeacher.jsp" class="btn btn-info" role="button">Send Message</a>
    <button type="button" class='m btn btn-success' data-toggle="modal" data-target="#requestmodel"><span class="glyphicon glyphicon-plus-sign"></span> Request New Course</button>

            <div>
                <h1></h1>
            </div>
    <!-- Modal -->
    <div id="requestmodel" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Request New Course</h4>

                </div>
                <div class="modal-body">
                    <p>From Below box select the desired course</p>
                    <form method="POST" action=./AttendServlet>
                                            <%
                                                PreparedStatement pst1;
                                                ResultSet rs1;

                                                Connection con1 = DatabaseConnection.initializeDatabase();

                                                pst1 = con1.prepareStatement("select lms_course.course_id, lms_course.name from lms_course where lms_course.course_id not in (select lms_attend.course_id from lms_attend where lms_attend.student_id = ?)");
                                                pst1.setInt(1, stud_id);
                                                rs1 = pst1.executeQuery();
                                            %>

                                            </br>

                        <div class="col-md-4"></div>
                                            <div class="col-md-4">
                                                <div align="left">

                                                    <select name="genderdropdown_course">
                                                        <% while (rs1.next()) { %>
                                                        <option value="<%= rs1.getString("course_id")%>" selected><%=rs1.getString("name")%>
                                                        </option>
                                                        <% } %>
                                                    </select>
                                                    <input type="hidden" name="student_id" value="<%=stud_id%>"/>
                                                </div>
                                            </div>
                        <div class="col-md-4"></div>

                                            </br>

                                                <div alight="right">
                                                    <input class="btn btn-info" type="submit" name="submit_subject" value="Send Request">
                                                    <!--<input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">-->
                                                </div>

                                                                        </form>

                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
<%--                Model End--%>


                <table id="tbl-courses" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    <thead>
                    <tr>
                        <th>Course Name</th>
                        <th>Course Description</th>
                        <th>Course Prerequisite</th>
                        <th>Course Material</th>
                    </tr>
                        <%
                Connection con;
                PreparedStatement pst;
                ResultSet rs;
                String student_mail = (String) session.getAttribute("login");
                con = DatabaseConnection.initializeDatabase();
                String query = "select lms_course.course_id, lms_attend.student_id, lms_course.name, lms_course.description, lms_course.prerequistie \n" +
                        "from lms_course, lms_attend\n" +
                        "where lms_attend.student_id = (select lms_student.student_id from lms_student where lms_student.email='" + student_mail + "')" +
                        "and lms_attend.course_id = lms_course.course_id and lms_attend.approved = '1'";
                Statement st = con.createStatement();

                rs = st.executeQuery(query);


                while (rs.next()) {
                    %>
                    <tr>
                        <td><%=rs.getString("name")%>
                        </td>
                        <td><%=rs.getString("description")%>
                        </td>
                        <td><%=rs.getString("prerequistie")%>
                        </td>
                        <td><a class="btn btn-info" href="CoursePage.jsp?id=<%=rs.getString("course_id")%>">View</a></td>
                    </tr>
                        <%
                }
                %>
                </table>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
    <!-- Trigger the modal with a button -->
<%--    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Request New Course--%>
    </button>
    <!-- Modal -->
<%--    <div id="myModal" class="modal fade" role="dialog">--%>
<%--        <div class="modal-dialog">--%>

<%--            <!-- Modal content-->--%>
<%--            <div class="modal-content">--%>
<%--                <div class="modal-header">--%>
<%--                    <button type="button" class="close" data-dismiss="modal">&times;</button>--%>
<%--                    <h4 class="modal-title">Request New Course</h4>--%>
<%--                </div>--%>
<%--                <div class="modal-body">--%>
<%--                    <p>From Below box select the desired course</p>--%>
<%--                    <form method="POST" action=./AttendServlet>--%>
<%--                        <%--%>
<%--                            PreparedStatement pst1;--%>
<%--                            ResultSet rs1;--%>

<%--                            Connection con1 = DatabaseConnection.initializeDatabase();--%>

<%--                            pst1 = con.prepareStatement("select lms_course.course_id, lms_course.name from lms_course where lms_course.course_id not in (select lms_attend.course_id from lms_attend where lms_attend.student_id = ?)");--%>
<%--                            pst1.setInt(1, stud_id);--%>
<%--                            rs1 = pst1.executeQuery();--%>
<%--                        %>--%>

<%--                        </br>--%>
<%--                        <div class="col-md-4">--%>
<%--                            <div align="left">--%>

<%--                                <select name="genderdropdown_course">--%>
<%--                                    <% while (rs1.next()) { %>--%>
<%--                                    <option value="<%= rs1.getString("course_id")%>" selected><%=rs1.getString("name")%>--%>
<%--                                    </option>--%>
<%--                                    <% } %>--%>
<%--                                </select>--%>
<%--                                <input type="hidden" name="student_id" value="<%=stud_id%>"/>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        </br>--%>

<%--                        <div alight="right">--%>
<%--                            <input class="btn btn-info" type="submit" name="submit_subject" value="submit_subject">--%>
<%--                            <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">--%>
<%--                        </div>--%>

<%--                    </form>--%>

<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </div>--%>

</center>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>
