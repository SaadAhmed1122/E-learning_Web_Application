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
        <title>Title</title>
    </head>
    <body>

        <h1>Welcome to Student Page</h1>
        <center>
        <%
            if (session.getAttribute("login") == null || session.getAttribute("login") == "") {
                response.sendRedirect("index.jsp");
            }

        %>
        <%@ include file="styling/header.jsp" %>

        Welcome, <%=session.getAttribute("login")%>!

        <%
            int stud_id = 0;
            Connection con0;

            ResultSet rs0;
            String student_mail0 = (String) session.getAttribute("login");

            con0 = DatabaseConnection.initializeDatabase();
            String query0 = "select lms_student.student_id from lms_student where lms_student.email='" + student_mail0 + "'";
            Statement st0 = con0.createStatement();

            rs0 = st0.executeQuery(query0);

            while (rs0.next()) {
                stud_id = rs0.getInt(1);
            }
        %>

        <h1>Dashboard</h1>

        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-sm-8">
                <div class="panel-body">
                    <table id="tbl-courses" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                        <thead>
                        <tr>
                            <th>Course Name</th>
                            <th>Course Description</th>
                            <th>Course Prerequistie</th>
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
                            <td><%=rs.getString("name")%></td>
                            <td><%=rs.getString("description")%></td>
                            <td><%=rs.getString("prerequistie")%></td>
                            <td><a href="CoursePage.jsp?id=<%=rs.getString("course_id")%>">View</a></td>
                        </tr>
                        <%
                }
                %>
                    </table>
                </div>
            </div>
        </div>
        <!-- Trigger the modal with a button -->
        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Request New Course</button>
        <!-- Modal -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Request New Course</h4>
                    </div>
                    <div class="modal-body">
                        <p>From Below box select the desired course</p>
                        <form  method="POST" action=./AttendServlet >
                            <%
                                PreparedStatement pst1;
                                ResultSet rs1;

                                Connection con1 = DatabaseConnection.initializeDatabase();

                                pst1 = con.prepareStatement("select lms_course.course_id, lms_course.name from lms_course where lms_course.course_id not in (select lms_attend.course_id from lms_attend where lms_attend.student_id = ?)");
                                pst1.setInt(1, stud_id);
                                rs1 = pst1.executeQuery();
                            %>

                            </br>
                            <div class="col-md-4">
                                <div align="left">

                                    <select name = "genderdropdown_course">
                                        <% while(rs1.next()) {  %>
                                        <option value = "<%= rs1.getString("course_id")%>" selected><%=rs1.getString("name")%></option>
                                        <% }  %>
                                    </select>
                                    <input type="hidden" name="student_id" value="<%=stud_id%>"/>
                                </div>
                            </div>

                            </br>

                            <div alight="right">
                                <input class="btn btn-info" type="submit" name="submit_subject" value="submit_subject">
                                <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                            </div>

                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
            <a href="MessageTeacher.jsp" class="btn btn-info btn-lg" role="button">Send Message</a>
        <h3>
            <a href="logout.jsp">Logout</a>
        </h3>
        </center>

    </body>
</html>
