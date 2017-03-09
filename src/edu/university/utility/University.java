package edu.university.utility;

import edu.university.dao.*;
import edu.university.model.*;
import java.util.ArrayList;

/*
**************************************************************************************************************
*																											 *
* Project name: University Website																		     *																											 
* Module: Administration management 		                                                                 *                                                                                                                                                                                
* File name: University.java                                                                           	 	 *
*                                                                                                            *
* Purpose: The main utility class through which all controllers operations will pass through     			 *                                                                                                          
* Technologies used: java                                                                                    *        													 
* @author  Greeshma																							 *
* @since   09-06-2015 																						 *
* @version 1.0																								 *
*                                                  															 *                                                                                                        
**************************************************************************************************************
*/

public class University 
{

	public University() {
		
		super();		
	}	

   /**
   * This method is used to validate the user login credentials
   * @param1 userId 
   * @param2 password  
   * @return Object This returns the userLogin Object.
   */
	public Object validateUserLogin(String userId,String password)
	{
		Object object=null;
		LoginDAO loginDAO=new LoginDAO();
		object=loginDAO.validateUserLogin(userId, password);			
		return object;
			
	} 
	public  ArrayList<Movie> fetchMovieRecord(){		
		StudentDAO studentDAO=new StudentDAO();
		ArrayList<Movie> movieList=studentDAO.fetchMovieRecord();
		return movieList;
	}
	
	public  ArrayList<Schedule> getSchedule(String movID){		
		StudentDAO studentDAO=new StudentDAO();
		ArrayList<Schedule> slist=studentDAO.getSchedule(movID);
		return slist;
	}
	
	public int registerUser(String firstName,String mname,String lastName,String email,
			String password,String dob,Long mobileNo){
	
		users user=new users(firstName,mname, lastName,email,password, dob,mobileNo);
		StudentDAO studentDAO=new StudentDAO();
		int id=studentDAO.registerUser(user);
		
		return id;
	}
	public int reserveTicket(String movID,int schID,int userID,int count){
		
		//users user=new users(firstName,mname, lastName,email, dob,mobileNo);
		StudentDAO studentDAO=new StudentDAO();
		int ticketNo=studentDAO.reserveTicket(movID,schID,userID,count);
		
		return ticketNo;
	}
	
	public Ticket fetchTicketDetails(int ticketID){
	
		StudentDAO studentDAO=new StudentDAO();
		Ticket ticket=studentDAO.fetchTicketDetails(ticketID);
		return ticket;
	}
	
	
	public boolean deleteTicket(int ticketID){
		StudentDAO studentDAO=new StudentDAO();
		int result=studentDAO.deleteTicket(ticketID);
		if(result!=0)
			return true;
		else
			return false;
	}
	
}