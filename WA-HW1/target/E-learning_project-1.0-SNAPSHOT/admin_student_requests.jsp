<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@ page import="MVC.Controller.DatabaseConnection" %>

<html>
    <head>
        <meta charset="utf-8">
         <title>E-Learning</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="styling/main.css" rel="stylesheet">
    </head>

<body>
    <%@ include file="styling/header.jsp" %>
<center>
    <h1>Student Requests</h1>
    </center>
    <br>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                    <form class="form-default" action="admin_student_requests_action.jsp" method="POST">
                        <thead>
                            <tr>

                                <th>Name</th>
                                <th>Email</th>
                                <th>Gender</th>                                
                                <th>DOB</th>
                                <th>Address</th>
                                <th>Actions</th>
                                
                            </tr>
                        </thead>

                       <%
                        try
                        {
                        Connection con = DatabaseConnection.initializeDatabase();
                        // create a SQL statement
                        Statement stmt = con.createStatement();
                        String sql = "select student_id,name, email, gender, birthdate,address from lms_student where approved = false";

                        // execute the statement
                        ResultSet rs = stmt.executeQuery (sql);

                        // for no requests pending 
                        if (rs == null)
                            {
                        %>
                        <tbody>
                            <tr>
                                <<td>

                                <%
                                    out.println("No Pending request");
                                %>
                                </td>
                            </tr>
                            <%
                                }

                                while(rs.next())
                                {
                            %>
                            <tr>

                                
                                <td>
                                    <%= rs.getString(2) %>
                                </td>
                                
                                <td>
                                    <%= rs.getString(3) %>
                                </td>
                                
                                <td>
                                    <%= rs.getString(4) %>
                                </td>
                                
                                <td>
                                    <%= rs.getString(5) %>
                                </td>
                                
                                <td>
                                    <%= rs.getString(6) %>
                                </td>

                                <td><input type="checkbox" name="ad" value="<%= rs.getInt(1)%>"></td>
                            </tr>

                                 <%
                                    }
                                    // close the connection
                                    stmt.close();
                                    con.close();
                                    }
                                    catch (Exception e)
                                    {
                                            out.println(e);
                                    }
                                 %>
                        </tbody>
                </table>
                        <div class="form-input pt-30 request">
                            <button class="btn btn-success" type="submit" name="accept" value="Accept Requests"><span class="glyphicon glyphicon-plus-sign"></span> Accept Request</button>
                            
                        </div>
                        <div class="form-input pt-30 request">
                            <button class="btn btn-danger" type="submit" name="reject" value="Delete Requests"><span class="glyphicon glyphicon-trash"></span> Delete Requests</button>
                            
                        </div>
                    </form>
                    
            </div>
        </div>
    </div>

</body>
<%@ include file="styling/footer.jsp" %>
</html>