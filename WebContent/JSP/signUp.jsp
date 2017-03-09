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
	
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="/project1/JSP/script.js"></script>
<script language="javascript" type="text/javascript" src="datetimepicker.js"></script> 
<script language="javascript" type="text/javascript">  
 var xmlHttp;
 
 /* function stateChange(){   
	 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
	 document.getElementById("testName_err").innerHTML=xmlHttp.responseText;  
	 }   
 }    */
 </script> 
<script type="text/javascript">

function validateFirstName()
{	var myform=document.registerStudent;
	var firstName=myform.firstName.value;
	var flag1;
	var patt1 = /[^a-z A-Z 0-9]+/i;
	flag1=patt1.test(firstName);
	if(firstName==""){
		document.getElementById("firstName_err").innerHTML="Please enter name";
		 return false;
	}
	else if(firstName.match(/\d+/g))
	{
		document.getElementById("firstName_err").innerHTML="Invalid Entry";
		  return false;
	}
	else if(flag1)
	{ document.getElementById("firstName_err").innerHTML="Invalid Entry";
	  return false;
	}
	else
	{
	  document.getElementById("firstName_err").innerHTML=""; 
	}
	return true;
}

function validateLastName()
{	var myform=document.registerStudent;
	var lastName=myform.lastName.value;
	var flag1;
	var patt1 = /[^a-z A-Z 0-9]+/i;
	flag1=patt1.test(lastName);
	if(lastName==""){	
		document.getElementById("lastName_err").innerHTML="Please enter last name";
		return false;
	}
	
	else if(lastName.match(/\d+/g))
	{
		document.getElementById("lastName_err").innerHTML="Invalid Entry";
		  return false;
	}
	else if(flag1)
	{ document.getElementById("lastName_err").innerHTML="Invalid Entry";
	  return false;
	}
	else
	{
	 
	  document.getElementById("lastName_err").innerHTML=""; 
	}
	return true;
}


function validateDob()
{	
	var myform=document.registerStudent;
	var doj=myform.dob.value;
	if(doj=="")
	{
	  document.getElementById("dob_err").innerHTML="pick birth date";
	  return false; 
	}
	else
	{
	  document.getElementById("dob_err").innerHTML=" ";
	  return true;
	}
}


function validateCourseBranch()
{	var myform=document.registerStudent;
	var branch=myform.branch.value;
	if(branch=="null")
	{
	 document.getElementById("courseBranch_err").innerHTML="Select branch";
	 return false;
	 }
	 
	else
	{document.getElementById("courseBranch_err").innerHTML="";	
	  return true; 
	}
}
function validateAddress()
{	var myform=document.registerStudent;
	var address=myform.address.value;
	var flag1;
	var patt1 = /[^a-z A-Z 0-9]+/i;
	flag1=patt1.test(address);
	
	if(address=="")
	{
		document.getElementById("address_err").innerHTML="Please enter address";
		 return false;
	}
	
	else if(flag1)
	{ 
		document.getElementById("address_err").innerHTML="Invalid Entry";
		  return false;
	}
		
	else
	{
	  document.getElementById("address_err").innerHTML=""; 
	}
	return true;
}
function validateCity()
{	var myform=document.registerStudent;
	var city=myform.city.value;
	var flag1;
	var patt1 = /[^a-z A-Z 0-9]+/i;
	flag1=patt1.test(city);
	if(city=="")
	{document.getElementById("city_err").innerHTML="Please enter city";
	 return false;}
	
	else if(city.match(/\d+/g))
	{
		document.getElementById("city_err").innerHTML="Invalid Entry";
		  return false;
	}
	else if(flag1)
	{ document.getElementById("city_err").innerHTML="Invalid Entry";
	  return false;
	}
	else
	{
	  document.getElementById("city_err").innerHTML=""; 
	}
	return true;
}

function validateMobileNo()
{	var myform=document.registerStudent;
	var mobileNo=myform.mobileNo.value;
	
	if(mobileNo=="")
	{
		document.getElementById("mob_err").innerHTML="Please enter mobile NO:";
		return false;
	}		
	else if((isNaN(mobileNo)))
	{
		document.getElementById("mob_err").innerHTML="Invalid Entry";
		  return false;
	}
	else if(!(mobileNo.length==10))
	{
		document.getElementById("mob_err").innerHTML="Invalid Entry";
		  return false;
	}
	else
	{
	  document.getElementById("mob_err").innerHTML=""; 
	}
	return true;
}

function validateRegisterStudent()
{
	
	var firstName=validateFirstName();
	var lastName=validateLastName();
	var branch=validateCourseBranch();
	var doj=validateDoj();
	var address=validateAddress();
	var city=validateCity();
	var nationality=validateNationality();
	var mobileNo=validateMobileNo();
	if(firstName==false || lastName==false || branch==false || doj==false || 
			address==false || city==false || nationality==false || 
			mobileNo==false)
	{
		return false;
	}
	 else
	   {
		 var booleon=confirm("Click OK to continue");
		 if(booleon==true)
		 {
	 		return true;
	 	 }
		 else
		 {
			return false;
		 }
	   }
	}
	

function cancelAction()
{	
	window.location.href="/project1/JSP/login.jsp"; 
	
}
</script>

</head>
	
<body>

<div id="title">

  <div id="title1">Online Movie Ticketing</div>
<%-- <div style="float:right;widtgh:50;height:50;padding-right:100px;color:white">
Welcome <%=userLogin.getUserId() %>
</div> --%>
</div>
<div id="main1">
  <%--  <%@ include file="/JSP/adminmenu.jsp" %> --%>
  <div id="gallery">
  <br />
  <br />
  <center>
  <h2>CREATE ACCOUNT</h2><hr></hr>
  <br />
   
<form name="signup" action="/project1/StudentServlet" >
<input type="hidden" name="operation" value="signUp" />
<table>
<tr align="left">
<td>First Name</td>
<td><input type="text" name="fname" maxlength="20"></input><span id="firstName_err" class="disp_err"></span></td>
</tr>
<tr align="left">
<td>Middle Name</td>
<td><input type="text" name="mname" maxlength="20"></input><span id="firstName_err" class="disp_err"></span></td>
</tr>
<tr align="left">
<td>Last Name</td>
<td><input type="text" name="lastName" maxlength="20"></input><span id="firstName_err" class="disp_err"></span></td>
</tr>
<tr align="left">
<td>Email ID:</td>
<td><input type="text" name="email" maxlength="20"></input><span id="lastName_err" class="disp_err"></span></td>
</tr>
<tr align="left">
<td>Mobile NO:</td>
<td><input type="text" name="mob" maxlength="20"></input><span id="lastName_err" class="disp_err"></span></td>

</tr>
<tr align="left">
	<td>Date of Birth</td>
	<td><input type="text" size="20" name="dob" id="dob" onmouseout="return validateDob()"><a href="javascript:NewCal	('dob','ddmmyyyy',false,0)"><img src="cal.gif" width="16" height="16" border="0" alt="Pick a date" onmouseout="return validateDob()"></img></a>
	</input><span id="doj_err" class="disp_err"></span></td>
</tr>
<tr align="left">
<td>Password</td>
<td><input type="password" name="pwd" maxlength="20"></input></td>
</tr>

<tr><td><br/></td><td>  </td></tr>
<tr>
<td align="center"><input type="submit" value="Create" /></td>
<td align="center"><input type="reset" value="Cancel" onclick="cancelAction()"/> </td>
</tr>
</table>
</form>
</center>
<br /><br /><br />
  </div></div>
</body>
</html>
