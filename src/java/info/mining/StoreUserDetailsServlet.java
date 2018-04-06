package info.mining;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class StoreUserDetailsServlet
 */

@SuppressWarnings("serial")
public class StoreUserDetailsServlet extends HttpServlet {
		/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doPost(HttpServletRequest request, HttpServletResponse response)  {
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	RequestDispatcher rd=null;
	
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String mail=request.getParameter("mail");
	String pwd=request.getParameter("pwd");
	String mob=request.getParameter("mob");
	
	
	
	String name=fname+""+lname;
        
	int rollid=2;
	
	DbConnection db=new DbConnection();
	con=db.getConnections();
	String query1="select mail from user_details where mail=?";
	String query2="insert into user_details(name,rollid,mail,password,mobile) values(?,?,?,?,?)";
	
	try {
		pstmt=con.prepareStatement(query1);
		pstmt.setString(1, mail);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			
			rd=request.getRequestDispatcher("UsedMail.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			
		}
		else{
			pstmt=con.prepareStatement(query2);
			pstmt.setString(1,name);
			pstmt.setInt(2,rollid);
			pstmt.setString(3, mail);
			pstmt.setString(4, pwd);
			pstmt.setString(5, mob);
			
			
			pstmt.executeUpdate();
			
			rd=request.getRequestDispatcher("SuccessRegister.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
		rd=request.getRequestDispatcher("FailRegister.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e1) {
			
			e1.printStackTrace();
		} catch (IOException e1) {
			
			e1.printStackTrace();
		}
		
	}
	
	finally{
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	}

}
