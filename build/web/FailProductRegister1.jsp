<%-- 
    Document   : FailProductRegister1
    Created on : 5 Apr, 2015, 7:08:42 PM
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

        <style>
            pp{
                color: #32CD32; 
                font-size: 22px;
                font-family: cursive;
            }


            pq{
                color: blue; 
                font-size: 16px;
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
                    <li class="active"><a href="SuccessAdminLogin.jsp" accesskey="1" title="">Home</a></li>
                    <li><a href="SelectType.jsp" accesskey="3" title="">Products</a></li>
                    <li><a href="logout" accesskey="3" title="">Logout</a></li>
                </ul>
            </div>
        </div>

        <hr />

        <!-- end page -->
        <hr />
        <center>
            <div class="mainDiv">
                <br><br><br><br><br><br>
                <pq> Dear Admin you failed to store the Product in DB</pq><br/><br/>
                <pp> Please try to Store again </pp><br/>
                
                <h4>We will allow only JPG or JPEG or PNG images</h4>
                <br/><br/>
                <a href="ProductRegistration.jsp"> Register Product again</a>

            </div>


        </center>

        <hr />
        <div id="footer">
            <p></p>
        </div>
    </body>
</html>
