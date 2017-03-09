package edu.university.dao;

import java.util.ArrayList;

import edu.university.model.Movie;
import edu.university.model.Student;

/*
**************************************************************************************************************
*																											 *
* Project name: University Website																		     *																											 
* Module: Administration management 		                                                                 *                                                                                                                                                                                
* File name: StudentServiceProvider.java                                                                           	 	 
*                                                                                                            *
* Purpose: This interface class acts as a service provider to the StudentDAO class and defines all the methods
* used in the StudentDAO class.       											 			                 *                                                                                                          
* Technologies used: java                                                                             		 *
* Files Referred :  Student.java         													 				 *
* @author  Greeshma																							 *
* @since   09-06-2015 																						 *
* @version 1.0																								 *
*                                                  															 *                                                                                                        
**************************************************************************************************************
*/

public interface StudentServiceProvider 
{
	public ArrayList<Movie> fetchMovieRecord();
	
	public abstract Student registerStudent(Student student);
	public abstract String generateStudentID(String branch);
	public abstract ArrayList<String> fetchAllStudentsId();
	public abstract Student fetchStudentRecordByID(String studentID);
	public abstract ArrayList<Student>  fetchStudentRecordByCourseOrYear(String course, int year);
	public abstract ArrayList<Student> fetchAllStudentsRecord();
	public abstract Student updateStudent(String studentId,String branch,String address,String city,Long mobileNo);
	public abstract int deleteStudent(String studentId);
	
}
