package com.spring.odagada.community.model.vo;

import java.sql.Date;

public class MessageVo {
	
	private String roomId;
	private String receiver;
	private String sender;
	private Date cDate;
	private String cContent;
	private String isRead;
	private String memberId;
	private String memberName;
	private String profileImageOri;
	private String profileImage;
	
	public MessageVo() {}
	
	public MessageVo(String roomId, String receiver, String sender, Date cDate, String cContent, String isRead) {
		this.roomId = roomId;
		this.receiver = receiver;
		this.sender = sender;
		this.cDate = cDate;
		this.cContent = cContent;
		this.isRead = isRead;
	}
	
	public MessageVo(String roomId, String receiver, String sender, Date cDate, String cContent, String isRead,
			String memberId, String memberName, String profileImageOri, String profileImage) {
		this.roomId = roomId;
		this.receiver = receiver;
		this.sender = sender;
		this.cDate = cDate;
		this.cContent = cContent;
		this.isRead = isRead;
		this.memberId = memberId;
		this.memberName = memberName;
		this.profileImageOri = profileImageOri;
		this.profileImage = profileImage;
	}

	public String getIsRead() {
		return isRead;
	}

	public void setIsRead(String isRead) {
		this.isRead = isRead;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getProfileImageOri() {
		return profileImageOri;
	}
	
	@Override
	public String toString() {
		return "MessageVo [roomId=" + roomId + ", receiver=" + receiver + ", sender=" + sender + ", cDate=" + cDate
				+ ", cContent=" + cContent + ", isRead=" + isRead + ", memberId=" + memberId + ", memberName="
				+ memberName + ", profileImageOri=" + profileImageOri + ", profileImage=" + profileImage + "]";
	}

	public void setProfileImageOri(String profileImageOri) {
		this.profileImageOri = profileImageOri;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}



	

	
	
}
