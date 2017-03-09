package edu.university.model;

/*
**************************************************************************************************************
*																											 *
* Project name: University Website																		     *																											 
* Module: Administration management 		                                                                 *                                                                                                                                                                                
* File name: Student.java                                                                           	 	 *
*                                                                                                            *
* Purpose: This class defines all the attributes that are required for a student and implements it's getter  *
* and setter methods					 		 *                                                           *                                               
* Technologies used: java                                                                          			 *
* @author  Greeshma																							 *
* @since   09-06-2015 																						 *
* @version 1.0																								 *
*                                                  															 *                                                                                                                                                                                                                                                                        
**************************************************************************************************************
*/

public class Student {
	
	private String studentID;
	private String firstName;
	private String lastName;
	private String branch;
	private String doj;
	private String address;
	private String city;
	private String nationality;
	private Long mobileNo;

	/**
	 * @param studentID
	 * @param firstName
	 * @param lastName
	 * @param branch
	 * @param doj
	 * @param address
	 * @param city
	 * @param nationality
	 * @param mobileNo
	 */
	public Student(String firstName, String lastName,
			String branch, String doj, String address, String city,
			String nationality, Long mobileNo) {
		super();
		
		this.firstName = firstName;
		this.lastName = lastName;
		this.branch = branch;
		this.doj = doj;
		this.address = address;
		this.city = city;
		this.nationality = nationality;
		this.mobileNo = mobileNo;
	}
	
	public Student(){
		super();		
	}

	/**
	 * @return the studentID
	 */
	public String getStudentID() {
		return studentID;
	}

	/**
	 * @param studentID the studentID to set
	 */
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the branch
	 */
	public String getBranch() {
		return branch;
	}

	/**
	 * @param branch the branch to set
	 */
	public void setBranch(String branch) {
		this.branch = branch;
	}

	/**
	 * @return the doj
	 */
	public String getDoj() {
		return doj;
	}

	/**
	 * @param doj the doj to set
	 */
	public void setDoj(String doj) {
		this.doj = doj;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * @return the nationality
	 */
	public String getNationality() {
		return nationality;
	}

	/**
	 * @param nationality the nationality to set
	 */
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	/**
	 * @return the mobileNo
	 */
	public Long getMobileNo() {
		return mobileNo;
	}

	/**
	 * @param mobileNo the mobileNo to set
	 */
	public void setMobileNo(Long mobileNo) {
		this.mobileNo = mobileNo;
	}

	
	
}
