package info.mining;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.taglib.tiles.GetAttributeTag;

@SuppressWarnings("serial")
public class RetriveProductDetailsServlet extends HttpServlet {

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) {

        Connection con = null;
        ResultSet rs = null;
        PreparedStatement stmt = null;
        RequestDispatcher rd = null;
        String pid = "";
        String pname = "";
        String acost = "";
        String dcost = "";
        String description = "";
        String image = "";
        String type = "";


        HttpSession session = request.getSession(false);

        String uname = (String) session.getAttribute("uname");

        if (uname != null) {
        } else {
        }


        if (session != null) {


            try {
                String type1 = request.getParameter("type");
                String query = "select * from product where type=?";
                DbConnection db = new DbConnection();
                con = db.getConnections();
                stmt = con.prepareStatement(query);
                stmt.setString(1, type1);

                rs = stmt.executeQuery();


                List list = new ArrayList();
                while (rs.next()) {
                    Product p = new Product();
                    p.setPid(rs.getLong(1));
                    p.setPname(rs.getString(2));
                    p.setAcost(rs.getString(3));
                    p.setDcost(rs.getString(4));
                    p.setDescription(rs.getString(5));
                    p.setImage(rs.getString(6));

                    list.add(p);

                }
                request.setAttribute("list", list);
                rd = request.getRequestDispatcher("DisplayProducts.jsp");
                rd.forward(request, response);


            } catch (Exception e) {

                e.printStackTrace();
            }

        } else {
        }


    }
}
