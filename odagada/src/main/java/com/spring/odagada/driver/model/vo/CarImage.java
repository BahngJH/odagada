package com.spring.odagada.driver.model.vo;

public class CarImage {
	
	private String carImageOri;
	private String carImageRe;
	private String carNum;
	private int imageOrder;
	
	public CarImage() {
		super();
	}

	public CarImage(String carImageOri, String carImageRe, String carNum, int imageOrder) {
		super();
		this.carImageOri = carImageOri;
		this.carImageRe = carImageRe;
		this.carNum = carNum;
		this.imageOrder = imageOrder;
	}

	public String getCarImageOri() {
		return carImageOri;
	}

	public void setCarImageOri(String carImageOri) {
		this.carImageOri = carImageOri;
	}

	public String getCarImageRe() {
		return carImageRe;
	}

	public void setCarImageRe(String carImageRe) {
		this.carImageRe = carImageRe;
	}

	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public int getImageOrder() {
		return imageOrder;
	}

	public void setImageOrder(int imageOrder) {
		this.imageOrder = imageOrder;
	}

	@Override
	public String toString() {
		return "carImage [carImageOri=" + carImageOri + ", carImageRe=" + carImageRe + ", carNum=" + carNum
				+ ", imageOrder=" + imageOrder + "]";
	}

	
}
