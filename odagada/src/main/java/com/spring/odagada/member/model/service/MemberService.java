package com.spring.odagada.member.model.service;

import java.util.List;
import java.util.Map;

import com.spring.odagada.member.model.vo.Member;

public interface MemberService {
	Member kakaoIdCK(Member m);
	Map<String, String>login(Map<String, String> login);
	Member selectMember(String memberId);
	void insertMember(Member m, StringBuffer odagada) throws Exception;
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
	void sendPw(Map info, StringBuffer odagada)throws Exception;//임시 비밀번호 발급	 
	void mailAuth(Member m,StringBuffer odagada)throws Exception;//메일 인증	
	int checkPhone(String phone); //핸드폰 중복확인
	int updatePassword(Member m);//비밀번호 변경
	void mailUpdate(Member m, StringBuffer odagada)throws Exception;//이메일 변경 인증 코드
	int updatePhone(Member m);//핸드폰 번호 변경
	int updateName(Member m);//이름 변경
	int updateMsg(Member m);//메세지 등록
	int deleteMsg(Member m);//메세지 삭제
	void deleteLeaveMember(String leaveDate);//회원테이블에서 삭제
	 
}
