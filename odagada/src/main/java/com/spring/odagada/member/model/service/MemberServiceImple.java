package com.spring.odagada.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.odagada.member.model.dao.MemberDao;
import com.spring.odagada.member.model.vo.Member;

@Service
public class MemberServiceImple implements MemberService {
	
	@Autowired
	MemberDao dao;

	@Override
	public Map<String, String> login(Map<String, String> login) {
		// TODO Auto-generated method stub
		return dao.login(login);
	}

	@Override
	public Member selectMember(String memberId) {
		// TODO Auto-generated method stub
		return dao.selectMember(memberId);
	}

	@Override
	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		return dao.insertMember(m);
	}

	@Override
	public int checkId(String memberId) {
		// TODO Auto-generated method stub
		return dao.checkId(memberId);
	}

	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return dao.updateMember(m);
	}

	@Override
	public Map<String, String> checkEmail(String email) {
		// TODO Auto-generated method stub
		return dao.checkEmail(email);
	}


}
