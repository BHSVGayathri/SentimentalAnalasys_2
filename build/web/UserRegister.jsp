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
        <script type="text/javascript">
            function validateForm()
            {

                var rpwd = document.forms["rf"]["rpwd"].value;
                var pwd = document.forms["rf"]["pwd"].value;
                var mob = document.forms["rf"]["mob"].value;
                var mail = document.forms["rf"]["mail"].value;
                var n = rpwd.localeCompare(pwd);

          if(!n==0)
                {
                    alert("password and retype password should be same");
                    return false;
                }


                if (mob.length != 10) {
                    alert("Mobile Number should be 10 length");
                    return false;
                }



                if (/\D/.test(mob) || mob == "")
                {
                    alert("Please enter only numeric mobile(Allowed input:0-9)")
                    return false;
                }


                if (/^([A-Za-z0-9_\-\.])+\@([gmail|GMAIL])+\.(com)$/.test(mail)) {

                } else {
                    alert("not valid Gmail");
                    return false;

                }




            }

        </script> 

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
                <h2>Register Here</h2>
                <br/><br/>
                <form name="rf" method="POST" action="suds" onsubmit="return validateForm()" >
                    <table style="" cellspacing="15px" background="images/img02.jpg">
                        <tr>

                            <td><input type="text" name="fname" size="35" required placeholder="First Name" style="padding: 4px" required="">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text" size="30" style="padding: 4px" name="lname" required placeholder="Last Name" required=""></td>
                        </tr>

                        <tr>

                            <td><input type="text" name="mail" required size="35" placeholder="user-name/mail" style="padding: 4px" required="">@gmail.com
                            </td>
                        </tr>


                        <tr>

                            <td><input type="password" name="pwd" size="35" placeholder="choose password" style="padding: 4px" required=""></td>
                        </tr>
                        <tr>
                            <td><input type="password" style="padding: 4px" name="rpwd" required placeholder="re-enter password" size="35" required=""></td>
                        </tr>

                        <tr>

                            <td><input type="text" name="mob" required size="35" placeholder="mobile number" style="padding: 4px" required="">
                            </td>
                        </tr>



                        <tr>
                            <td colspan="2" align="center"><input type="submit" value="Register" onclick="Validate()" style="padding-right: 12px;padding-left: 12px;padding-bottom: 7px;padding-top: 7px">
                                &nbsp;&nbsp;&nbsp;<input type="reset"  value="Clear" style="padding-right: 14px;padding-left: 14px;padding-bottom: 7px;padding-top: 7px"></td>
                        </tr>


                    </table>

                </form>
                <br/>


            </div>
        </center>
        <div id="footer">
            <p></p>
        </div>
    </body>
</html>
