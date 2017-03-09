<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="edu.university.dao.StudentDAO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Update Student Details</title>
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

<script type="text/javascript">
function validateStudentId()
{
	var myform=document.updateStudentDetails;
	var studentId=myform.studentId.value;	
	if(studentId=="null")
	{
		document.getElementById("studentId_err").innerHTML="Select Student Id to continue..";
		return false;
	}
	 
	else
	{
	  document.getElementById("studentId_err").innerHTML=""; 
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
{	response.sendRedirect("/UniversityWebsite/JSP/login.jsp");
}
else
{	userLogin=(UserLogin)hSession.getAttribute("userObj");
}
hSession.setAttribute("userObj",userLogin);


%>	
<body onload="JavaScript:timedout(121000);">
<div id="title">

  <div id="title1">Academic Administration</div>
<div style="float:right;widtgh:50;height:50;padding-right:100px;color:white">
Welcome <%=userLogin.getUserId() %>
</div>
</div>
<div id="main1">
<%@ include file="/JSP/adminmenu.jsp" %>
<div id="gallery">
  <br /><br />
<center>
<h2>Edit Student Details</h2><hr></hr>
<form name="updateStudentDetails" action="/UniversityWebsite/StudentServlet" method="post" onsubmit="return validateStudentId()">
<input type="hidden" name="operation" value="fetchStudentDetails"></input>
<input type="hidden" name="mode" value="update"></input><br/><br/>
<%-- <table>
<tr>
<td>Student ID</td>
<% ArrayList<String> sList=new ArrayList<String>();
StudentDAO sd=new StudentDAO();
sList=sd.fetchAllStudentsId();
%>
<td>
<select name="studentId" id="studentId" onchange="return validatestudentId()">
<option value="null">Select</option>
 
<%for(String s:sList){ %>
<option value=<%=s%>><%=s%></option>
<%}%>
</select><span id="studentId_err" class="disp_err"></span></td></tr>
<tr><td><br/></td><td>  </td></tr>
<tr align="left">
<td align="center"><input type="submit" value="Continue" /></td>
</tr>
</table> --%>
</form>
</center>
<br /><br /><br />
  </div> 
</div>
</body>
</html>