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
	color: red; 
	font-size: 30px;
	font-family: cursive;
 }
 
 
 pq{
	color: black; 
	font-size: 26px;
        font-weight: bold;
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
  <br><br><br><br><br><br><br><br><br>
 <pq> welcome to </pq><pp> ${uname} (admin)</pp><br/><br/><br/><br/>
 <img src="images/admin.jpg"><br/>
 <img src="images/upload.jpg">
  <img src="images/delete.png">
  <img src="images/update.jpg"><br/>

 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="ProductRegistration.jsp"><pq><b>Upload</b></pq></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
 <a href="DeleteProduct.jsp"><pq><b>Delete the product</b></pq></a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  <a href="UpdateProducts.jsp"><pq><b>Update the product</b></pq></a><br/>
  
 
 
  
 
  </div>
	
	
</center>

<hr />
<div id="footer">
	<p></p>
</div>
</body>
</html>
  