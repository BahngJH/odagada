package com.spring.odagada.member.model.service;

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
	
	 //아이디 찾기
	 Map<String, String> findId(Map findId);
	 //패스워드 찾기
	 Map<String,String>findPw(Map info);
	 //임시 비밀번호 발급
	/* void sendPw(Map info)throws Exception;*/
}
