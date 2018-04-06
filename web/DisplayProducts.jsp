<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.*" %>
<%@page import="info.mining.*" %>


<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Sentimental Analasys</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="default.css" rel="stylesheet" type="text/css" />
        <style>
            pp{
                color: #32CD32; 
                font-size: 30px;
                font-family: cursive;
            }

            pq{
                color: blue; 
                font-size: 30px;
            }
        </style>


    </head>
    <body>
        <div id="header">
            <div id="logo">
                <h1>ANALYSING  THE SENTIMENTS AND OPINIONS </h1>
                <h2></h2>
            </div>
            <div id="menu">
                <ul>
                    <li class="active"><a href="index.jsp" accesskey="1" title="">Home</a></li>
                        <%
                            String uname = (String) session.getAttribute("uname");
                            if (uname != null) {
                        %>

                    <%
                        if (uname.equals("Admin")) {
                    %>
                    <li><a href="SuccessAdminLogin.jsp" accesskey="3" title="">Admin</a></li>

                    <%}%>
                    <li><a href="logout" accesskey="3" title="">Logout</a></li>
                        <%}%>

                    <%
                        String uname1 = (String) session.getAttribute("uname");
                        if (uname1 == null) {
                    %>
                    <li><a href="userlogin.jsp" accesskey="4" title="">Login</a></li>
                        <%}%>


                </ul>
            </div>
        </div>

        <center>
            <div class="mainDiv">
                <br><br/>
                <pq>welcome</pq>&nbsp;&nbsp;<pp>${uname }</pp><br/>
                <pp>Our products</pp>
                    <%

                        ArrayList list = (ArrayList) request.getAttribute("list");
                        Iterator i = list.iterator();

                    %>
                <table cellspacing="15">
                    <%
                        int j = 0;
                        while (i.hasNext()) {
                            if (j % 4 == 0 || j == 0) {
                                System.out.println(j);
                    %>
                    <tr>
                        <%                            }
                            Product p = (Product) i.next();
                            String image = p.getImage();
                            System.out.println("image:" + image);
                            String q = image.substring(39);
                            System.out.println(q);
                            String img = "http://localhost:8084/SentimentalAnalasys/images/" + q;
                            System.out.println("path::::" + img);
                            pageContext.setAttribute("img1", img);


                        %> 
                    <br/>

                    <td align="center">

                        <img src="${img1}" height="350" width="200"/><br/>
                        <form action="id">
                            <input type="submit" name="submit" value='<%=p.getPid()%>'/>
                        </form>
                    <pq><%=p.getPname()%></pq><br/>
                    Actual Cost:<%=p.getAcost()%><br/>
                    Discount Cost:<%=p.getDcost()%><br/>
                    </td>

                    <%

                            j++;
                        }
                    %>  



            </div>
        </table>
    </div>
</center>

<div id="footer">
    <p></p>
</div>
</body>
</html>
