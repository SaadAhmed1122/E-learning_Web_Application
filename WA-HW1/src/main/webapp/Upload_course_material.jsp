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
</head>
<body>
<%
    if(session.getAttribute("login_teacher_email")==null || session.getAttribute("login_teacher_email")=="")
    {
        response.sendRedirect("index.jsp");
    }

%>

<h1>Uplaod Material</h1>
<br>

<%
    String teacher_email = (String) session.getAttribute("login_teacher_email");
    int course_id = Integer.parseInt(request.getParameter("course_id"));
%>
<div class="col-md-12 col-lg-12">
    <form method="post" action="./Upload_material_Servlet" onsubmit="return validate();">

<%--        <h1><%=course_id%></h1>--%>
        <div class="form-group">
            <label for="topic">Topic</label>
            <input class="form-group" type="text" name="topic" id="topic" title="Topic" required>
        </div>

        <div class=" form-group">
            <label for="Description">Description</label>
            <input class="form-group" name="Description" id="Description" placeholder="Description"  required>
        </div>

        <div class=" form-group">
            <label for="link">Link</label>
            <input class="form-group" id="link" name="link" placeholder="Link" required>
        </div>
    <input type="hidden" name="course_id" value="<%=course_id%>"/>
    <input type="hidden" name="teacher_email" value="<%=teacher_email%>"/>
        <br>
        <a href="teacher_main.jsp"> <input class="btn btn-primary" type="submit" name="upload_material" value="Upload"></a>
        <h3><a href="teacher_main.jsp">Cancel</a></h3>

    </form>
</div>
</body>
</html>
