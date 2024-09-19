<%-- 
    Document   : number_of_students_outcome
    Created on : 10 Jun 2024, 18:37:40
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
        int cnt = (Integer)request.getAttribute("cnt");
        %>
    <body style="background-color: #ffff99">
    <center>
        <p>
            There are <b><%=cnt%></b> students.
        </p>
         <p>Click <a href="menu.html">here</a> to go back to Menu Page</p>
         <p>Click <a href="LogoutServlet.do">here</a> LogOut</p>
        
        
    </center>
    </body>
</html>
