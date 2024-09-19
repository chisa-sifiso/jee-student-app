/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.bl.StudentFacadeLocal;
import za.ac.tut.models.Student;

/**
 *
 * @author Sifiso
 */
public class SearchStuServlet extends HttpServlet {
    @EJB StudentFacadeLocal sfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String location="not_found_search_student_outcome.jsp";
        
        Student stu = sfl.find(id);
        if(stu!=null){
           location="search_student_outcome.jsp";
           request.setAttribute("stu", stu);
           request.getRequestDispatcher(location).forward(request, response);
        }else{
          request.getRequestDispatcher(location).forward(request, response);  
        }
       
        
    }


}
