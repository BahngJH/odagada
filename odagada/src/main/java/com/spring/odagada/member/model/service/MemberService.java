package com.spring.odagada.member.model.service;

import java.util.List;
import java.util.Map;

import com.spring.odagada.member.model.vo.Member;

public interface MemberService {
	Map<String, String>login(Map<String, String> login);
	Member selectMember(String memberId);
	void insertMember(Member m) throws Exception;
	int checkEmail(String email);	
	int checkId(String memberId);
	int updateMember(Member m);	
	int updateStatus(Map<String, String>map);
	int deleteMember(int memberNum);	
    Map<String, String> findId(Map findId);  //아이디 찾기
	int updatePhoneCode(Member m);
	String getPhoneCode(int memberNum);
	int updateYPhoneStatus(int memberNum); 
	Map<String,String>findPw(Map info); //패스워드 찾기 
	void sendPw(Map info)throws Exception;//임시 비밀번호 발급	 
	void mailAuth(Member m)throws Exception;//메일 인증	
	int checkPhone(String phone); //핸드폰 중복확인
	int updatePassword(Member m);//비밀번호 변경
	void mailUpdate(Member m)throws Exception;//이메일 변경 인증 코드
	 
}
