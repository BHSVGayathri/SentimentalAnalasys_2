package info.mining;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.util.Date;
import java.util.StringTokenizer;
import java.util.Vector;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javazoom.upload.MultipartFormDataRequest;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadParameters;

@SuppressWarnings("serial")
public class ProductRegisterServlet extends HttpServlet {

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @SuppressWarnings({"unused", "rawtypes"})
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {


        Connection con = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        RequestDispatcher rd = null;

	
        Date d = new Date();
        long pid = d.getTime();

        ServletContext application = request.getServletContext();
        String photopath = application.getInitParameter("spath");

        try {

            MultipartFormDataRequest nreq = new MultipartFormDataRequest(request);

            String pname = nreq.getParameter("pname");
            String acost = nreq.getParameter("acost");
            String dcost = nreq.getParameter("dcost");
            String description = nreq.getParameter("description");
            String type = nreq.getParameter("type");
           
            

            UploadBean upb = new UploadBean();
            upb.setFolderstore(photopath);
            upb.setOverwrite(false);
            upb.store(nreq, "img");

            Vector history = upb.getHistory();
            ArrayList<String> filesName = new ArrayList<String>();

            for (int i = 0; i < history.size(); i++) {
                UploadParameters up = (UploadParameters) history.elementAt(i);
                filesName.add(up.getFilename());

                String ext = null;


                String filename = filesName.get(0);
                StringTokenizer st = new StringTokenizer(filename, ".");
                while (st.hasMoreElements()) {
                    st.nextToken();
                    ext = st.nextToken();
                }
                System.out.println("Extention:" + ext);

                if (ext.equals("JPG") || ext.equals("png") || ext.equals("JPEG") || ext.equals("jpg")) {
                    DbConnection db = new DbConnection();
                    con = db.getConnections();
                    String query = "insert into product values(?,?,?,?,?,?,?)";
                    pstmt = con.prepareStatement(query);
                    pstmt.setLong(1, pid);
                    pstmt.setString(2, pname);
                    pstmt.setString(3, acost);
                    pstmt.setString(4, dcost);
                    pstmt.setString(5, description);
                    pstmt.setString(6, photopath + "/" + filesName.get(0));
                     pstmt.setString(7,type);
                    int q = pstmt.executeUpdate();

                    rd = request.getRequestDispatcher("SuccessProductRegister.jsp");
                    rd.forward(request, response);
                } else {
                    rd = request.getRequestDispatcher("FailProductRegister1.jsp");
                    rd.forward(request, response);
                }


            }

        } catch (Exception e) {

            try {
                rd = request.getRequestDispatcher("FailProductRegister.jsp");
                rd.forward(request, response);
            } catch (Exception ex) {
                e.printStackTrace();
            }

        }


    }
}
