<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Tickets</title>
<link rel="stylesheet" type="text/css" href="/project1/JSP/demo.css" />
<link rel="stylesheet" href="/project1/JSP/menu.css" type="text/css" media="screen" />
<!--[if IE 6]>
<style>
body {behavior: url("csshover3.htc");}
#menu li .drop {background:url("img/drop.gif") no-repeat right 8px; 
</style>
<![endif]-->
	
<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="/project1/JSP/script.js"></script>
<script language="javascript" type="text/javascript" src="datetimepicker.js"></script> 
<script language="javascript" type="text/javascript">  
 var xmlHttp;
 
 function stateChange(){   
	 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
	 document.getElementById("testName_err").innerHTML=xmlHttp.responseText;  
	 }   
 }   
 </script>  -->


</head>
	
<body >
<div id="title">

  <div id="title1">Online Movie Ticketing</div>
 <div style="float:right;widtgh:50;height:50;padding-right:100px;color:white">
 <a href="/project1/StudentServlet?operation=login" class="drop">Login</a>
<!-- <a href="/project1/JSP/login.jsp"><b><font size=3>Login</font></b></a> -->
</div> 
</div>
<div id="main1">
  <div id="gallery">
  <br />
  <br />
  <center>
  <h2>CREATE ACCOUNT</h2><hr></hr>
  <br />
  
  <%
int userID=(Integer)request.getAttribute("userID");
  String flag=(String)request.getAttribute("flag");


if(null!=flag && flag.equalsIgnoreCase("regSuccess")){%>
	<h2>Your account has been created successfully.</h2>
	<h2>Please save your user ID for further proceedings:<%=userID%></h2><hr></hr>
	<br></br>
   <%} 
else if(null!=flag && flag.equalsIgnoreCase("deleteFailed")){%>
<h2>Failed to create account due to some internal errors..</h2><hr></hr>

<%}%>

</center>
<br /><br /><br />
  </div></div>
</body>
</html>
