/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package info.mining;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Praveen
 */
public class DeleteProductServlet extends HttpServlet {

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
            
            String delete_id= request.getParameter("deleteid");
            DbConnection db=new DbConnection();
            Connection con=db.getConnections();
            
            String query=" select pid from product where pid=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, delete_id);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()){
                String query1="DELETE FROM product WHERE pid=?";
                PreparedStatement pstmt1=con.prepareStatement(query1);
                pstmt1.setString(1, delete_id);
                int i=pstmt1.executeUpdate();
                if(i==1){
                    rd=request.getRequestDispatcher("SuccessDeleteProducts.jsp");
                    rd.forward(request, response);
                }
                else{
                  rd=request.getRequestDispatcher("FailureDeleteProducts.jsp");
                    rd.forward(request, response);
                }
            }else{
                 rd=request.getRequestDispatcher("FailureDeleteProducts.jsp");
             rd.forward(request, response);
            }
            
            
        }catch(Exception e){
             rd=request.getRequestDispatcher("FailureDeleteProducts.jsp");
             rd.forward(request, response);
        }
        finally {            
           
        }
    }
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    