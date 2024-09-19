/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package za.ac.tut.web;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.validation.constraints.Max;
import za.ac.tut.bl.StudentFacadeLocal;
import za.ac.tut.models.Student;

/**
 *
 * @author Sifiso
 */
@MultipartConfig
public class AddStudentServlet extends HttpServlet {
    @EJB StudentFacadeLocal sfl;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         Part part = request.getPart("photo");
         String name= request.getParameter("name");
         String surname = request.getParameter("surname");
         Integer age = Integer.parseInt(request.getParameter("age"));
         String gender = request.getParameter("gender");
         Long id = Long.parseLong(request.getParameter("id"));
         String[] subjectsArray= request.getParameterValues("Subjects");
         String userdate = request.getParameter("date");
         
         byte[] image_byte=null;
         if(part.getSize()>0 && part != null){
             InputStream input = part.getInputStream();
             image_byte = new byte[(int)part.getSize()];
             input.read(image_byte);
         }
         
        List<String> subjectList = new ArrayList<>();
        for (int i = 0; i < subjectsArray.length; i++) {
            subjectList.add(subjectsArray[i]);
        }
        SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
        Date formatedDate=null;
        
        try {
            formatedDate =date.parse(userdate);
        } catch (ParseException ex) {
            Logger.getLogger(AddStudentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        Student stu = new Student();
        stu.setPhoto(image_byte);stu.setName(name);stu.setAge(age);stu.setSurname(surname);stu.setDate(formatedDate);
        stu.setGender(gender);stu.setId(id);stu.setSubjects(subjectList);
        
        sfl.create(stu);
        
        request.setAttribute("stu", stu);
       
        request.getRequestDispatcher("add_student_outcome.jsp").forward(request, response);
        
        
        
        
         
         
    }



}
