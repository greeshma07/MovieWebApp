<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.university.dao.StudentDAO"%>
<%@page import="edu.university.model.Student"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Student Details</title>
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

<script language="javascript" type="text/javascript">  
	 
	function validatestudentId()
	{	
		var myform=document.viewStudent;
		var studentId=myform.studentId.value;
	 	if(studentId=="null")
	 	{
	 	 	document.getElementById("studId_err").innerHTML="Select ID";
	 	 	return false;
	 	}
	 	 
	 	else
	 	{
	 		document.getElementById("studId_err").innerHTML="";
	 	    return true; 
	 	}
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
	
<body>
<div id="title">

  <div id="title1">Online Movie Ticketing</div>
  <div style="float:right;widtgh:50;height:50;padding-right:100px;color:white">
Welcome <%=userLogin.getUserId() %>
</div>
</div>
<div id="main1">
<%@ include file="/JSP/adminmenu.jsp" %>
<div id="gallery">
  <br /><br /><br />
  <center>
 
 
<%String flag=(String)request.getAttribute("flag");

if(null!=flag && flag.equalsIgnoreCase("bookTicket")){

int ticketNum=(Integer)request.getAttribute("ticket");
%>
<h2>You have successfully booked your tickets.</h2>
<h2>You can view ticket details using Ticket number:<%=ticketNum%></h2><hr></hr><%}
else if(null!=flag && flag.equalsIgnoreCase("bookTicketFailed")){%>
<h2>Failed to book tickets due to some internal errors..</h2><hr></hr>

<%} 
else if(null!=flag && flag.equalsIgnoreCase("noRecords")){%>
<h2>No Records Available</h2><hr></hr>

<%}
else if(null!=flag && flag.equalsIgnoreCase("deleteSuccess")){%>
<h2>Ticket has been cancelled successfully</h2><hr></hr>	

<%}
else if(null!=flag && flag.equalsIgnoreCase("deleteFailed")){%>
<h2>Failed to cancel ticket due to some errors..</h2><hr></hr>

<%}
%>
<br /><br />
</center>
<br /><br /><br />
</div></div>
</body>
</html>