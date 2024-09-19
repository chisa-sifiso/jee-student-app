<%-- 
    Document   : view_all_students_outcome
    Created on : 10 Jun 2024, 17:57:37
    Author     : Sifiso
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.models.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
       List<Student> students = (List<Student>) request.getAttribute("students");
        
        %>
    <body style="background-color: #ffff99">
    <center>
        
         <h1>Student Information</h1>   
        <table border="1">
        <%for (int i = 0; i < students.size(); i++) {
        Student stu=students.get(i);
        String name = stu.getName();
        String surname = stu.getSurname();
        String photo = "data:image/png;base64,"+Base64.getEncoder().encodeToString(stu.getPhoto());
        String gender =stu.getGender();
        Date date = stu.getDate();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String newDate = dateFormat.format(date);
        Long id = stu.getId();
        List<String> subs =stu.getSubjects();
        
        %>
           <thead>
                <tr>
                    <td colspan="2"><b>Student <%=i+1%> Information</b></td>
                </tr>
            </thead>
            <thead>
                <tr>
                    <td>Id</td>
                    <td><%=id%></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Name</td>
                    <td><%=name%></td>
                </tr>
                <tr>
                    <td>surname</td>
                    <td><%=surname%></td>
                </tr>
                <tr>
                    <td>gender</td>
                    <td><%=gender%></td>
                </tr>
                <tr>
                    <td>date</td>
                    <td><%=newDate%></td>
                </tr>
                <tr>
                    <td>Subjects enrolled in</td>
                    
                    <td>
                        <%for (int e = 0; e < subs.size(); e++) { %>
                        <%=subs.get(e).toUpperCase()%>
                        <%}%>
                    </td>   
                        
                    
                </tr>
                <tr>
                    <td>Photo</td>
                    <td>
                        <img src="<%=photo%>"/>

                    </td>
                </tr>
            </tbody>
            <%}%>
        </table>
        <p>Click <a href="menu.html">here</a> to go back to Menu Page</p>
        <p>Click <a href="LogoutServlet.do">here</a> LogOut</p>
        
        
    </center>
    </body>
</html>
