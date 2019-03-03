package com.spring.odagada.member.model.vo;

import java.io.Serializable;

public class Member implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String memberId;
	private String memberPw;
	private String memberName;
	private String birth;
	private String phone;
	private String email;
	private char gender;
	private String profileImageOri;
	private String profileImageRe;


	public Member() {
		super();
	}

	public Member(String memberId, String memberPw, String memberName, String birth, String phone, String email,
			char gender, String profileImageOri, String profileImageRe) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.profileImageOri = profileImageOri;
		this.profileImageRe = profileImageRe;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getProfileImageOri() {
		return profileImageOri;
	}

	public void setProfileImageOri(String profileImageOri) {
		this.profileImageOri = profileImageOri;
	}

	public String getProfileImageRe() {
		return profileImageRe;
	}

	public void setProfileImageRe(String profileImageRe) {
		this.profileImageRe = profileImageRe;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName + ", birth="
				+ birth + ", phone=" + phone + ", email=" + email + ", gender=" + gender + ", profileImageOri="
				+ profileImageOri + ", profileImageRe=" + profileImageRe + "]";
	}

	

}
