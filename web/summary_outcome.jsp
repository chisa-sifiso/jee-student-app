<%-- 
    Document   : summary_outcome
    Created on : 10 Jun 2024, 19:22:18
    Author     : Sifiso
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Base64"%>
<%@page import="za.ac.tut.models.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        int numMales = (Integer)request.getAttribute("numMales");
        int numFemales =(Integer)request.getAttribute("numFemales");
        double avgMales =(Double)request.getAttribute("avgMales");
        double avgFemales =(Double)request.getAttribute("avgFemales");
        
        
        %>
    <body>
    <center>
        <table border="1">
            <tbody>
                <tr>
                    <td>Number of Males</td>
                    <td><%=numMales%></td>
                </tr>
                <tr>
                    <td>Number of Females</td>
                    <td><%=numFemales%></td>
                </tr>
                <tr>
                    <td>Avg number of Males</td>
                    <td><%=avgMales%></td>
                </tr>
                <tr>
                    <td>avg Number Of Females</td>
                    <td><%=avgFemales%></td>
                </tr>
                <tr>
                    <td>Avg number of Males</td>
                    <td><%=avgMales%></td>
                </tr>
 
            </tbody>
            
            
            
        </table>
        <%
        Student stu =(Student) request.getAttribute("stu");
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
    <body style="background-color: #ffff99">
    <center>
        <h1>Youngest Student Information</h1>   
        <table border="1">
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
                        <%for (int i = 0; i < subs.size(); i++) { %>
                        <%=subs.get(i).toUpperCase()%>
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
        </table>        
 <p>Click <a href="menu.html">here</a> to go back to Menu Page</p>
 <p>Click <a href="LogoutServlet.do">here</a> LogOut</p>
        
    </center>
    </body>
</html>
