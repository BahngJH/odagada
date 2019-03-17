package com.spring.odagada.member.model.dao;

import java.util.List;
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
	public int checkId(String memberId) {
		// TODO Auto-generated method stub
		return session.selectOne("member.checkId", memberId);
	}
	
	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.updateMember", m);
	}
	
	//이메일 중복확인
	@Override
	public int checkEmail(String email) {
		// TODO Auto-generated method stub
		return session.selectOne("member.checkEmail", email);
	}	
	
	//1. 회원가입
	@Override
	public void insertMember(Member m) throws Exception {
		// TODO Auto-generated method stub
		session.insert("member.insertMember", m);
	}

    //2. 해당 email에 인증 키 생성 후 업데이트
    @Override
    public void createAuthKey(String email, String mailCode) throws Exception {
        Member m = new Member();
        m.setMailCode(mailCode);
        m.setEmail(email);
        session.update("member.updateCode", m);
    }
    //3. 이메일 인증 코드 확인
    /* @Override
    public Member chkAuth(Member m) throws Exception {
        return session.selectOne("member.chkCode", m);
    }*/

    
 /*   //4. 인증 후 계정 활성화
    @Override
    public void updateEmailStatus(Member m) throws Exception {
        session.update("member.authStatus", m.getIsEmailAuth());
        System.out.println(m.getIsEmailAuth());
    }*/


    //E-mail status 변환
	@Override
	public int updateStatus(Map<String, String>map) {
		// TODO Auto-generated method stub
		return session.update("member.mailStatus", map);
	}

	//회원삭제
	@Override
	public int deleteMember(int memberNum) {
		return session.delete("member.memberDelete",memberNum);
	}

	@Override
	public Map<String, String> findId(Map findId) {
		// TODO Auto-generated method stub
		return session.selectOne("member.findId", findId);
	}

	@Override
	public Map<String, String> findPw(Map info) {
		// TODO Auto-generated method stub
		return session.selectOne("member.findPw", info);
	}

	//임시 비밀번호 발급
	@Override
	public void updateTempPw(Map info) {
		session.update("member.tempPassword", info);
	}
	public int updatePhoneCode(Member m) {
		return session.update("member.updatePhoneCode", m);
	}

	@Override
	public String getPhoneCode(int memberNum) {
		return session.selectOne("member.selectPhoneCode", memberNum);
	}

	@Override
	public int updateYPhoneStatus(int memberNum) {
		return session.update("member.updateYPhoneStatus", memberNum);
	}

	//핸드폰 중복체크
	@Override
	public int checkPhone(String phone) {
		return session.selectOne("member.checkPhone", phone);
	}
	//비밀번호 변경
	@Override
	public int updatePassword(Member m) {
		return session.update("member.updatePassword", m);
	}
	//메일코드 업데이트	
	@Override
	public void updateEmailCode(String mailCode, String memberId) {
		Member m = new Member();
        m.setMailCode(mailCode);
        m.setMemberId(memberId);
        session.update("member.updateMailCode",m);
	}
}
