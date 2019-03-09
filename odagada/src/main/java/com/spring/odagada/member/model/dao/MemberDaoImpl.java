package com.spring.odagada.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.odagada.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public Map<String, String> login(Map<String, String> login) {
		// TODO Auto-generated method stub
		return session.selectOne("member.login", login);
	}

	@Override
	public Member selectMember(String memberId) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMember", memberId);
	}

	@Override
	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.insertMember", m);
	}

	@Override
	public int checkId(String memberId) {
		// TODO Auto-generated method stub
		return session.selectOne("member.checkId", memberId);
	}

	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.updateMember", m);
	}

	@Override
	public Map<String, String> checkEmail(String email) {
		// TODO Auto-generated method stub
		return session.selectOne("member.checkEmail", email);
	}	
}
