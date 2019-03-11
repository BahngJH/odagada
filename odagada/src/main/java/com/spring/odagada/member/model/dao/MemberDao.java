package com.spring.odagada.member.model.dao;

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
	void updateEmailStatus(Member m) throws Exception;
	
	/*Member chkAuth(Member m) throws Exception;
	
	void successAuth(Member authMember);
*/
}
