package info.mining;

import java.io.IOException;
import java.lang.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Praveen
 */

@WebServlet(urlPatterns = {"/UpdateProduct"})
public class UpdateProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd=null;
        
        try {
            
            String update_id= request.getParameter("updateid");
            String update_acost= request.getParameter("nacost");
            String update_dcost= request.getParameter("ndcost");
            
            DbConnection db=new DbConnection();
            Connection con=db.getConnections();
            
            String query="UPDATE product SET acost=? ,dcost=? WHERE pid=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,update_acost);
            pstmt.setString(2,update_dcost);
            pstmt.setString(3,update_id);
            int i=pstmt.executeUpdate();
            
                
              
                    rd=request.getRequestDispatcher("SuccessUpdateProduct.jsp");
                    rd.forward(request, response);
                }
              
        

            
            
        catch(Exception e){
                    try {
                        rd=request.getRequestDispatcher("FailureUpdateProduct.jsp");
                                    rd.forward(request,response);
                    } catch (ServletException ex) {
                        Logger.getLogger(ProductRegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (IOException ex) {
                        Logger.getLogger(ProductRegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
			
		}
    }
}
    
