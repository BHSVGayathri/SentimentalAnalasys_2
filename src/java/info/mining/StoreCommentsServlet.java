package info.mining;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




public class StoreCommentsServlet extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		
	
	HttpSession session=request.getSession(false);
	Integer uid=(Integer)session.getAttribute("uid");
	String pid=(String)session.getAttribute("pid");
	String uname=(String)session.getAttribute("uname");
	String comments=(String)session.getAttribute("comments");
	
	System.out.println("comments--"+comments);
	
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	RequestDispatcher rd=null;
	if(session!=null){
		DbConnection db=new DbConnection();
		con=db.getConnections();
		String query="insert into comments(pid,uname,uid,comments) values(?,?,?,?)";
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1,pid);
			pstmt.setString(2,uname);
			pstmt.setInt(3,uid);
			pstmt.setString(4,comments);
			pstmt.executeUpdate();
			String id=(String) session.getAttribute("pid");
                        request.setAttribute("submit",id);
			rd=request.getRequestDispatcher("id");
			rd.forward(request,response);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}else{
		
	}
	
	
	
		
	}

}
