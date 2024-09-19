<%-- 
    Document   : remove_student_outcome
    Created on : 10 Jun 2024, 18:25:03
    Author     : Sifiso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
         Long id =(Long)request.getAttribute("id");
        %>
    <body style="background-color: #ffff99">
    <center>
        <p>
            Student with ID:<b><%=id%></b> has been deleted in database.
        </p>
        <p>Click <a href="menu.html">here</a> to go back to Menu Page</p>
        <p>Click <a href="LogoutServlet.do">here</a> LogOut</p>
    </center>
    </body>
</html>
