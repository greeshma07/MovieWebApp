<%@ page import ="edu.university.model.*"%>
<% 	response.setHeader("Pragma","no-cache");   
   	response.setHeader("Cache-Control","no-store");   
	response.setHeader("Expires","0");   
	response.setDateHeader("Expires",-1);
	HttpSession hs=request.getSession(false);
	if(hs==null)
	{	RequestDispatcher rd=request.getRequestDispatcher("/project1/JSP/login.jsp");
		System.out.println("This is Sesssion null:"+hs);
		rd.forward(request,response);
	}%>
<%long ltime=hs.getLastAccessedTime();%>
<%long ctime=System.currentTimeMillis();%>
<%if(ctime-ltime>120000)
 {	
	hs.invalidate();
   	response.setIntHeader("temp",1);
	response.sendRedirect("/project1/JSP/login.jsp?action=logout");
}
%>

<script>
function timedout(timeoutPeriod)
{
	setTimeout("location.reload(false);",timeoutPeriod);
	
}
</script>


<ul id="menu2">  
	
    <li><a href="#" class="dropp">User Menu</a>
      <!-- Begin 4 columns Item -->
      <div class="dropdown_4columns">
        <!-- Begin 4 columns container -->
        <div class="col_4">
          <h2>User Menu</h2>
        </div>
         <div class="col_1">
          <h3>Movie Details</h3>
           <ul>
           <li><a href="/project1/StudentServlet?operation=viewMovieDetails">Movie Details</a></li>
            
          </ul>
        </div>
        <div class="col_1">
          <h3>Book Tickets</h3>
          <ul>
            <li><a href="/project1/JSP/newstudent.jsp">Reserve</a></li>
           
          </ul>
        </div>
        <div class="col_1">
          <h3>View Ticket Details</h3>
          <ul>
            <li><a href="/project1/JSP/viewMainPage.jsp">View Details By Ticket NO:</a></li>
           
          </ul>
        </div>
              <div class="col_1">
          <h3>Cancel Tickets</h3>
          <ul>
            <li><a href="/project1/JSP/deleteMainPage.jsp">cancel</a></li>
          </ul>
        </div>
      </div>
      <!-- End 4 columns container -->
    </li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li>
    <li><a href="/project1/LoginController?operation=logout" class="drop">Logout</a></li>
    <!-- End 4 columns Item -->       
  </ul>
