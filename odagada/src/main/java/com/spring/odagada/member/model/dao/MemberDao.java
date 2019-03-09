package com.spring.odagada.member.model.dao;

import java.util.Map;

import com.spring.odagada.member.model.vo.Member;

public interface MemberDao {
	Map<String, String>login(Map<String, String> login);
	Member selectMember(String memberId);
	int insertMember(Member m);
	int checkId(String memberId);
	int updateMember(Member m);

}
