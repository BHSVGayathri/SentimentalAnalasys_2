<%-- 
    Document   : DeleteProduct
    Created on : Mar 7, 2014, 10:53:54 PM
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
<br><br><br><br><br><br><br>
<h3>Delete the product here</h3><br>
<form action="DeleteProductServlet">
    <table>
        <tr>
            <td>Product Id:</td>
            <td><input type="text" name="deleteid"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Delete" style="padding: 5px">
            </td>
        </tr>
    </table>
</form> 
</div>
	
	
</center>

<hr />
<div id="footer">
	<p></p>
</div>
</body>
</html>
