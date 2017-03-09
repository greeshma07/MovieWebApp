package edu.university.model;

public class Movie {
	private String movieID;
	private String movieName;
	private String description;
	private String language;
	private float duration;
	
	private char status;
	private float price;
	public Movie(String movieID, String movieName, String description, String language, float duration,
			char status, float price) {
		super();
		this.movieID = movieID;
		this.movieName = movieName;
		this.description = description;
		this.language = language;
		this.duration=duration;
		this.status = status;
		this.price = price;
	}
	public Movie(){
		super();		
	}
	public String getMovieID() {
		return movieID;
	}
	public void setMovieID(String movieID) {
		this.movieID = movieID;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public float getDuration() {
		return duration;
	}
	public void setDuration(float duration) {
		this.duration = duration;
	}
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
	

}
