package edu.university.database;

import java.sql.*;

/*
**************************************************************************************************************
*																											 *
* Project name: University Website																		     *																											 
* Module: Administration management 		                                                                 *                                                                                                                                                                                
* File name: DBHandler.java                                                                           	 	 *
*                                                                                                            *
* Purpose: This class implements the functions to create a connection to the oracle database,execute the DRL 
* and DML commands and then closes the database connection.      											 *                                                                                                          
* Technologies used: java,oracle                                                                          	 *
* @author  Greeshma																							 *
* @since   09-06-2015 																						 *
* @version 1.0																								 *
*                                                  															 *                                                                                                                                                                                                                                                                        
**************************************************************************************************************
*/

public class DBHandler {

	Connection connection;
	Statement statement;	
	
	/**
	   * This constructor method is used to obtain the oracle database connection by defining the driver class 
	   * and passing the URL,userName and password through the getConnection() method.
	   * @param null.
	   *  
	*/
	public DBHandler(){		
		try {
			//driver class for the oracle database
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {			
			e.printStackTrace();
		}
		try {
			/*create the connection object by passing the connection URL,userName and password.
			localhost is the server name on which oracle is running
			UserName: The default userName for the oracle database is system.
			Password: Password is given by the user at the time of installing the oracle database*/

			connection= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin08");
		} catch (SQLException e) {			
			e.printStackTrace();
		}
	}
	
	/**
	   * This method is used to execute the DML commands.
	   * @param query.
	   * @return int -returns 1 if query execution is success otherwise returns 0  
	*/	
	public int executeDML(String query){
		
		try {
			//create the statement object
			statement=connection.createStatement();
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		try {
			return (statement.executeUpdate(query));
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		return 0;
	}
	
	/**
	   * This method is used to execute the DRL commands.
	   * @param query.
	   * @return ResultSet  
	*/
	
	public ResultSet executeDRL(String query){
		try {			
			statement=connection.createStatement();			
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		try {
			ResultSet resultSet=statement.executeQuery(query);			
			return(resultSet);
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		return null;
	}
	
	public void closeConn(){		
		try {
			statement.close(); // close the statement object  
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		try {
			connection.close(); //close the connection object
		} catch (SQLException e) {			
			e.printStackTrace();
		}		
	}
}
