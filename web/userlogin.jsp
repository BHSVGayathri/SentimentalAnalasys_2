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
	font-size: 18px;
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
			<li class="active"><a href="index.jsp" accesskey="1" title="">Home</a></li>
			
		</ul>
	</div>
</div>
<center>
<div class="mainDiv">
<br/><br/>
<h2>Sign Up</h2><br/><br/>
<form action="lcs" method="post">
  	<table style="" cellspacing="10px" bgcolor="#6495ED">
  		<tr>
                    <td align="left"><font size="5">Mail ID :</font></td>
  			<td><input type="text" name="uname" size="25" required style="padding: 4px"></td>
  		</tr>
  		
  			<tr>
  			<td align="left"><font size="5">Password   :</font></td>
  			<td><input type="password" name="pwd" required size="25" style="padding: 4px"></td>
  		</tr>
  			<tr>
  			<td colspan="2" align="center"><input type="submit" value="Login" style="background-color: ;padding-right: 12px;padding-left: 12px;padding-bottom: 7px;padding-top: 7px">
  			&nbsp;&nbsp;&nbsp;<input type="reset"  value="Clear" style="background-color:;padding-right: 12px;padding-left: 12px;padding-bottom: 7px;padding-top: 7px"></td>
  		</tr>
  	</table>
  	
  </form>
  <br/><br/>
  <a href="UserRegister.jsp"><img src="images/register.jpg"></a>	
</div>
 </center>
<div id="footer">
	<p></p>
</div>
</body>
</html>
