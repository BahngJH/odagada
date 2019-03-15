package com.spring.odagada.member.model.dao;

import java.util.List;
import java.util.Map;

import com.spring.odagada.member.model.vo.Member;

public interface MemberDao {
	Map<String, String>login(Map<String, String> login);
	Member selectMember(String memberId);
/*	int insertMember(Member m);*/
	int checkId(String memberId);
	int updateMember(Member m);
	int checkEmail(String email);
	
	//회원가입
	void insertMember(Member m) throws Exception;
	
	//인증키생성
	void createAuthKey(String email, String mailCode) throws Exception;
	
	//이메일 인증상태 업데이트
	int updateStatus(Map<String, String>map);
	
	//회원 삭제
	int deleteMember(int memberNum);
	
	//아이디 찾기
	 Map<String, String>findId(Map findId);
	 
	 //패스워드 찾기
	 Map<String,String>findPw(Map info);
	 
	 //임시비밀번호로 업데이트
	 void updateTempPw(Map info);
	int updatePhoneCode(Member m);
	String getPhoneCode(int memberNum);
	int updateYPhoneStatus(int memberNum);
	//핸드폰 중복체크
	int checkPhone(String phone);
	
}
