package info.mining;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginCheckServlet
 */
@SuppressWarnings("serial")
public class LoginCheckServlet extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
	
		
		PreparedStatement pstmt=null;
		RequestDispatcher rd=null;
		ResultSet rs=null;
		
		
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		
		System.out.println(uname);
		System.out.println(pwd);
		
		DbConnection db=new DbConnection();
		Connection con=db.getConnections();
		
		String query="select rollid,name,uid from user_details where mail=? and password=?";
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, uname);
			pstmt.setString(2, pwd);
			rs=pstmt.executeQuery();
			
			
			if(rs.next()){
				System.out.println("*********while block");
				int rollid=rs.getInt(1);
				String name=rs.getString(2);
				int uid=rs.getInt(3);
				System.out.println("set--"+uid);
				
				if(rollid==1){
					HttpSession session=request.getSession(true);
					session.setAttribute("uname",name);
					session.setAttribute("uid",uid);
					
					rd=request.getRequestDispatcher("SuccessAdminLogin.jsp");
					rd.forward(request, response);
				}
				
				if(rollid==2){	
					HttpSession session=request.getSession(true);
					session.setAttribute("uname",name);
					session.setAttribute("uid",uid);
					
					rd=request.getRequestDispatcher("SelectType.jsp");
					rd.forward(request, response);
				}
				
			}	
			else{
				rd=request.getRequestDispatcher("FailLogin.jsp");
				rd.forward(request, response);
			}
			
			
			}
			
			
		catch(Exception e) {
			
			e.printStackTrace();
			
			
		}
		
		finally{
			
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}


}