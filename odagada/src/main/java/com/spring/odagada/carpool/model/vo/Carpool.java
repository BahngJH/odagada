package com.spring.odagada.carpool.model.vo;

import java.sql.Date;

public class Carpool {
	private int memberNum;
	private int carpoolNum;
	private int startLong;
	private int startLat;
	private int destLong;
	private int destLat;
	private int pay;
	private Date startDate;
	private String startCity;
	private String endCity;
	
	public Carpool() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Carpool(int startLong, int startlat, int destLong, int destLat, Date startDate, String startCity,
			String endCity) {
		super();
		this.startLong = startLong;
		this.startLat = startlat;
		this.destLong = destLong;
		this.destLat = destLat;
		this.startDate = startDate;
		this.startCity = startCity;
		this.endCity = endCity;
	}



	public Carpool(int memberNum, int carpoolNum, int startLong, int startlat, int destLong, int destLat, int pay,
			Date startDate, String startCity, String endCity) {
		super();
		this.memberNum = memberNum;
		this.carpoolNum = carpoolNum;
		this.startLong = startLong;
		this.startLat = startlat;
		this.destLong = destLong;
		this.destLat = destLat;
		this.pay = pay;
		this.startDate = startDate;
		this.startCity = startCity;
		this.endCity = endCity;
	}



	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getCarpoolNum() {
		return carpoolNum;
	}

	public void setCarpoolNum(int carpoolNum) {
		this.carpoolNum = carpoolNum;
	}

	public int getStartLong() {
		return startLong;
	}

	public void setStartLong(int startLong) {
		this.startLong = startLong;
	}

	public int getStartlat() {
		return startLat;
	}

	public void setStartlat(int startlat) {
		this.startLat = startlat;
	}

	public int getDestLong() {
		return destLong;
	}

	public void setDestLong(int destLong) {
		this.destLong = destLong;
	}

	public int getDestLat() {
		return destLat;
	}

	public void setDestLat(int destLat) {
		this.destLat = destLat;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public String getStartCity() {
		return startCity;
	}

	public void setStartCity(String startCity) {
		this.startCity = startCity;
	}

	public String getEndCity() {
		return endCity;
	}

	public void setEndCity(String endCity) {
		this.endCity = endCity;
	}

	@Override
	public String toString() {
		return "Carpool [memberNum=" + memberNum + ", carpoolNum=" + carpoolNum + ", startLong=" + startLong
				+ ", startlat=" + startLat + ", destLong=" + destLong + ", destLat=" + destLat + ", pay=" + pay
				+ ", startDate=" + startDate + ", startCity=" + startCity + ", endCity=" + endCity + "]";
	}
	
	
}
