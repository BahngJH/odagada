package com.spring.odagada.member.model.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.odagada.member.model.dao.MemberDao;
import com.spring.odagada.member.model.vo.Member;
import com.spring.odagada.member.sendmail.MailHandler;
import com.spring.odagada.member.sendmail.TemKey;

@Service
public class MemberServiceImple implements MemberService {
	
	@Autowired
	MemberDao dao;	
	
    @Inject
    private JavaMailSender mailSender;

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

	/*@Override
	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		return dao.insertMember(m);
	}*/

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

	//이메일 중복확인
	@Override
	public int checkEmail(String email) {
		// TODO Auto-generated method stub
		return dao.checkEmail(email);
	}
	
   @Transactional
   @Override
    public void insertMember(Member m) throws Exception {	
        System.out.println("서비스레지스");
        dao.insertMember(m);//회원가입 
            
        // 인증키 생성
        String key = new TemKey().getKey(50,false); 
        System.out.println(key);
        //인증키 db 저장        
        dao.createAuthKey(m.getEmail(),key);
        
        //메일 전송
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[odagada] 가입 인증 메일");
        sendMail.setText(
                new StringBuffer().append("<h1>메일인증</h1>")
                .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
                .append("<a href='http://localhost:9090/member/emailConfirm?memberId=")
                .append(m.getMemberId())
				.append("&email=")
				.append(m.getEmail())
				.append("&mailCode=").append(key)
				.append("' target='_blank'>이메일 인증 확인</a>").toString());
        sendMail.setFrom("burny9057@gmail.com", "[odagada]");
        sendMail.setTo(m.getEmail());
        sendMail.send();
    }

/*	    //이메일 인증 키 검증
	    @Override
	    public Member updateEmailStatus(Member m) throws Exception {
	        Member authMember =new Member();
	        System.out.println(m+"뉴비의 결말은?");
	        
	        authMember=dao.chkAuth(m);
	   
	        if(authMember!=null){
	            try{
	                System.out.println(authMember+"authMember");
	                dao.updateEmailStatus(m);
	                dao.successAuth(authMember);
	            }catch (Exception e) {
	                e.printStackTrace();
	            }}
	        return authMember;
	    }*/



		
		
		
		
		
		
		
		
		
		
		
		


}
