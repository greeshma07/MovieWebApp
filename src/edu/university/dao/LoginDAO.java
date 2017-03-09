package edu.university.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import edu.university.database.DBHandler;
import edu.university.model.UserLogin;

/*
**************************************************************************************************************
*																											 *
* Project name: University Website																		     *																											 
* Module: Administration management 		                                                                 *                                                                                                                                                                                
* File name: LoginDAO.java                                                                           	 	 *
*                                                                                                            *
* Purpose: Read the attributes from the University.java class and process it with the oracle database and 
* gives back the result to the utility class.       											 			 *                                                                                                          
* Technologies used: java,oracle                                                                             *
* Files Referred :  UserLogin.java,University.java  
* @author  Greeshma																							 *
* @since   09-06-2015 																						 *
* @version 1.0																								 *
*                                                  															 *                                                                                                                                                                 *                                                                                                        
**************************************************************************************************************
*/

public class LoginDAO 
{
	
	   /**
	   * This method is used to validate the user login credentials with the database entries
	   * @param1 userId 
	   * @param2 pwd  
	   * @return Object - returns the userLogin Object.
	   */
		public Object validateUserLogin(String userId,String pwd){
			
			UserLogin userLogin=null;			
			try{
			
				DBHandler db=new DBHandler();
				String query="Select * from USER_LOGIN where user_Id='"+userId+"' and password='"+pwd+"'";
				System.out.println(query);
				ResultSet resultSet=null;
				resultSet=db.executeDRL(query);	
				query=null; //to deallocate the string variable
				if(resultSet.next())
				{
					String uId=resultSet.getString(1);
					String password=resultSet.getString(2);					
					userLogin=new UserLogin(uId, password);	
					uId=null;password=null;
				}
				
				return userLogin;			
			
			}
			catch (SQLException e){
				e.printStackTrace();
				return null;
			}
			catch (NullPointerException e){
				return null;
			}
		}		
}
