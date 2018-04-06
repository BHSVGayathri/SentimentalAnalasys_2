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
  <br><br><br><br><br><br><br>
  <br><br>
  <center>
  <h2> Update Product Details</h2></center>
  <br/>
  <form action="UpdateProduct">
  	<table style="" cellspacing="10px" bgcolor="#A9A9A9">
  		<tr>
  			<td>Product Id:</td>
                       <td><input type="text" name="updateid"></td>
  		</tr>
  		
  			<tr>
  			<td>New Cost :</td>
  			<td><input type="text" name="nacost" required style="padding: 4px">rs</td>
  		</tr>
  		
  		<tr>
  			<td> New Discount Cost :</td>
  			<td><input type="text" name="ndcost" required style="padding: 4px">rs</td>
  		</tr>
  		
  		
  		
  	
  		
  			<tr>
  			<td colspan="2" align="center"><input type="submit" value="Update" style="padding-right: 12px;padding-left: 12px;padding-bottom: 7px;padding-top: 7px">
  			&nbsp;&nbsp;&nbsp;<input type="reset"  value="Clear" style="padding-left: 12px;padding-bottom: 7px;padding-top: 7px"></td>
  		</tr>
  	</table>
  	
  </form>
  <br/>


  </div>
	
	
</center>

<hr />
</body>
</html>
