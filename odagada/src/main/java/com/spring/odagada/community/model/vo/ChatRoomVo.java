package com.spring.odagada.community.model.vo;

import java.sql.Date;

public class ChatRoomVo {
	private String roomId;
	private String memberId;
	private String memberName;
	private String cDate;
	private String cContent;
	private String receiver;
	private int isReadCount;
	
	public ChatRoomVo() {}
	
	public ChatRoomVo(String roomId, String memberId, String memberName, String cDate, String cContent, int isReadCount, String receiver) {
		this.roomId = roomId;
		this.memberId = memberId;
		this.memberName = memberName;
		this.cDate = cDate;
		this.cContent = cContent;
		this.isReadCount = isReadCount;
		this.receiver = receiver;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
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

	public String getcDate() {
		return cDate;
	}

	public void setcDate(String cDate) {
		this.cDate = cDate;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	
	public int getIsReadCount() {
		return isReadCount;
	}

	public void setIsReadCount(int isReadCount) {
		this.isReadCount = isReadCount;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	@Override
	public String toString() {
		return "ChatRoomVo [roomId=" + roomId + ", memberId=" + memberId + ", memberName=" + memberName + ", cDate="
				+ cDate + ", cContent=" + cContent + ", receiver=" + receiver + ", isReadCount=" + isReadCount + "]";
	}

	

	
	
	
}
