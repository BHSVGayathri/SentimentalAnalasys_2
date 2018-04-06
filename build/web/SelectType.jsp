<%-- 
    Document   : SelectType
    Created on : 5 Apr, 2015, 8:10:38 PM
    Author     : b.gayathri
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Sentimental Analasys</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="default.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="header">
            <div id="logo">
                <h1>ANALYSING THE SENTIMENTS AND OPINIONS </h1>
                <h2></h2>
            </div>
            <div id="menu">
                <ul>
                     <%
                            String uname6 = (String) session.getAttribute("uname");
                            if (uname6 != null) {
                        %>

                    <%
                        if (uname6.equals("Admin")) {
                    %>
                    <li class="active"><a href="SuccessAdminLogin.jsp" accesskey="1" title="">Admin</a></li>
                    <%}%>
                    <%}%>
                    
                    <li><a href="index.jsp" accesskey="3" title="">Home</a></li>
                        <%
                            String uname = (String) session.getAttribute("uname");
                            if (uname != null) {
                        %>
                    <li><a href="logout" accesskey="3" title="">Logout</a></li>
                        <%}%>

                    <%
                        String uname1 = (String) session.getAttribute("uname");
                        if (uname == null) {
                    %>
                    <li><a href="userlogin.jsp" accesskey="4" title="">Login</a></li>
                        <%}%>
                </ul>
            </div>
        </div>

        <hr />

        <!-- end page -->
        <hr />
        
            <div class="mainDiv">
                <br>
                <br>
                <center>
                <img src="images/wel1.jpg">
                   
                <br><br><br><br><br><br>
                <h1>&nbsp&nbsp;<img src="images/select.jpg">&nbsp&nbsp;Select Product Type</h1><br>
                <centre><table cellpadding="8">
                    <form action="rpds">

                        <tr>
                            <td align="centre"><h2>Category :</h2></td>
                            <td> <select name="type" style="width:150px" >
                                    <option>mobiles</option>
                                    <option>laptops</option>
                                    <option>watches</option>

                                </select>
                            </td>
                        </center>
                        </tr>

                        <tr>
                            <td align="center" colspan="2">
                                <input type="submit" value="Search">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="clear">
                            </td>
                        </tr>
                    </form>
                </table>
                
            </div>

    </centre>
        

        <hr />
        <div id="footer">
            <p></p>
        </div>
    </body>
</html>
