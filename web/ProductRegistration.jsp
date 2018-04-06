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
  <h1> Product Registration</h1></center>
  <br/>
  <br>
  <form name="form1" action="prs" method="post" enctype="multipart/form-data">
  	<table style="" cellspacing="10px" bgcolor="#A9A9A9">
  		<tr>
  			<td align="right"><h2>Product Name :<h2></td>
  			<td><input type="text" name="pname" required style=";padding: 4px"></td>
  		</tr>
  		
  			<tr>
  			<td align="right"><h2>Actual Cost :</h2></td>
  			<td><input type="text" name="acost" required style=";padding: 4px"><h3>rs</h3></td>
  		</tr>
  		
  		<tr>
  			<td align="right"><h2>Discount Cost :</h2></td>
  			<td><input type="text" name="dcost" required style=";padding: 4px"><h3>rs</h3></td>
  		</tr>
  		
  		<tr>
  			<td align="right"><h2>Product Discription : </h2></td>
  			<td><textarea name="description" placeholder="512 characters" maxlength="512" required style="padding: 4px" ></textarea></td>
  		</tr>
  		
  		<tr>
                     <td align="right"><h2>Upload image :</h2></td>
  			<td><input type="file" name="img" required style="padding: 4px"></td>
  		</tr>
                <tr>
                    <td align="right"><h2>Category :</h2></td>
                    <td> <select name="type">
                    <option>mobiles</option>
                    <option>laptops</option>
                      <option>watches</option>
                      
                </select></td>
  			
                </tr>
  		
  			<tr>
  			<td colspan="2" align="center"><input type="submit" value="Register" 
                                                              style="background-color: ;padding-right: 12px;padding-left: 12px;padding-bottom: 7px;padding-top: 7px">
  			&nbsp;&nbsp;&nbsp;<input type="reset"  value="Clear" style="background-color:;padding-right: 12px;padding-left: 12px;padding-bottom: 7px;padding-top: 7px"></td>
  		</tr>
  	</table>
  	
  </form>
  <br/>


  </div>
	
	
</center>

<hr />
<div id="footer">
	<p></p>
</div>
</body>
</html>