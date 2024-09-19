<%-- 
    Document   : add_student_outcome
    Created on : 10 Jun 2024, 16:53:26
    Author     : Sifiso
--%>

<%@page import="za.ac.tut.models.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
         Student stu =(Student)request.getAttribute("stu");
         String name =  stu.getName();
         String surname = stu.getSurname();
        %>
    <body style="background-color: #ffff99">
    <center >
        <p>
            <b><%=name%> <%=surname%></b> has been added to the database; 
        </p>
        <p>Click <a href="menu.html">here</a> to go back to Menu Page</p>
        <p>Click <a href="LogoutServlet.do">here</a> LogOut</p>
    </center>    
    </body>
</html>
