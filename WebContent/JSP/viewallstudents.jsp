<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,edu.university.model.Movie"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Movie Details</title>

<link rel="stylesheet" href="/project1/JSP/menu.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="/project1/JSP/demo.css" />
<!-- <style>
body {behavior: url("csshover3.htc");}
#menu li .drop {background:url("img/drop.gif") no-repeat right 8px; 
</style> -->

	
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="/project1/JSP/script.js"></script>
<script type="text/javascript" src="/project1/JSP/test_paging.js"></script>

<style type="text/css">    
            .pg-normal {
                color: black;
                font-weight: normal;
                text-decoration: none;    
                cursor: pointer;   
                
				
            }
            .pg-selected {
                color: black;
                font-weight: bold;        
                text-decoration: underline;
                cursor: pointer;
            }
</style>

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
</div></div>
<div id="main1">
   <%@ include file="/JSP/adminmenu.jsp" %>
  <div id="gallery">
  <br /> <br /> <br />
 

<%ArrayList<Movie> movieList=(ArrayList<Movie>)request.getAttribute("movieList");
%>
<center><h2>Movie Details</h2><hr></hr>
<br />
<br />
<form>
<table border="0" id="viewTable">
<tr bgcolor="#70DBFF"><th>Movie ID</th>
<th>Movie Name</th>
<th>Description</th>
<th>Language</th>
<th>Duration</th>
<th>Status</th>
<th>Price</th>
<th> </th>
</tr>
<%int i=0;
for(Movie list:movieList){
if(i==0){ %>	
<tr id="odd"><td><%=list.getMovieID() %></td><td><%=list.getMovieName()%></td>
<td><%=list.getDescription() %></td>
<td><%=list.getLanguage()%></td>
<td><%=list.getDuration()%></td>
<%if(list.getStatus()=='Y') {%>
<td>Running</td><%} else { %>
<td>Upcoming</td><%} %>
<td><%=list.getPrice()%></td>
</tr><%i=1;} else{%>	
<tr id="even"><td><%=list.getMovieID() %></td><td><%=list.getMovieName() %></td>
<td><%=list.getDescription() %></td>
<td><%=list.getLanguage()%></td>
<td><%=list.getDuration()%></td>
<%if(list.getStatus()=='Y') {%>
<td>Running</td><%} else { %>
<td>Upcoming</td><%} %>
<td><%=list.getPrice()%></td>
</tr><%i=0;}%>
<%} %></table>
<div id="pageNavPosition"></div>       
</form>
<script type="text/javascript">
    
    var pager = new Pager('viewTable',5); 
    pager.init(); 
    pager.showPageNav('pager', 'pageNavPosition'); 
    pager.showPage(1);
    
</script>
</center>
<br /><br /><br />
  </div></div>
</body>
</html>