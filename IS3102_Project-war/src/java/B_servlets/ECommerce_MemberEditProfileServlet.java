package B_servlets;

/*
 * By goh Shu xian
 */

import CommonInfrastructure.AccountManagement.AccountManagementBeanLocal;
import CommonInfrastructure.SystemSecurity.SystemSecurityBeanLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
/**
 *
 * @author Shu xian
 */
@WebServlet(urlPatterns = {"/ECommerce_MemberEditProfileServlet"})
public class ECommerce_MemberEditProfileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
      @EJB

    private String result;//taken from reset password
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

         try {
            HttpSession session;
            session = request.getSession();
     
            String name = request.getParameter("name");
            String email = request.getParameter("email"); 
            String city = request.getParameter("city");
            String phone = request.getParameter("phone");
            String address=request.getParameter("address");
            Int security=request.getParameter("securityquestion");
            String answer=request.getParameter("securityanswer");
            Int age =request.getParameter("age");
            Int income=request.getParameter("income");
            boolean checkbox=Boolean.parseBoolean("serviceLevelAgreement");
            String password=request.getParameter("password");
                  String repassword=request.getParameter("repassword");
            if ((password != null && repassword != null) &&(password != "" && repassword != "")) {
                    if (password != repassword) {
                        password=repassword; 
                       result = "?goodMsg= Account updated successfully";
                response.sendRedirect("/IS3102_Project-war/B/SG/memberProfile.jsp" + result);
                    }else {
                result = "?errMsg=Reset Password Unsuccessful. Please try again or contact support.";
                response.sendRedirect("/IS3102_Project-war/B/SG/memberProfile.jsp" + result);
            }
         }
        
   //
        int nRecord=0;
        try {
          // Step1: Load JDBC Driver
          Class.forName("com.mysql.jdbc.Driver");

          // Step 2: Define Connection URL
          String connURL ="jdbc:mysql://localhost/islandfurniture-it07?user=root&password=12345"; //** replace the schema 'db1' if required

          // Step 3: Establish connection to URL
          Connection conn = DriverManager.getConnection(connURL); 
          // Step 4: Create Statement object
          //Statement stmt = conn.createStatement();
          // Step 5: Execute SQL Command
          
          String sqlStr = "UPDATE MEMBER"
                  + "SET name=name,email=email,city=,phone=phone,address=address,security=security,securityanswer=answer"
                  + "age=age,income=income"; //**==>  UPDATE statement  
          PreparedStatement pstmt  = conn.prepareStatement(sqlStr);
          /* ==>Insert pstmt object initialisation here
          *
          *
          */      
         
          nRecord = pstmt.executeUpdate();

          // Step 6: Process Result
          //nothing to process
        
          // Step 7: Close connection
          conn.close();
     } catch (Exception e) {
        out.println("<h1>Error :" + e+"<h1>");
        //out.print("<h2>We are sorry that the application is not available at the moment. Pleas call our Helpdesk at 68707070</h2>");
        out.print("<h1>Error code: 1234 in page: "+request.getRequestURI()+"</h1>");
     }
        
        //========================================
        if(nRecord>0){
                out.print("Update done! "+nRecord);
                //response.sendRedirect("done.jsp");
        } else {
                out.print("Fail");
                //response.sendRedirect("updateAccount.jsp?status="+nRecord); 
        }
        //
       
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
}
