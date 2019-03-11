package com.spring.odagada.community.model.vo;

import java.sql.Date;

public class Notify {

   private int notifyNum;
   private int nonnotifyNum;
   private String nContent;
   private Date nDate;
   private Date nPunish;
   
   public Notify() {}

public Notify(int notifyNum, int nonnotifyNum, String nContent, Date nDate, Date nPunish) {
	super();
	this.notifyNum = notifyNum;
	this.nonnotifyNum = nonnotifyNum;
	this.nContent = nContent;
	this.nDate = nDate;
	this.nPunish = nPunish;
}

public int getNotifyNum() {
	return notifyNum;
}

public void setNotifyNum(int notifyNum) {
	this.notifyNum = notifyNum;
}

public int getNonnotifyNum() {
	return nonnotifyNum;
}

public void setNonnotifyNum(int nonnotifyNum) {
	this.nonnotifyNum = nonnotifyNum;
}

public String getnContent() {
	return nContent;
}

public void setnContent(String nContent) {
	this.nContent = nContent;
}

public Date getnDate() {
	return nDate;
}

public void setnDate(Date nDate) {
	this.nDate = nDate;
}

public Date getnPunish() {
	return nPunish;
}

public void setnPunish(Date nPunish) {
	this.nPunish = nPunish;
}

@Override
public String toString() {
	return "Notify [notifyNum=" + notifyNum + ", nonnotifyNum=" + nonnotifyNum + ", nContent=" + nContent + ", nDate="
			+ nDate + ", nPunish=" + nPunish + "]";
}
   
   
  }