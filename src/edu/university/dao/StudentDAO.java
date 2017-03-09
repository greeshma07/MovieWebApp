
package edu.university.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import edu.university.database.DBHandler;
import edu.university.model.Ticket;
import edu.university.model.users;
import edu.university.model.Movie;
import edu.university.model.Payment;
import edu.university.model.Schedule;


/*
**************************************************************************************************************
*																											 *
* Project name: University Website																		     *																											 
* Module: Administration management 		                                                                 *                                                                                                                                                                                
* File name: StudentDAO.java                                                                           	 	 *
*                                                                                                            *
* Purpose: Read the attributes from the University.java class and process it with the oracle database and 
* gives back the result to the utility class.       											 			 *                                                                                                          
* Technologies used: java,Oracle                                                                             *
* Files Referred :  Student.java,University.java         													 *
* @author  Greeshma																							 *
* @since   09-06-2015 																						 *
* @version 1.0																								 *
*                                                  															 *                                                                                                        
**************************************************************************************************************
*/


public class StudentDAO 
{
	
	public ArrayList<Movie> fetchMovieRecord(){
			
			ArrayList<Movie> movieList=new ArrayList<Movie>();
			DBHandler db=new DBHandler();
			String query="select * from movie";
			try{
				ResultSet resultSet=db.executeDRL(query);
				while(resultSet.next()){
					String movieID=resultSet.getString(1);
					String movieName=resultSet.getString(2);
					String description=resultSet.getString(3);
					String language=resultSet.getString(4);
					float duration=resultSet.getFloat(5);
					String status=resultSet.getString(6);
					
					float price=resultSet.getFloat(7);
									
					Movie movie=new Movie();
					movie.setMovieID(movieID);
					movie.setMovieName(movieName);
					movie.setDescription(description);
					movie.setLanguage(language);
					movie.setDuration(duration);
					movie.setStatus(status.charAt(0));
					movie.setPrice(price);
					movieList.add(movie);
					movieID=null;movieName=null;description=null;language=null;status=null;
					movie=null;
				}
			}
			catch(SQLException e){
				e.printStackTrace();
			}
			db.closeConn();
			query=null;
			return movieList;
			
		}	

		public ArrayList<Movie> fetchAllMovieNames(){
			
			ArrayList<Movie> movieList=new ArrayList<Movie>();
			DBHandler db=new DBHandler();
			try{
				String query="select movID,moviename from movie where status='Y'";
				ResultSet resultSet=db.executeDRL(query);
				query=null;
				while(resultSet.next()){
					String id=resultSet.getString(1);
					String name=resultSet.getString(2);
					Movie movie=new Movie();
					movie.setMovieID(id);
					movie.setMovieName(name);
					movieList.add(movie);
					movie=null;
				}
				
			}
			catch(SQLException e){
				e.printStackTrace();
			}
			db.closeConn();
			return movieList;
		}	

	public ArrayList<Schedule> getSchedule(String movID){
			
			ArrayList<Schedule> sList=new ArrayList<Schedule>();
			DBHandler db=new DBHandler();
			try{
				String query="select * from schedule where scheduleID in(select screen_sid from screen "
						+ "where moid='"+movID+"' and vacancy >"+0+")";
				ResultSet resultSet=db.executeDRL(query);
				System.out.println(query);
				query=null;
				while(resultSet.next()){
					int id=resultSet.getInt(1);
					String time=resultSet.getString(2);
					Schedule schedule=new Schedule();
					schedule.setScheduleID(id);
					schedule.setScheduleTime(time);
					sList.add(schedule);
					schedule=null;
				}
				
			}
			catch(SQLException e){
				e.printStackTrace();
			}
			db.closeConn();
			return sList;
		}	

