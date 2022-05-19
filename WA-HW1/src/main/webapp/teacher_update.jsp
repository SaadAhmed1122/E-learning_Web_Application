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


<%
    if(session.getAttribute("login_admin")==null || session.getAttribute("login_admin")=="")
    {
        response.sendRedirect("index.jsp");
    }

%>
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
        pst = con.prepareStatement("update lms_teacer set name = ?,email =?,gender= ? ,address=? where teacher_id = ?");


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
</head>
<body>
<h1>Teacher Update</h1>
<div class="row">
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
                <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
            </div>

            <div align="right">

                <p><a href="TeacherList.jsp">Click Back</a></p>


            </div>

        </form>
    </div>
</div>

</body>
</html>
