package edu.university.model;

public class Schedule {
	int scheduleID;
	String scheduleTime;
	public Schedule(int scheduleID, String scheduleTime) {
		super();
		this.scheduleID = scheduleID;
		this.scheduleTime = scheduleTime;
	}
	public Schedule(){
		super();		
	}
	public int getScheduleID() {
		return scheduleID;
	}
	public void setScheduleID(int scheduleID) {
		this.scheduleID = scheduleID;
	}
	public String getScheduleTime() {
		return scheduleTime;
	}
	public void setScheduleTime(String scheduleTime) {
		this.scheduleTime = scheduleTime;
	}
	
	

}
