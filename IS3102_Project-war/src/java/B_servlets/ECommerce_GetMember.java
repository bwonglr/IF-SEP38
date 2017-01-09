/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package B_servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alienware pc
 */
@WebServlet(name = "ECommerce_GetMember", urlPatterns = {"/ECommerce_GetMember"})
public class ECommerce_GetMember extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //Get email attribute from ECommerce_MemberLoginServlet
            String email = (String)request.getAttribute("memberEmail");
            
            Class.forName("com.mysql.jdbc.Driver");
        
            String connURL = "jdbc:mysql://localhost/jspg?user=root&password=12345";
        
            Connection conn = DriverManager.getConnection(connURL);
        
            Statement stmt = conn.createStatement();
            //use email attribute to find specific data
            String sqlStr = "SELECT*FROM 'islandfurniture-it07' where email is "+email+"";
            ResultSet rs = stmt.executeQuery(sqlStr);
            //store data
            String MemberName = rs.getString("name");
            String MemberEmail = rs.getString("email");
            String MemberPhone = rs.getString("phone");
            String MemberSecurityQuestion = rs.getString("securityquestion");
            String MemberSecurityAnswer = rs.getString("securityanswer");
            String MemberAddress = rs.getString("address");
            String MemberAge = rs.getString("age");
            String MemberIncome = rs.getString("income");
            //set data to be transferred to JSP
            request.setAttribute("name", MemberName);
            request.setAttribute("email", MemberEmail);
            request.setAttribute("phone", MemberPhone);
            request.setAttribute("securityquestion",MemberSecurityQuestion);
            request.setAttribute("securityanswer",MemberSecurityAnswer);
            request.setAttribute("address", MemberAddress);
            request.setAttribute("age", MemberAge);
            request.setAttribute("income", MemberIncome);
            //send data to the JSP
            request.getRequestDispatcher("/memberProfile.jsp").forward(request, response);
            
            response.sendRedirect("ECommerce_MemberEditProfileServlet");
        } catch(Exception e){
            System.out.println("Error "+e);
        } 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
