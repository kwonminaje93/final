package com.itbank.mvcproject;

public class ReservationDTO {

	private String uid;
	private String name;
	private String id;
	private String buyerName;
	private String tel;
	private int price;
	private String payDay;
	private String inDay;
	private String outDay;
	private char complete;
	private String hName;
	
	public String gethName() {
		return hName;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}
	public char getComplete() {
		return complete;
	}
	public void setComplete(char complete) {
		this.complete = complete;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPayDay() {
		return payDay;
	}
	public void setPayDay(String payDay) {
		this.payDay = payDay;
	}
	public String getInDay() {
		return inDay;
	}
	public void setInDay(String inDay) {
		this.inDay = inDay;
	}
	public String getOutDay() {
		return outDay;
	}
	public void setOutDay(String outDay) {
		this.outDay = outDay;
	}
	
}
