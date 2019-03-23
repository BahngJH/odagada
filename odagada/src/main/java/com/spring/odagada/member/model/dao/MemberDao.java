package com.spring.odagada.member.model.dao;

import java.util.List;
import java.util.Map;

import com.spring.odagada.member.model.vo.Member;

public interface MemberDao {
	Member kakaoIdCK(Member m);
	Map<String, String>login(Map<String, String> login);
	Member selectMember(String memberId);
	int checkId(String memberId);
	int updateMember(Member m);
	int checkEmail(String email);
	void insertMember(Member m) throws Exception;//회원가입	
	void createAuthKey(String email, String mailCode) throws Exception;//가입 메일 인증키생성
	int updateStatus(Map<String, String>map);//이메일 인증상태 업데이트
	int deleteMember(int memberNum);//회원 삭제	
	Map<String, String>findId(Map findId);//아이디 찾기	 
	Map<String,String>findPw(Map info);//패스워드 찾기	 
	void updateTempPw(Map info);//임시비밀번호로 업데이트
	int updatePhoneCode(Member m);
	String getPhoneCode(int memberNum);
	int updateYPhoneStatus(int memberNum);	
	int checkPhone(String phone);//핸드폰 중복체크
	int updatePassword(Member m);//비밀번호 변경
	void updateEmailCode(String mailCode, String memberId)throws Exception;//이메일 인증 코드 업데이트
	int updatePhone(Member m);//핸드폰 번호 변경
	int updateName(Member m);//이름 변경
	int updateMsg(Member m);//메세지 등록
	int deleteMsg(Member m);//메세지 삭제
}
