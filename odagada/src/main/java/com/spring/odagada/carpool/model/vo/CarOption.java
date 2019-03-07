package com.spring.odagada.carpool.model.vo;

public class CarOption {
	private int carpoolNum;
	private String animal;
	private String smoking;
	private String teenage;
	private String talking;
	private String music;
	private String food;
	private String baggage;
	private String gender;
	private int seatcount;
	
	public CarOption() {
		// TODO Auto-generated constructor stub
	}

	public int getCarpoolNum() {
		return carpoolNum;
	}

	public void setCarpoolNum(int carpoolNum) {
		this.carpoolNum = carpoolNum;
	}

	public String getAnimal() {
		return animal;
	}

	public void setAnimal(String animal) {
		this.animal = animal;
	}

	public String getSmoking() {
		return smoking;
	}

	public void setSmoking(String smoking) {
		this.smoking = smoking;
	}

	public String getTeenage() {
		return teenage;
	}

	public void setTeenage(String teenage) {
		this.teenage = teenage;
	}

	public String getTalking() {
		return talking;
	}

	public void setTalking(String talking) {
		this.talking = talking;
	}

	public String getMusic() {
		return music;
	}

	public void setMusic(String music) {
		this.music = music;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public String getBaggage() {
		return baggage;
	}

	public void setBaggage(String baggage) {
		this.baggage = baggage;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getSeatcount() {
		return seatcount;
	}

	public void setSeatcount(int seatcount) {
		this.seatcount = seatcount;
	}

	@Override
	public String toString() {
		return "Option [carpoolNum=" + carpoolNum + ", animal=" + animal + ", smoking=" + smoking + ", teenage="
				+ teenage + ", talking=" + talking + ", music=" + music + ", food=" + food + ", baggage=" + baggage
				+ ", gender=" + gender + ", seatcount=" + seatcount + "]";
	}
}
