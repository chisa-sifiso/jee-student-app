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
public class Summaryservlet extends HttpServlet {
@EJB StudentFacadeLocal sfl;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     int numMales = sfl.numOfMales();
     int numFemales = sfl.numOfFemales();
     double avgMales = sfl.avgNumMales();
     double avgFemales =sfl.avgNumFemales();
     Student stu = sfl.youngestStu();
     
     request.setAttribute("numMales", numMales);
     request.setAttribute("numFemales", numFemales );
     request.setAttribute("avgMales", avgMales);
     request.setAttribute("avgFemales", avgFemales);
     request.setAttribute("stu", stu);
        request.getRequestDispatcher("summary_outcome.jsp").forward(request, response);
    }



}
