package com.spring.odagada.driver.model.vo;

import java.util.Date;

public class Driver {
	private int memberNum;
	private String licenseNum;
	private String carModel;
	private String carNum;
	private String driverStatus;
	private String introduce;
	private int money;
	private Date enrolldate;
	
	public Driver() {
		super();
	}

	public Driver(int memberNum, String licenseNum, String carModel, String carNum, String driverStatus,
			String introduce, int money, Date enrolldate) {
		super();
		this.memberNum = memberNum;
		this.licenseNum = licenseNum;
		this.carModel = carModel;
		this.carNum = carNum;
		this.driverStatus = driverStatus;
		this.introduce = introduce;
		this.money = money;
		this.enrolldate = enrolldate;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getLicenseNum() {
		return licenseNum;
	}

	public void setLicenseNum(String licenseNum) {
		this.licenseNum = licenseNum;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}

	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public String getDriverStatus() {
		return driverStatus;
	}

	public void setDriverStatus(String driverStatus) {
		this.driverStatus = driverStatus;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	@Override
	public String toString() {
		return "Driver [memberNum=" + memberNum + ", licenseNum=" + licenseNum + ", carModel=" + carModel + ", carNum="
				+ carNum + ", driverStatus=" + driverStatus + ", introduce=" + introduce + ", money=" + money
				+ ", enrolldate=" + enrolldate + "]";
	}
	
}
