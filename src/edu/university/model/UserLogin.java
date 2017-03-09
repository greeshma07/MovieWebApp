package edu.university.model;

/*
**************************************************************************************************************
*																											 *
* Project name: University Website																		     *																											 
* Module: Administration management 		                                                                 *                                                                                                                                                                                
* File name: UserLogin.java                                                                           	 	 *
*                                                                                                            *
* Purpose: This class defines all the attributes that are required for the user login and implements their 
* getter and setter methods.      											 		                         *                                                                                                          
* Technologies used: java                                                                          			 *
* @author  Greeshma																							 *
* @since   09-06-2015 																						 *
* @version 1.0																								 *
*                                                  															 *                                                                                                                                                                                                                                                                        
**************************************************************************************************************
*/

public class UserLogin
{
	private String userId;
	private String password;
	public UserLogin(String userId, String password) {
		super();
		this.userId = userId;
		this.password = password;
	}
	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}