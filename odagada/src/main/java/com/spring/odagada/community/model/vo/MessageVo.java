package com.spring.odagada.community.model.vo;

import java.sql.Date;

public class MessageVo {
	
	private String roomId;
	private String receiver;
	private String sender;
	private Date cDate;
	private String cContent;
	
	public MessageVo() {}
	
	public MessageVo(String roomId, String receiver, String sender, Date cDate, String cContent) {
		this.roomId = roomId;
		this.receiver = receiver;
		this.sender = sender;
		this.cDate = cDate;
		this.cContent = cContent;
	}
	public MessageVo(String roomId, String receiver, String sender, String cContent) {
		this.roomId = roomId;
		this.receiver = receiver;
		this.sender = sender;
		this.cContent = cContent;
	}
	
	
	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	@Override
	public String toString() {
		return "MessageVo [roomId=" + roomId + ", receiver=" + receiver + ", sender=" + sender + ", cDate=" + cDate
				+ ", cContent=" + cContent + "]";
	}

	
	
}
