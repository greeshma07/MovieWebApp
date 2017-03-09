<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,javax.servlet.http.HttpSession,edu.university.model.*" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Academic Administration</title>
<link rel="stylesheet" type="text/css" href="/project1/JSP/demo.css" />
<link rel="stylesheet" href="/project1/JSP/menu.css" type="text/css" media="screen" />
<!--[if IE 6]>
<style>
body {behavior: url("csshover3.htc");}
#menu li .drop {background:url("img/drop.gif") no-repeat right 8px; 
</style>
<![endif]-->

	
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="/project1/JSP/script.js"></script>

</head>
<% //User uobj=(User)request.getAttribute("uobj"); %>	
<%  
	HttpSession httpSession=request.getSession(false);
	UserLogin userLogin=null;
	if(httpSession==null)
	{	System.out.println("hs is null ");	
		response.sendRedirect("/project1/JSP/login.jsp");
	}
	else
	{  userLogin=(UserLogin)httpSession.getAttribute("userObj"); 
	 System.out.println("hs is not null ");
	  if(userLogin==null)
		  response.sendRedirect("/project1/JSP/login.jsp");
	  else
		  System.out.println("UID is not null"); 
	}
	httpSession.setAttribute("userObj",userLogin);
%>	  
	
<body background="/project1/JSP/homeImg.jpg" style="background-repeat:no-repeat;width: 100%; height: 150px; background-size: 100%;"
onload="JavaScript:timedout(121000);">

<div id="title">

  <div id="title1">Online Movie Ticketing</div>
  
<div style="float:right;widtgh:50;height:50;padding-right:150px;color:#ffffff">
Welcome <%=userLogin.getUserId() %>
</div></div>
 <div id="main1"> 
<%@ include file="adminmenu.jsp"%>
<div id="gallery">
  </div>
</div>
</body>
</html>