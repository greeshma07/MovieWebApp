<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="edu.university.dao.StudentDAO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Remove Student Details</title>
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
<script type="text/javascript">

function confirmDelete()
{	
	var booleon=confirm("Are you sure,Do you want to cancel ticket?");
	if(booleon==true)
	{
	 return true;
	}
	else
	{
	  return false;
	}
}

function cancelAction()
{	
	window.location.href="/project1/JSP/home.jsp"; 
	
}

</script>


</head>
	
	<% 
	HttpSession hSession=request.getSession(false);
	int time=hSession.getMaxInactiveInterval();
	UserLogin userLogin=null;
	if(hSession==null)
	{	response.sendRedirect("/project1/JSP/login.jsp");
	}
	else
	{	userLogin=(UserLogin)hSession.getAttribute("userObj");
	}
	hSession.setAttribute("userObj",userLogin);


%>	
<body onload="JavaScript:timedout(121000);">
<div id="title">

  <div id="title1">Online Movie Ticketing</div>
<div style="float:right;widtgh:50;height:50;padding-right:100px;color:white">
Welcome <%=userLogin.getUserId() %>
</div>
</div>
<div id="main1">
   <%@ include file="/JSP/adminmenu.jsp" %>
  <div id="gallery">
  <br />
  <br />
  
<center>
<h2>Ticket Details</h2><hr></hr><br/>
<form name="viewTicket" action="/project1/StudentServlet" method="post">
<input type="hidden" name="operation" value="fetchTicketDetails"></input>

<table>
<tr align="left">
<td>Ticket Number</td>
<td> 
 <input type="text" name="ticketID"></input></td></tr>

<tr><td><br/></td><td>  </td></tr>
<tr align="center"><td><input type="submit" value="View Details"></input></td>
<td align="center"><input type="reset" value="Back" onclick="cancelAction()"/> </td></tr>
</table>
</form>
</center>
<br /><br /><br />

  </div></div>

</body>
</html>