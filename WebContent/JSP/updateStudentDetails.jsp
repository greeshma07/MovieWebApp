<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="edu.university.model.UserLogin"%>
<%@page import="edu.university.utility.University"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Update Student Details New Student</title>
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

 
<script language="javascript" type="text/javascript">  
	 var xmlHttp;
	 
	 function stateChange(){   
		 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
		 document.getElementById("testName_err").innerHTML=xmlHttp.responseText;  
		 }   
	 }   
 </script> 

<script type="text/javascript">

function validateCourseBranch()
{	var myform=document.updateStudent;
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
{	var myform=document.updateStudent;
	var address=myform.address.value;
	var flag1;
	var patt1 = /[^a-z A-Z 0-9]+/i;
	flag1=patt1.test(address);
	
	if(address=="")
	{document.getElementById("address_err").innerHTML="Please enter address";
	 return false;}
	
	else if(flag1)
		{ document.getElementById("address_err").innerHTML="Invalid Entry";
		  return false;
		}
	else
		{
		  
		  document.getElementById("address_err").innerHTML=""; 
		}
	return true;
}
function validateCity()
{	var myform=document.updateStudent;
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
{	var myform=document.updateStudent;
	var mobileNo=myform.mobileNo.value;
	
	if(mobileNo=="")
	{document.getElementById("mob_err").innerHTML="Please enter mobile NO:";
	 return false;}
	
		
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

function validateUpdateStudent()
{
	
	var branch=validateCourseBranch();
	var address=validateAddress();
	var city=validateCity();
	var mobileNo=validateMobileNo();
	if(branch==false || address==false || city==false || mobileNo==false)
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
	
function cancelAction(){
	
	window.location.href="/UniversityWebsite/JSP/home.jsp"; 
	return false;
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
  
  <center>
    
 <form name="updateStudent" action="/UniversityWebsite/StudentServlet" method="post" onsubmit="return validateUpdateStudent()">
<input type="hidden" name="operation" value="updateStudentRecord"></input>
<br/><br/>
<%Student student=(Student)request.getAttribute("studentObj");%>
<input type="hidden" name="studentId" value=<%=student.getStudentID() %>></input>
<input type="hidden" name="oldBranch" value=<%=student.getBranch() %>></input>
<center><h2>Student Details</h2><hr></hr><br/>
<table >
<tr bgcolor=#F9FEFF><td align='left'>Student ID</td>
<td><input type="text" disabled="disabled" name="studId" id="studId" value=<%=student.getStudentID() %>></input></td></tr>
<tr bgcolor=#E0F9FF><td align='left'>First Name</td>
<td><input type="text" disabled="disabled" name="FirstName" id="FirstName" value=<%=student.getFirstName()%>></input></td></tr>
<tr bgcolor=#F9FEFF><td align='left'>Last Name</td>
<td><input type="text" disabled="disabled" name="LastName" id="LastName" value=<%=student.getLastName() %>></input></td></tr>
<tr bgcolor=#E0F9FF><td align='left'>Course</td>
<td><select name=branch style="width: 146px;"  onblur="return validateCourseBranch()">
<%if(student.getBranch().equalsIgnoreCase("cs")){ %>
<option value="cs" selected="selected">Computer Science</option>
<option value="ec">Electronics</option>
<option value="me">Mechanical</option><%} %>
<%if(student.getBranch().equalsIgnoreCase("ec")){ %>
<option value="ec" selected="selected">Electronics</option>
<option value="cs">Computer Science</option>
<option value="me">Mechanical</option><%} %>
<%if(student.getBranch().equalsIgnoreCase("me")){ %>
<option value="me" selected="selected">Mechanical</option>
<option value="cs">Computer Science</option>
<option value="ec">Electronics</option><%} %>
</select>
<span id="courseBranch_err" class="disp_err"></span>
</td></tr>
<tr bgcolor=#F9FEFF><td align='left'>Date Of Joining</td>
<td><input type="text" disabled="disabled" name="doj" value=<%=student.getDoj() %>></input></td></tr>
<tr bgcolor=#E0F9FF><td align='left'>Address</td>
<td><input type="text" size="20" name="address" id="address" value=<%=student.getAddress()%> onblur="return validateAddress()">
	</input><span id="address_err" class="disp_err"></span></td></tr>
<tr bgcolor=#F9FEFF>
<td align='left'>City</td>
<td><input type="text" size="20" name="city" id="city" value=<%=student.getCity() %> onblur="return validateCity()"></input><span id="city_err" class="disp_err"></span></td>
</tr>
<tr bgcolor=#E0F9FF>
<td align="left">Nationality</td>
<td><input type="text" disabled="disabled" name="nationality" value=<%=student.getNationality() %>></input></td>
</tr>
<tr bgcolor=#F9FEFF>
<td align="left">Mobile NO:</td>
<td><input type="text" maxlength="10" name="mobileNo" id="mobileNo" value=<%=student.getMobileNo() %> onblur="return validateMobileNo()"></input><span id="mob_err" class="disp_err"></span></td>
</tr>
<tr><td><br/></td><td>  </td></tr>
<tr align="left">
<td align="center"><input type="submit" value="Update" /></td>
<td align="center"><input type="reset" value="Cancel" onclick="cancelAction()"/> </td>
</tr>
</table>
</center>
</form>
</center>
<br /><br /><br />
  </div>
</div>
</body>
</html>
