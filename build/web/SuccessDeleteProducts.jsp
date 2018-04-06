<%-- 
    Document   : SuccessDeleteProducts
    Created on : Mar 7, 2014, 11:23:33 PM
    Author     : Praveen
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
		<h1>ANALYSING  THE SENTIMENTS AND OPINIONS </h1>
		<h2></h2>
	</div>
	<div id="menu">
		<ul>
			<li class="active"><a href="SuccessAdminLogin.jsp" accesskey="1" title="">Home</a></li>
			<li><a href="SelectType.jsp" accesskey="3" title="">Products</a></li>
			<%
				String uname=(String)session.getAttribute("uname");
				if(uname!=null){
				%>
				<li><a href="logout" accesskey="3" title="">Logout</a></li>
				<%} %>
				
				<%
			 String	uname1=(String)session.getAttribute("uname");
				if(uname==null){
				%>
				<li><a href="userlogin.jsp" accesskey="4" title="">Login</a></li>
				<%} %>
		</ul>
	</div>
</div>

<hr />

<!-- end page -->
<hr />
<center>
<div class="mainDiv">
<br><br><br><br><br><br><br><br><br>
<center>
    <h2>Product Removed from our Storage.</h2>
    <h3>Thank you</h3><br>
   If you want to register a new product<a href="ProductRegistration.jsp">Click here</a><br><br>
   If you want to delete a product<a href="DeleteProduct.jsp">Click here</a><br><br>
   If you want to update product details<a href="UpdateProducts.jsp">Click here</a><br><br>
    
</center>
</div>
	
	
</center>

<hr />
<div id="footer">
	<p></p>
</div>
</body>
</html>

