package edu.university.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import edu.university.model.*;
import edu.university.utility.University;

/*
**************************************************************************************************************
*																											 *
* Project name: University Website																		     *																											 
* Module: Administration management 		                                                                 *                                                                                                                                                                                
* File name: LoginController.java                                                                            *
*                                                                                                            *
* Purpose: Accept User credentials, validates the entries and redirects to the respective user page          *                                                                                                          
* Technologies used: J2EE                                                                                    *	
* Files Referred :   login.jsp     
* @author  Greeshma																							 *
* @since   09-06-2015 																						 *
* @version 1.0																								 *
*                                                  															 *                                                                                                                                                                                                                                                                                 
**************************************************************************************************************
*/

public class LoginController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, 
		IOException{
			
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, 
		IOException{
	
		//To clear the browser cache when user logs out
		response.setHeader("Pragma","no-cache");   
		response.setHeader("Cache-Control","no-store");   
		response.setHeader("Expires","0");   
		response.setDateHeader("Expires",-1); 
		
		//read the mode of operation from the jsp page		
		String operation=request.getParameter("operation");
	
		/*Code for handling the user login
		This function reads the user input from the jsp page and validates them with the database entries and 
		return the result to the user*/
		if(operation.equalsIgnoreCase("login")){
		
			String userId=request.getParameter("USER");
			String password=request.getParameter("PASSWORD");
			
			University university=new University();
			UserLogin userLogin=null;
			
			HttpSession session=request.getSession(true);
			userLogin=(UserLogin)university.validateUserLogin(userId,password);
		
			if(userLogin!=null){ //valid user input
			
				session.setAttribute("userObj", userLogin);	
				request.setAttribute("errorMsg", " ");
				RequestDispatcher rd=request.getRequestDispatcher("JSP/home.jsp?val="+userLogin.getUserId());
				rd.forward(request,response);
			}	
			//Error Message Forwarded for invalid inputs
			else{
			
				request.setAttribute("errorMsg", "<font color='red'><B>Invalid Username or Password</B></font>");
				RequestDispatcher rd=request.getRequestDispatcher("JSP/login.jsp");
				rd.forward(request, response);
			}			
		
		}
		//code for handling logout option
		else if(operation.equalsIgnoreCase("logout")){
		
			HttpSession hs=request.getSession(false);
			if(hs!=null)
				hs.invalidate();
			RequestDispatcher rd=request.getRequestDispatcher("JSP/login.jsp");
			rd.forward(request, response);
		}
	}
}
