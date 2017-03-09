package edu.university.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.university.model.Ticket;
import edu.university.dao.StudentDAO;
import edu.university.model.Movie;
import edu.university.model.Payment;
import edu.university.model.Schedule;

import edu.university.utility.University;

/*
**************************************************************************************************************
*																											 *
* Project name: University Website																		     *																											 
* Module: Administration management 		                                                                 *                                                                                                                                                                                
* File name: StudentServlet.java                                                                           	 *
*                                                                                                            *
* Purpose: Read user request and passes the attributes to the utility class and accepts the result back from 
* the utility class and redirects to the respective UI page       											 *                                                                                                          
* Technologies used: J2EE                                                                             		 *
* Files Referred :  Student.java,University.java
* @author  Greeshma																						 *
* @since   09-06-2015 																						 *
* @version 1.0																								 *
*                                                  															 *                                                                                                                                                                                                                                                                            
**************************************************************************************************************
*/
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public StudentServlet() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//read the mode of operation from jsp page
		String operation=request.getParameter("operation");
		
		
		if(operation.equalsIgnoreCase("signUp")){
			
			String firstName=request.getParameter("fname");
			String lastName=request.getParameter("lastName");
			String mname=request.getParameter("mname");
			String password=request.getParameter("pwd");
			String email=request.getParameter("email");		
			String dob=request.getParameter("dob");
			Long mobileNo=Long.parseLong(request.getParameter("mob"));
						
			University university=new University();
			int  userID=university.registerUser(firstName,mname, lastName, email,password, dob,mobileNo);
			
			firstName=null;lastName=null;email=null;dob=null;
			university=null;
			
			if(userID!=0){			
				request.setAttribute("userID",userID);
				request.setAttribute("flag","regSuccess");
				RequestDispatcher rd=request.getRequestDispatcher("JSP/signUpResult.jsp");
				rd.forward(request, response);
			}
			else{			
				request.setAttribute("flag","regFailed");
				RequestDispatcher rd=request.getRequestDispatcher("JSP/signUpResult.jsp");
				rd.forward(request, response);;
			}
		}	
		//code for handling new student register
		else if(operation.equalsIgnoreCase("book")){
		
			int userID=Integer.parseInt(request.getParameter("uid"));
			String movID=request.getParameter("movID");			
			
			int schID=Integer.parseInt(request.getParameter("schID"));
			System.out.println("schID"+schID);
			int count=Integer.parseInt(request.getParameter("count"));
			
			University university=new University();
			int ticketNum=university.reserveTicket(movID,schID,userID,count);
			
			university=null;
			
			if(ticketNum!=0){			
				request.setAttribute("ticket",ticketNum);
				RequestDispatcher rd=request.getRequestDispatcher("JSP/payment.jsp");
				rd.forward(request, response);
				/*request.setAttribute("flag","bookTicket");
				RequestDispatcher rd=request.getRequestDispatcher("JSP/viewResult.jsp");
				rd.forward(request, response);*/
			}
			else{			
				request.setAttribute("flag","bookTicketFailed");
				RequestDispatcher rd=request.getRequestDispatcher("JSP/viewResult.jsp");
				rd.forward(request, response);;
			}
		}
		else if(operation.equalsIgnoreCase("payment")){
			
			int ticketNum=Integer.parseInt(request.getParameter("ticketNum"));
			String name=request.getParameter("name");
			String cardType=request.getParameter("type");
			int secCode=Integer.parseInt(request.getParameter("sec"));
			int cardNo=Integer.parseInt(request.getParameter("cardno"));
				
			String expDate=request.getParameter("exp");
						System.out.println("ticketNum :"+ticketNum);
			StudentDAO student=new StudentDAO();
			Payment payment= new Payment(cardNo,secCode,name,cardType,expDate);
			int  result=student.payment(payment,ticketNum);
			if(result!=0){			
				request.setAttribute("ticket",ticketNum);
				request.setAttribute("flag","bookTicket");
				RequestDispatcher rd=request.getRequestDispatcher("JSP/viewResult.jsp");
				rd.forward(request, response);
			}
		}
	
		else if(operation.equalsIgnoreCase("getSchedule")){
			String movID=request.getParameter("movie");
			University university=new University();
			ArrayList<Schedule> sList=university.getSchedule(movID);
			response.setContentType("text/xml");
			PrintWriter pr=response.getWriter();
			if(sList!=null)
			{
				pr.println("<schedule>");
			    for(Schedule s:sList)
		        {                            
			    	pr.println("<schID>"+s.getScheduleID()+"</schID>");
		           pr.println("<schTime>"+s.getScheduleTime()+"</schTime>");

		        }
		        pr.println("</schedule>");

			}
			
		
		}
		
		//Display details of all Students
		else if(operation.equalsIgnoreCase("viewMovieDetails")){
			
			University university=new University();
			ArrayList<Movie> movieList=university.fetchMovieRecord();
			if(movieList.size()!=0){
				RequestDispatcher rd=request.getRequestDispatcher("/JSP/viewallstudents.jsp");
				request.setAttribute("movieList",movieList);
				rd.forward(request,response);
			}
			else{
				request.setAttribute("flag","noRecords");
				RequestDispatcher rd=request.getRequestDispatcher("JSP/viewResult.jsp");
				rd.forward(request, response);				
			}				
		}
		
		//To get the details of a student by passing student ID		
		else if(operation.equalsIgnoreCase("fetchTicketDetails")){
			int ticketID=Integer.parseInt(request.getParameter("ticketID"));
			University university=new University();
			Ticket ticket=university.fetchTicketDetails(ticketID);
			if(null!=ticket){
					request.setAttribute("ticket",ticket);
					RequestDispatcher rd=request.getRequestDispatcher("JSP/viewDetails.jsp");
					rd.forward(request, response);
			}				
			else{
				request.setAttribute("flag","noRecords");
				RequestDispatcher rd=request.getRequestDispatcher("JSP/viewResult.jsp");
				rd.forward(request, response);				
			}	
		}
		
		else if(operation.equalsIgnoreCase("deleteTicket")){
			
			int ticketID=Integer.parseInt(request.getParameter("ticketID"));
			University university=new University();
			boolean msg=university.deleteTicket(ticketID);
			if(msg){
				request.setAttribute("flag","deleteSuccess");
				RequestDispatcher rd=request.getRequestDispatcher("JSP/viewResult.jsp");
				rd.forward(request, response);
			}
				
			else{
				request.setAttribute("flag","deleteFailed");
				RequestDispatcher rd=request.getRequestDispatcher("JSP/viewResult.jsp");
				rd.forward(request, response);
			}
				
		}	
		
		else if(operation.equalsIgnoreCase("login")){
			
			HttpSession hs=request.getSession(false);
			if(hs!=null)
				hs.invalidate();
			RequestDispatcher rd=request.getRequestDispatcher("JSP/login.jsp");
			rd.forward(request, response);
		}
	}		

}