	public int reserveTicket(String movID,int schID,int userID,int count){
		
		DBHandler dbHandler=new DBHandler();
		int ticket=generateTicketNo();
		int resvID = generateResvID();
		String movName=null,time=null;
		int price=0,screenNO=0,vacancy=0;	
		String query="select moviename,price from movie where movID='"+movID+"'";
		ResultSet resultSet=dbHandler.executeDRL(query);
		query=null;
		try{
			if(resultSet.next()){
				movName=resultSet.getString(1);	
				price=resultSet.getInt(2);		
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		price=price * count;
		query="select screenno,vacancy from screen where moid='"+movID+"' and screen_sid="+schID
				+" and vacancy >"+0;
		System.out.println(query);
		resultSet=dbHandler.executeDRL(query);
		query=null;
		try{
			if(resultSet.next()){
					screenNO=resultSet.getInt(1);
					vacancy=resultSet.getInt(2);		
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		
		query="select scheduled_time from schedule where scheduleID="+schID;
		System.out.println(query);
		resultSet=dbHandler.executeDRL(query);
		query=null;
		try{
			if(resultSet.next()){		
				time=resultSet.getString(1);		
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
			
		query="insert into ticket values("+ticket+",'"+movName
				+"',to_date('"+time+"','yyyy-mm-dd HH24:MI:SS'),"+count+","+price+")";
		System.out.println(query);
		int result=dbHandler.executeDML(query);
		query=null;
		query="insert into reservation values("+resvID+",'"+movID
				+"',"+schID+","+screenNO+","+ticket+","+userID+")";
		System.out.println(query);
		result=dbHandler.executeDML(query);
		query=null;//to deallocate the string variable
		
		int seat_occupied=0;
		query="select seat_occupied from consists_of where scrno="+screenNO+" and mov_id='"+movID+"' "
				+ "and schdid"+ "="+schID;
		System.out.println(query);
		resultSet=dbHandler.executeDRL(query);
		query=null;
		try{
			if(resultSet.next()){		
					seat_occupied=resultSet.getInt(1);		
			}
		}
		catch (SQLException e)	{
			e.printStackTrace();
		}	
		
		seat_occupied=seat_occupied+count;
		System.out.println("seat_occupied"+seat_occupied);
		query="update consists_of set seat_occupied= "+seat_occupied+" where scrno="+screenNO+" and "
				+ "mov_id='"+movID+"' and schdid"+ "="+schID;
		System.out.println(query);
		result=dbHandler.executeDML(query);
		query=null;//to deallocate the string variable
	
		vacancy=vacancy-count;
		System.out.println("vacancy"+vacancy);
		query="update screen set vacancy="+vacancy+" where screenno="+screenNO+" and moid='"+movID+"' and screen_sid"
				+ "="+schID;
		System.out.println(query);
		result=dbHandler.executeDML(query);
		query=null;//to deallocate the string variable	
		if(result==0){
			dbHandler.closeConn();
			return 0;
		}
		else{
			dbHandler.closeConn();
			return ticket;
		}
	}

	public int registerUser(users user){			
			DBHandler dbHandler=new DBHandler();
			int id=generateUserID();
			user.setUserID(id);
			String query="insert into users values('"+user.getFirstName()+"','"+user.getMname()
					+"','"+user.getLastName()+"','"+user.getUserID()+"',to_date('"+user.getDob()
					+"','dd-mm-yyyy'),'"+user.getEmail()+"','"+user.getPassword()+"',"+user.getMobileNo()+")";
			System.out.println(query);
			int result=dbHandler.executeDML(query);
			query=null;//to deallocate the string variable
			query="insert into USER_LOGIN values("+user.getUserID()+",'"+user.getPassword()
			+"')";
			System.out.println(query);
			result=dbHandler.executeDML(query);
			query=null;			
			if(result==0){
				dbHandler.closeConn();
				return 0;
			}
			else{
				dbHandler.closeConn();
				return id;
			}		
	}	
	
	public int payment(Payment payment,int ticketNum){			
		DBHandler dbHandler=new DBHandler();
		String query="select resvId from reservation where ticketnum="+ticketNum;
		System.out.println(query);
		int resvID=0;
		ResultSet resultSet=dbHandler.executeDRL(query);
		query=null;
		try{
			if(resultSet.next()){		
				resvID=resultSet.getInt(1);		
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		query="insert into payment values("+payment.getCardNo()+","+payment.getSecCode()
				+",'"+payment.getName()+"','"+payment.getCardtype()+"',to_date('"+payment.getExpdate()
				+"','dd-mm-yyyy'),"+resvID+")";
		System.out.println(query);
		int result=dbHandler.executeDML(query);
		query=null;//to deallocate the string variable
		
		if(result==0){
			dbHandler.closeConn();
			return 0;
		}
		else{
			dbHandler.closeConn();
			return result;
		}		
	}
		
	public int generateUserID(){
	
		DBHandler dbHandler=new DBHandler();
		int id=0;
		//int userID=new String();
		try
		{
			String query="select USERID_SEQ.nextval from dual";
			ResultSet resultSet=dbHandler.executeDRL(query);
			query=null;
			if(resultSet.next()){
					id=resultSet.getInt(1);				
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		dbHandler.closeConn();
		return id;
	}		
	
	public int generateResvID(){		
			DBHandler dbHandler=new DBHandler();
			int resvID=0;
			try
			{
				String query="select RESVID_SEQ.nextval from dual";
				ResultSet resultSet=dbHandler.executeDRL(query);
				query=null;
				if(resultSet.next()){
					resvID=resultSet.getInt(1);					
				}
			}
			catch (SQLException e){
				e.printStackTrace();
			}
			dbHandler.closeConn();
			return resvID;
	}	
	
	public int generateTicketNo(){		
		DBHandler dbHandler=new DBHandler();
		int ticket=0;
		try
		{
			String query="select TICKETID_SEQ.nextval from dual";
			ResultSet resultSet=dbHandler.executeDRL(query);
			query=null;
			if(resultSet.next()){
				ticket=resultSet.getInt(1);					
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		dbHandler.closeConn();
		return ticket;
	}	
	
	
	public Ticket fetchTicketDetails(int ticketID){			
		DBHandler db=new DBHandler();
		Ticket ticket=new Ticket();
		try{			
			String query="select * from ticket where ticketid="+ticketID;
			System.out.println(query);
			ResultSet resultSet=db.executeDRL(query);
			query=null;
			if(resultSet.next()){
				ticketID=resultSet.getInt(1);
				String mName=resultSet.getString(2);
				String time=resultSet.getString(3);
				int count= resultSet.getInt(4);
				int price = resultSet.getInt(5);
				
				ticket.setTicketID(ticketID);
				ticket.setMovieName(mName);
				ticket.setTime(time);
				ticket.setCount(count);
				ticket.setPrice(price);
				
				mName=null;time=null;
				db.closeConn();
				return ticket;
			}
			
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		db.closeConn();
		return null;
	}
	
	public int deleteTicket(int ticketID){		
		DBHandler db=new DBHandler();
		String query="select resvID,resv_mid,schID,resv_screenno from reservation where ticketnum="+ticketID;
		System.out.println(query);
		ResultSet resultSet=db.executeDRL(query);
		String mID=null;
		int scrNum=0,schID=0,resvID=0;
		query=null;
		try{
			if(resultSet.next()){
				resvID=resultSet.getInt(1);
				mID=resultSet.getString(2);	
				schID=resultSet.getInt(3);	
				scrNum=resultSet.getInt(4);	
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		
		query="select tcount from ticket where ticketid="+ticketID;
		System.out.println(query);
		resultSet=db.executeDRL(query);
		int count=0;
		query=null;
		try{
			if(resultSet.next()){
				count=resultSet.getInt(1);	
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}		
		
		query="delete from payment where rsvid="+resvID;
		System.out.println(query);
		db.executeDML(query);
		query=null;
		
		query="delete from reservation where ticketnum="+ticketID;
		System.out.println(query);
		db.executeDML(query);
		query=null;
		
		query="delete from ticket where ticketid="+ticketID;
		System.out.println(query);
		int delete_result=db.executeDML(query);
		query=null;
		int seat_occupied=0,vacancy=0;
		if(delete_result!=0){
			query="select seat_occupied from consists_of where scrno="+scrNum+" and mov_id='"+mID+"' "
					+ "and schdid="+schID;
			System.out.println(query);
			resultSet=db.executeDRL(query);
			query=null;
			try{
				if(resultSet.next()){		
						seat_occupied=resultSet.getInt(1);		
				}
			}
			catch (SQLException e)	{
				e.printStackTrace();
			}	
			seat_occupied=seat_occupied - count;
			System.out.println("seat_occupied"+seat_occupied);
			query="update consists_of set seat_occupied= "+seat_occupied+" where scrno="+scrNum+" and "
					+ "mov_id='"+mID+"' and schdid="+schID;
			System.out.println(query);
			db.executeDML(query);
			query=null;//to deallocate the string variable
			query="select vacancy from screen where screenno="+scrNum+" and moid='"+mID+"' and screen_sid="
					+schID;
			System.out.println(query);
			resultSet=db.executeDRL(query);
			query=null;
			try{
				if(resultSet.next()){
						vacancy=resultSet.getInt(1);		
				}
			}
			catch (SQLException e){
				e.printStackTrace();
			}
			vacancy=vacancy + count;
			System.out.println("vacancy"+vacancy);
			query="update screen set vacancy="+vacancy+" where screenno="+scrNum+" and moid='"+mID+"' "
					+ "and screen_sid="+schID;
			System.out.println(query);
			db.executeDML(query);
			query=null;//to deallocate the string variable	=
		}
		db.closeConn();
		return delete_result;		
	}	

}
