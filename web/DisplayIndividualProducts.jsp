<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*"%>
<%@page import="info.mining.*"%>


<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Sentimental Analasys</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="default.css" rel="stylesheet" type="text/css" />
        <style>
            pp {
                color: #32CD32;
                font-size: 25px;
                font-family: cursive;
            }

            px {
                color: #32CD32;
                font-size: 25px;
                font-family: serif;
            }

            pq {
                color: blue;
                font-size: 16px;
            }

            g{
                color:#ffd700;
                font-size: 38px;
            }

        </style>


    </head>
    <body>
        <div id="header">
            <div id="logo">
                <h1>ANALYSING THE SENTIMENTS AND OPINIONS </h1>
                <h2></h2>
            </div>
            <div id="menu">
                <ul>
                    <li class="active"><a href="index.jsp" accesskey="1" title="">Home</a></li>
                    <li><a href="SelectType.jsp" accesskey="3" title="">Products</a></li>
                        <%
                            String uname = (String) session.getAttribute("uname");
                            if (uname != null) {
                        %>
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


        <div class="mainDiv">
            <br>
            <br />
            <center>
                <pq>welcome</pq>
                &nbsp;
                <pp>${uname }</pp>
            </center>
            <br />
            <%
                Map map = (Map) request.getAttribute("sentiMap");
                Integer positiveCount = (Integer) map.get("positiveCount");
                Integer negativeCount = (Integer) map.get("negativeCount");
                Integer neutraleCount = (Integer) map.get("neutraleCount");
                Integer star = (Integer) map.get("starCount");


                pageContext.setAttribute("positiveCount", positiveCount);
                pageContext.setAttribute("negativeCount", negativeCount);
                pageContext.setAttribute("neutraleCount", neutraleCount);
                pageContext.setAttribute("star", star);

                ArrayList list = (ArrayList) request.getAttribute("list");
                Iterator i = list.iterator();
            %>
            <table cellspacing="10">
                <tr>
                    <%
                        while (i.hasNext()) {
                            Product p = (Product) i.next();
                            String image = p.getImage();

                            String q = image.substring(38);


                            String img = "http://localhost:8084/SentimentalAnalasys/images/" + q;
                            // out.println(img);

                            pageContext.setAttribute("img1", img);
                    %>
                <br />
                <br />

                <td align="center"><img src="${img1}" height="400" width="250" /><br /></td>
                <td><br />Product id:: <%=p.getPid()%><br> Actual Cost:<%=p.getAcost()%><br />
                    Discount Cost::<%=p.getDcost()%><br />
                <br /><px> Description::</px><%=p.getDescription()%><br /><br /><br />



                <%
                    if (star == 0) {
                %>
                <g>&#x2606;&#x2606;&#x2606;&#x2606;&#x2606;</g> <br/>
                    <%                                            }
                    %>

                <%
                    if (star == 1) {
                %>
                <g>&#x2605;&#x2606;&#x2606;&#x2606;&#x2606;</g> <br/>
                    <%                                            }
                    %>

                <%
                    if (star == 2) {
                %>
                <g>&#x2605;&#x2605;&#x2606;&#x2606;&#x2606;</g> <br/>
                    <%                                            }
                    %>

                <%
                    if (star == 3) {
                %>
                <g>&#x2605;&#x2605;&#x2605;&#x2606;&#x2606;</g> <br/>
                    <%                                            }
                    %>

                <%
                    if (star == 4) {
                %>
                <g>&#x2605;&#x2605;&#x2605;&#x2605;&#x2606;</g> <br/>
                    <%                                            }
                    %>

                <%
                    if (star == 5) {
                %>
                <g>&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</g> <br/>
                    <%                                            }
                    %>




                <pq>Positive:${positiveCount}&nbsp;&nbsp;&nbsp;Negative:${negativeCount}&nbsp;&nbsp;&nbsp;Neutral:${neutraleCount}<pq>
                        </td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <pp><%=p.getPname()%><pp> 
                                <%
                                    }
                                %>

                                </tr>
                                </table>
                                <div style="position: relative; text-align: left; margin-left: 50px;">
                                    <form action="clcs" method="Post">
                                        <span
                                            style="vertical-align: top; position: relative; top: 30px; margin-right: 5px;">Comments:</span>
                                        <span><textarea name="ucomments" cols="50" rows="4"
                                                        maxlength="512"></textarea></span> <span style="margin-top: 0px;"><input
                                                type="submit" value="submit"
                                                style="padding: 4px; vertical-align: top; margin: 22px 0 0 20px;"></span>
                                    </form>
                                </div>
                                <br />
                                <br />

                                <%
                                    ArrayList list1 = (ArrayList) request.getAttribute("list1");
                                    Iterator it = list1.iterator();
                                %>


                                <h3 style="margin-left : 50px;">Top comments:</h3>
                                <br />

                                <div>

                                    <%
                                        while (it.hasNext()) {
                                            Comments c = (Comments) it.next();
                                    %>




                                    <span style="margin-left : 50px;" ><px><%=c.getUname()%>--</px><%=c.getComments()%><span><br/><br/>


                                            <%
                                                }
                                            %>

                                            </div>



                                            </div>


                                            <div id="footer">
                                                <p></p>
                                            </div>
                                            </body>
                                            </html>
