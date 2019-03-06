package com.spring.odagada.driver.model.vo;

public class Driver {
	private int memberNum;
	private String licenseNum;
	private String carModel;
	private String carNum;
	private String driverStatus;
	
	public Driver() {
		// TODO Auto-generated constructor stub
	}

	public Driver(int memberNum, String licenseNum, String carModel, String carNum, String driverStatus) {
		super();
		this.memberNum = memberNum;
		this.licenseNum = licenseNum;
		this.carModel = carModel;
		this.carNum = carNum;
		this.driverStatus = driverStatus;
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

	@Override
	public String toString() {
		return "Driver [memberNum=" + memberNum + ", licenseNum=" + licenseNum + ", carModel=" + carModel + ", carNum="
				+ carNum + ", driverStatus=" + driverStatus + "]";
	}
	
	
}
