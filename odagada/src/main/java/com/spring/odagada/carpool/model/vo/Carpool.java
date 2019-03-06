package com.spring.odagada.carpool.model.vo;

public class Carpool {
	private int memberNum;
	private int carpoolNum;
	private double startLong;
	private double startLat;
	private double destLong;
	private double destLat;
	private int pay;
	private String startDate;
	private String startCity;
	private String endCity;
	private String startDetail;
	private String endDetail;
	
	public Carpool() {
		// TODO Auto-generated constructor stub
	}
	
	public Carpool(int memberNum, int carpoolNum, double startLong, double startLat, double destLong, double destLat,
			int pay, String startDate, String startCity, String endCity, String startDetail, String endDetail) {
		super();
		this.memberNum = memberNum;
		this.carpoolNum = carpoolNum;
		this.startLong = startLong;
		this.startLat = startLat;
		this.destLong = destLong;
		this.destLat = destLat;
		this.pay = pay;
		this.startDate = startDate;
		this.startCity = startCity;
		this.endCity = endCity;
		this.startDetail = startDetail;
		this.endDetail = endDetail;
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

	public double getStartLong() {
		return startLong;
	}

	public void setStartLong(double startLong) {
		this.startLong = startLong;
	}

	public double getStartLat() {
		return startLat;
	}

	public void setStartLat(double startLat) {
		this.startLat = startLat;
	}

	public double getDestLong() {
		return destLong;
	}

	public void setDestLong(double destLong) {
		this.destLong = destLong;
	}

	public double getDestLat() {
		return destLat;
	}

	public void setDestLat(double destLat) {
		this.destLat = destLat;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
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

	public String getStartDetail() {
		return startDetail;
	}

	public void setStartDetail(String startDetail) {
		this.startDetail = startDetail;
	}

	public String getEndDetail() {
		return endDetail;
	}

	public void setEndDetail(String endDetail) {
		this.endDetail = endDetail;
	}

	@Override
	public String toString() {
		return "Carpool [memberNum=" + memberNum + ", carpoolNum=" + carpoolNum + ", startLong=" + startLong
				+ ", startLat=" + startLat + ", destLong=" + destLong + ", destLat=" + destLat + ", pay=" + pay
				+ ", startDate=" + startDate + ", startCity=" + startCity + ", endCity=" + endCity + ", startDetail="
				+ startDetail + ", endDetail=" + endDetail + "]";
	}
	
}
