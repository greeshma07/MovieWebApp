package edu.university.model;

public class Payment {
	
	int cardNo;
	int secCode;
	String name;
	String cardtype;
	String expdate;
	public Payment(int cardNo, int secCode, String name, String cardtype, String expdate) {
		super();
		this.cardNo = cardNo;
		this.secCode = secCode;
		this.name = name;
		this.cardtype = cardtype;
		this.expdate = expdate;
	}
	public int getCardNo() {
		return cardNo;
	}
	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}
	public int getSecCode() {
		return secCode;
	}
	public void setSecCode(int secCode) {
		this.secCode = secCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCardtype() {
		return cardtype;
	}
	public void setCardtype(String cardtype) {
		this.cardtype = cardtype;
	}
	public String getExpdate() {
		return expdate;
	}
	public void setExpdate(String expdate) {
		this.expdate = expdate;
	}
	
	

}
