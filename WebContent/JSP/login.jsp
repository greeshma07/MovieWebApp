<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>ONLINE MOVIE TICKETING</TITLE>
<STYLE>
.TAB
{
BACKGROUND-COLOR:#7FFFD4;
}
</STYLE>
<script type="text/javascript"> 

function trim(input)
{
	while(input.charAt(0)==' ')
	input=input.substring(1,input.length);
	while(input.charAt(input.length-1)==' ')
	input=input.substring(0,input.length-1);
	return input;
} 
function validateUserID()
{
	var user =	document.forms["loginForm"].elements["USER"].value;
	
	if (user == null || trim(user) == "")
	{
		document.getElementById("userId_err").innerHTML="User ID must be specified";
		return false;
	}  
	else{
		document.getElementById("userId_err").innerHTML=" ";
		return true;
	}
		
}

function validatePassword(){
	var pass  =	document.forms["loginForm"].elements["PASSWORD"].value;	
	if ( pass == null || trim(pass) == "")
	{
		document.getElementById("password_err").innerHTML="Password must be specified";
		return false;
	}
	else{
		document.getElementById("password_err").innerHTML=" ";
		return true;
	}
		
}

 function submitForm()
 {
	var userId=validateUserID();
	var password=validatePassword();
	if(userId==false || password==false)
	{
		return false;
	}
  	else{
  		document.getElementById("login").disabled=true;
  		return true;
  	}
 }
      
function capLock(e)
{ 		
	kc = e.keyCode?e.keyCode:e.which;
	sk = e.shiftKey?e.shiftKey:((kc == 16)?true:false); 
	if(((kc >= 65 && kc <= 90) && !sk)||((kc >= 97 && kc <= 122) && sk))
	{				

		document.getElementById('divErrorMsg').innerHTML='Caps Lock is on. <br>';	
		document.getElementById('divErrorMsg').style.fontFamily='arial';
		document.getElementById('divErrorMsg').style.fontSize='11px';
		document.getElementById('divErrorMsg').style.fontWeight='900';
		document.getElementById('divErrorMsg').style.color='rED';
		document.getElementById('divErrorMsg').style.display='inline';
		document.getElementById('divErrorMsg').style.visibility='visible';
	}  
	
	else if(document.getElementById('divErrorMsg').innerHTML.toLowerCase() == 
		'Caps Lock is on. <br>'.toLowerCase())
	{
		document.getElementById('divErrorMsg').style.visibility='hidden';
	}
} 	    

	function clearAction(){
		document.getElementById("userId_err").innerHTML="";
		document.getElementById("password_err").innerHTML=""; 
		return true;
	} 
	
</script>

</HEAD>
<BODY 
background="JSP/movie.jpg" style="background-repeat:no-repeat;width: 100%; height: 150px; background-size: 100%;">
<CENTER>
<H1><font color="white">ONLINE MOVIE TICKETING</font></H1>
</center>
<form name="loginForm"  action="/project1/LoginController" onSubmit="return submitForm()" method="post">

<BR><BR><BR>
<%String errorMsg=(String)request.getAttribute("errorMsg"); 
if(null!=errorMsg){%><h3><font color="red"><%=errorMsg %></font></h3><%} %>
<TABLE>
<TR>
<TD>
<TABLE CELLSPACING=25 CELLPADDING=1 >
<tr ><td align="left"><b><font size=6 color="white"><a href="/project1/JSP/signUp.jsp">SIGN UP</a></font></b></tr>
<TR>
<TD>
<b><font size=6 color="white">User ID</font></b> 
</TD>
<TD>
<INPUT TYPE="TEXT" NAME="USER" MAXLENGTH="10" onblur="return validateUserID()">
<font color="red"><span id="userId_err" class="disp_err"></span></font>
</td></tr>
<TR><TD>
<b><font size=6 color="white">Password</font></b>
</TD>
<TD>
<INPUT TYPE="Password" NAME="PASSWORD" MAXLENGTH="20" onkeypress="capLock(event)" onblur="return validatePassword()">
<font color="red"><span id="password_err" class="disp_err"></span></font>
</TD></TR>
<TR>
<td></td>
<TD>
<INPUT TYPE="Submit" VALUE="Login"> 
<INPUT TYPE="Reset" VALUE="Clear" onclick="return clearAction()">
</TD>
</TR>
<tr>

            
</td>

</tr>
</TABLE>
<table align="RIGHT" WIDTH="150" >
<tr>
<td id="divErrorMsg" ></td></tr>
</table>
</TD>
</TR>
</table>
<INPUT TYPE="hidden" NAME="operation" value="login"></INPUT>
</form></BODY>
</HTML>