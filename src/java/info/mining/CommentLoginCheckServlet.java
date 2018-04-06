package info.mining;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommentLoginCheckServlet extends HttpServlet {
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd=null;
		String comments=request.getParameter("ucomments");
		HttpSession session=request.getSession(false);
		session.setAttribute("comments",comments);
		String uname=(String)session.getAttribute("uname");
		System.out.println(uname);
		if(uname==null){
			
			rd=request.getRequestDispatcher("userlogin.jsp");
			rd.forward(request, response);
		}else{
			rd=request.getRequestDispatcher("scs");
			rd.forward(request, response);
		}
	}

}
