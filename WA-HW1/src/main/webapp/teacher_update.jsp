<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="MVC.Controller.DatabaseConnection" %><%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 5/4/2022
  Time: 5:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getParameter("submit")!=null)
    {
        int teacher_id = Integer.parseInt(request.getParameter("id"));
        String name2=request.getParameter("name");
        String email_id= request.getParameter("email");
        String gender=null;
        if(request.getParameter("genderdropdown")!=null)
        {
            gender=(request.getParameter("genderdropdown"));
        }
        String address= request.getParameter("address");

        //String date=request.getParameter("birthday");
        String password= request.getParameter("password");



        PreparedStatement pst;
        ResultSet rs;
        Connection con = DatabaseConnection.initializeDatabase();
        pst = con.prepareStatement("update lms_teacher set name = ?,email =?,gender= ? ,address=? where teacher_id = ?");


        // pst.setInt(0, student_id);

        pst.setString(1, name2);
        pst.setString(2, email_id);

        // pst.setString(3, password);

        pst.setString(3, gender);
        pst.setString(4, address);
       pst.setInt(5,teacher_id);
        pst.executeUpdate();

%>

<script>
    alert("Record Updateddddd");
</script>
<%
    }

%>

<html>
<head>
    <title>Update Teacher</title>
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
<center><h1>Teacher Update</h1></center>
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-sm-4">
        <form  method="POST" action="#" >

            <%
                PreparedStatement pst;
                ResultSet rs;

                Connection con = DatabaseConnection.initializeDatabase();
                int id = Integer.parseInt(request.getParameter("id"));

                pst = con.prepareStatement("select * from lms_teacher where teacher_id = ?");
                pst.setInt(1, id);
                rs = pst.executeQuery();

                while(rs.next())
                {

            %>
            <div alight="left">
                <label class="form-label">Teacher Name</label>
                <input type="text" class="form-control" placeholder="Teacher Name" value="<%= rs.getString("name")%>" name="name" id="name" required >
            </div>

            <div alight="left">
                <label class="form-label">Email</label>
                <input type="text" class="form-control" placeholder="Email" name="email" value="<%= rs.getString("email")%>" id="email" required >
            </div>
            <div align="left">
                <select name = "genderdropdown">
                    <option value = "<%= rs.getString("gender")%>" selected><%= rs.getString("gender")%></option>
                    <option value = "Female">Female</option>
                    <option value = "Male">Male</option>
                </select>
            </div>

            <div align="left">
                <input name="address" id="address" placeholder="Address" value="<%= rs.getString("address")%>">
            </div>


            <% }  %>



            </br>

            <div alight="right">
                <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">

            </div>

            <div align="right">

                <a href="./TeacherList.jsp"><input type="button" class="btn btn-danger"  value="Back"></a>


            </div>

        </form>
    </div>
</div>

</body>
</html>
