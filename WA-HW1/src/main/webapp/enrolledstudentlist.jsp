<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="MVC.Controller.DatabaseConnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.oracle.wls.shaded.org.apache.xpath.operations.Bool" %><%--
  Created by IntelliJ IDEA.
  User: signa
  Date: 06/06/2022
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student List</title>
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
<center><h1>Enrolled Students</h1>



<%
    if(session.getAttribute("login_teacher_email")==null || session.getAttribute("login_teacher_email")=="")
    {
        response.sendRedirect("index.jsp");
    }
    int course_id = Integer.parseInt(request.getParameter("course_id"));

%>
<a href="Teacher_course_list.jsp?id=<%=course_id%>"><button type="button" class="btn btn-secondary btn-group-lg">Back</button></a>
</center>


<div class="col-md-2"></div>
<div class="col-sm-8">
    <div class="panel-body">
        <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Gender</th>

            </tr>
            </thead>

            <%

                Connection con;
                PreparedStatement pst;
                ResultSet rs,rs2;

                con= DatabaseConnection.initializeDatabase();

                /*String query = "select lms_course.course_id, lms_attend.student_id, lms_course.name, lms_course.description, lms_course.prerequistie \n" +
                        "from lms_course, lms_attend\n" +
                        "where lms_attend.student_id = (select lms_student.student_id from lms_student where lms_student.email='" + student_mail + "')" +
                        "and lms_attend.course_id = lms_course.course_id and lms_attend.approved = '1'";

                String query ="select lms_student.name,lms_student.email,lms_student.gender, lms_attend.student_id from lms_attend, lms_student \n" +
                        "where lms_attend.student_id=(select lms_attend.student_id from lms_attend where lms_attend.course_id= '" + course_id + "')\n"
                        + "and lms_attend.student_id = lms_student.student_id and lms_attend.approved='1'";
*/
                String query = "select * from lms_attend where course_id='"+course_id+"'and approved='1'";
                Statement st = con.createStatement();

                rs =  st.executeQuery(query);

                while(rs.next())
                {
                    int student_id = rs.getInt("student_id");

                    String query2 = "select * from lms_student where student_id='"+student_id+"'";

                Statement st2 = con.createStatement();

                rs2 = st2.executeQuery(query2);



                while (rs2.next()) {
            %>


            <tbody>
            <tr>

                <td><%=rs2.getString("name") %></td>
                <td><%=rs2.getString("email") %></td>
                <td><%=rs2.getString("gender") %></td>

                <td>
                   <!-- <a class="btn btn-danger btn-sm" href="deletestd.jsp?id=<%=course_id%>&teacher_id=0"><span class="glyphicon glyphicon-trash"></span> Delete</a>-->
                    <a class="btn btn-danger btn-sm" href="removestdformcourse.jsp?id=<%=rs2.getString("student_id")%>&cid=<%=course_id%>">
                    <span class="glyphicon glyphicon-trash"></span> Delete</a>
                </td>
            </tr>
            </tbody>

            <%

                    }

                }
            %>

        </table>
    </div>

</div>
<div class="col-md-2"></div>
</div>




</body>
</html>
