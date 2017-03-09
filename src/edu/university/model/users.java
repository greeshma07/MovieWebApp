package edu.university.model;

public class users {

	private int userID;
	private String firstName;
	private String mname; 
	private String lastName;
	private String email;
	private String dob;
	private Long mobileNo;
	private String password;
	public users(String firstName, String mname, String lastName, String email,String password, String dob,Long mobileNo) {
		super();
		this.firstName = firstName;
		this.mname = mname;
		this.lastName = lastName;
		this.email = email;
		this.dob = dob;
		this.password = password;
		this.mobileNo = mobileNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public users(){
		super();		
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public Long getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(Long mobileNo) {
		this.mobileNo = mobileNo;
	}
	
	
}
