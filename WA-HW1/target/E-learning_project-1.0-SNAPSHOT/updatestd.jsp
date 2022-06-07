<%@ page import="java.sql.Connection" %>
<%@ page import="MVC.Controller.DatabaseConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.oracle.wls.shaded.org.apache.xpath.operations.Bool" %><%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 4/15/2022
  Time: 5:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    PreparedStatement pst1;
    ResultSet rs1;
    Boolean approval=null;

    Connection con = DatabaseConnection.initializeDatabase();
    int id = Integer.parseInt(request.getParameter("id"));


    pst1 = con.prepareStatement("select * from lms_student where student_id = ?");
    pst1.setInt(1, id);
    rs1 = pst1.executeQuery();




    if(request.getParameter("submit")!=null)
    {
        int student_id = Integer.parseInt(request.getParameter("id"));
        String name2=request.getParameter("name");
        String email_id= request.getParameter("email");
        String gender=null;
        if(request.getParameter("gender")!=null)
        {
            gender=(request.getParameter("gender"));
        }
        String address= request.getParameter("address");

        String date=request.getParameter("birthday");
        String password= request.getParameter("password");
        approval= Boolean.valueOf(request.getParameter("approvaltxt"));



//        if(request.getParameter("approvaldropdown")!=null)
//        {
//            approval= Boolean.valueOf((request.getParameter("approvaldropdown")));
//        }
        /*String s[] = request.getParameterValues("approvaldropdown");
        if (s != null && s.length != 0) {
            out.println("You have selected the option is: ");
            for (int i = 0; i < s.length; i++) {
                approval = Boolean.valueOf(s[i]);
                out.println(s[i] + "\n" + "Thank you");
            }
        }*/


        PreparedStatement pst;
        ResultSet rs;
        con = DatabaseConnection.initializeDatabase();
        pst = con.prepareStatement("update lms_student set name = ?,email =?,gender= ? ,birthdate=?,address=?,approved=? where student_id = ?");


        // pst.setInt(0, student_id);

        pst.setString(1, name2);
        pst.setString(2, email_id);

        // pst.setString(3, password);

        pst.setString(3, gender);
        pst.setString(4, date);
        pst.setString(5, address);
        pst.setBoolean(6,approval);

        pst.setInt(7,student_id);
        pst.executeUpdate();

%>

<script>
    alert("Record Updated");
</script>
<%
    }

%>
<html>
<head>
    <title>Students List</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <title>Admin panel</title>
</head>
<body>

<%@ include file="styling/header.jsp" %>
<center>
    <h1>Student Management Section</h1></center>
</br>
<div class="row">

    <div class="col-md-2"></div>
    <div class="col-sm-8">
        <div class="panel-body">

            <%

                while(rs1.next())
                {

            %>
            <form  method="POST" action="#" >
                <div alight="left">
                    <label class="form-label">Student Name</label>
                    <input type="text" class="form-control" placeholder="Student Name" value="<%= rs1.getString("name")%>" name="name" id="name" required >
                </div>

                <div alight="left">
                    <label class="form-label">Email</label>
                    <input type="text" class="form-control" placeholder="Email" name="email" value="<%= rs1.getString("email")%>" id="email" required >
                </div>

                <div align="left">
                    <select name = "gender">
                        <option value = "<%= rs1.getString("gender")%>" selected><%= rs1.getString("gender")%></option>
                        <option value = "Female">Female</option>
                        <option value = "Male">Male</option>
                    </select>
                </div>
<%--                <div align="left">--%>
<%--                    <label class="form-label">Gender</label>--%>
<%--                    <input name="gender" disabled="" id="address" placeholder="Address" value="<%= rs.getString("gender")%>">--%>
<%--                </div>--%>

                <div align="left">
                    <label class="form-label">Address</label>
                    <input name="address" id="address" type="text" placeholder="Address" value="<%= rs1.getString("address")%>">
                </div>
                <div class="left">
                    <label for="birthday">Birthday:</label>
                    <input type="text"  id="birthday" name="birthday" value="<%= rs1.getString("birthdate")%>">
                </div>
                <input type="hidden" value="<%= rs1.getString("approved")%>" name="approvaltxt">


                <% }  %>



                </br>

                <div alight="right">
                    <input type="submit" id="submit" value="Submit" name="submit" class="btn btn-info">
                    <input type="reset" id="reset" value="Reset" name="reset" class="btn btn-warning">
                </div>

                <div align="right">

                    <p><a href="UserView.jsp">Click Back</a></p>


                </div>

            </form>
        </div>
    </div>
</body>
</html>