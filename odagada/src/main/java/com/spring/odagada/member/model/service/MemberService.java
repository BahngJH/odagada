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
	Member updateEmailStatus(Member m) throws Exception;

}
