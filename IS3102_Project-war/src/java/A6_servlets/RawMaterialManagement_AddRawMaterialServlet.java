package A6_servlets;

import CorporateManagement.ItemManagement.ItemManagementBeanLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RawMaterialManagement_AddRawMaterialServlet extends HttpServlet {

    @EJB
    private ItemManagementBeanLocal itemManagementBean;
    String result;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String SKU = request.getParameter("SKU");
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String description = request.getParameter("description");
            Integer _length = Integer.parseInt(request.getParameter("length"));
            Integer width = Integer.parseInt(request.getParameter("width"));
            Integer height = Integer.parseInt(request.getParameter("height"));
            String source = request.getParameter("source");
            System.out.println("source is " + source);
            //validate server side
            
            if (name.isEmpty()){
                result = "?errMsg=Name cannot be empty";
                response.sendRedirect(source + result); 
            }
            if (description.isEmpty()){
                result = "?errMsg=Description cannot be empty";
                response.sendRedirect(source + result); 
            }
            if (category.isEmpty()){
                result = "?errMsg=Category cannot be empty";
                response.sendRedirect(source + result); 
            }    
            if (!(SKU.substring(0,2)).equals("RM") ){
                result = "?errMsg=Invalid SKU Code - must have RM prefix";
                response.sendRedirect(source + result);
            }    
                
            if (SKU.substring(2).contains("[1-9]")==false ||SKU.substring(2).length()>3 ){
                result = "?errMsg=SKU Code must be 3 digits after the RM prefix";
                response.sendRedirect(source + result);
            }
            
            if (_length < 1){
                result = "?errMsg=Length must be greater than 1";
                response.sendRedirect(source + result); 
            }
            if (width < 1){
                result = "?errMsg=Width must be greater than 1";
                response.sendRedirect(source + result); 
            }
            if (height < 1){
                result = "?errMsg=Height must be greater than 1";
                response.sendRedirect(source + result); 
            }
            if (!itemManagementBean.checkSKUExists(SKU)) {
                itemManagementBean.addRawMaterial(SKU, name, category, description, _length, width, height);
                result = "?goodMsg=Raw Material with SKU: " + SKU + " has been created successfully.";
                response.sendRedirect("RawMaterialManagement_RawMaterialServlet" + result);
            } else {
                result = "?errMsg=Failed to add raw material, SKU: " + SKU + " already exist.";
                response.sendRedirect(source + result);
            }
        } catch (Exception ex) {
            out.println(ex);
        } finally {
            out.close();
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
