<%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 5/21/2022
  Time: 12:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course Material</title>
    <link rel="icon" type="image/png" href="./assets/images/iict.jpg">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
</head>
<body>
<%
    if(session.getAttribute("login_teacher_email")==null || session.getAttribute("login_teacher_email")=="")
    {
        response.sendRedirect("index.jsp");
    }

%>


<center>
    <h1>Upload Material</h1>
</center>
<br>

<%
    String teacher_email = (String) session.getAttribute("login_teacher_email");
    int course_id = Integer.parseInt(request.getParameter("course_id"));
%><div class="row">
    <div class="col-md-2"></div>
    <div class="col-sm-8">
        <div class="panel-body">
            <form method="post" action="./Upload_material_Servlet" onsubmit="return validate();">
                <table id="tbl-courses" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                <thead>

                <tr>
                    <th><label for="topic">Topic</label>
                    </th><th>
                        <input class="form-group" type="text" name="topic" id="topic" title="Topic" placeholder="Topic" required></th>
                <tr> </tr>       <th> <label for="Description">Description</label></th>
                <th>
                    <textarea class="form-group"  name="Description" id="Description" placeholder="Description"  required></textarea></th>

                <tr>  </tr>
                <th><label for="link">Link</label></th><th>
                        <input class="form-group" id="link" name="link" placeholder="Link" required></th>
                </tr>
                <input type="hidden" name="course_id" value="<%=course_id%>"/>
                <input type="hidden" name="teacher_email" value="<%=teacher_email%>"/>
                <tr>
         <th>       <a class="btn btn-danger" href="Teacher_course_list.jsp?id=<%=course_id%>">Cancel</a>
         </th><th>   <input class="btn btn-primary" type="submit" name="upload_material" value="Upload">
                  </th>  </tr>



                </thead>
            </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>
