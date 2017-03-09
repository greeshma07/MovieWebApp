<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="edu.university.model.UserLogin"%>
<%@page import="edu.university.utility.University"%>
<%@page import="edu.university.dao.StudentDAO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>View Student Details</title>
<link rel="stylesheet" type="text/css" href="/UniversityWebsite/JSP/demo.css" />
<link rel="stylesheet" href="/UniversityWebsite/JSP/menu.css" type="text/css" media="screen" />
<!--[if IE 6]>
<style>
body {behavior: url("csshover3.htc");}
#menu li .drop {background:url("img/drop.gif") no-repeat right 8px; 
</style>
<![endif]-->
	
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="/UniversityWebsite/JSP/script.js"></script>
<script language="javascript" type="text/javascript" src="datetimepicker.js"></script>
<script type="text/javascript">

	function validateCourseBranch()
	{	var myform=document.viewStudent;
		var branch=myform.branch.value;
		if(branch=="null")
		{	 
		 return false;
		}
		 
		else
		{
			return true; 
		}
			
	}
	function validateYear()
	{	var myform=document.viewStudent;
		var year=myform.year.value;
		if(year=="0")
		{	 
		 return false;
		}
		 
		else
		{
			return true; 
		}
			
	}


	function validateviewStudent()
	{
		
		var branch=validateCourseBranch();
		var year=validateYear();
		if(branch==false && year==false)
		{
			document.getElementById("courseOrYear_err").innerHTML="Either branch or year must be selected";
			return false;
		}
		else{
			return true;	
		}
		
	}
		
	function cancelAction(){
		document.location.href("JSP/home.jsp"); 
	}
</script>

</head>
<% 
	HttpSession hSession=request.getSession(false);
	int time=hSession.getMaxInactiveInterval();
	UserLogin userLogin=null;
	if(hSession==null)
	{	response.sendRedirect("/UniversityWebsite/JSP/login.jsp");
	}
	else
	{	userLogin=(UserLogin)hSession.getAttribute("userObj");
	}
	hSession.setAttribute("userObj",userLogin);


%>	
	
<body onload="JavaScript:timedout(600001);">

<div id="title">

  <div id="title1">Academic Administration</div>
<div style="float:right;widtgh:50;height:50;padding-right:100px;color:white">
Welcome <%=userLogin.getUserId() %>
</div>
</div>
<div id="main1">
   <%@ include file="/JSP/adminmenu.jsp" %>
  <div id="gallery">
  <br /><br /><br />
  <center>
  <h2>View Student Details</h2><hr></hr>
  <br />
 
<form name="viewStudent" action="/UniversityWebsite/StudentServlet" onsubmit="return validateviewStudent()">
<input type="hidden" name="operation" value="viewStudentsByCourseOrYear" />
<table>
<tr><td><span id="courseOrYear_err" class="disp_err"></span></td></tr>
<tr>
<td>Course Branch</td>
<td><select name=branch style="width: 146px;">
<option value="null">Select course</option>
<option value="cs">Computer Science</option>
<option value="ec">Electronics</option>
<option value="me">Mechanical</option>
</select>

</td>
<td></td>
<%-- <td>Year Of Joining</td>
<% ArrayList<Long> yearList=new ArrayList<Long>();
StudentDAO sd=new StudentDAO();
yearList=sd.fetchYearOfJoining();
%>
<td><select name=year style="width: 146px;">
<option value="0">Select year</option>
<%for(Long y:yearList){ %>
<option value=<%=y%>><%=y%></option>
<%}%>
</select> --%>
</td></tr>
<tr><td><br/></td><td>  </td></tr>
<tr align="center">
<td><input type="submit" value="View Details" /></td>
</tr>
</table>
</form>
</center>
<br /><br /><br />
  </div>
</div>
</body>
</html>
