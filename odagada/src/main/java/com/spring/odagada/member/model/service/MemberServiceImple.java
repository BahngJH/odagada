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
	public Map<String, String> checkBlack(String checkId) {
		// TODO Auto-generated method stub
		return dao.checkBlack(checkId);
	}

	@Override
	public Member kakaoIdCK(Member m) {
		// TODO Auto-generated method stub
		return dao.kakaoIdCK(m);
	}

	@Override
	public Map<String, String> login(Map<String, String> login) {
		return dao.login(login);
	}

	//멤버 정보 갖고오기 
	@Override
	public Member selectMember(String memberId) {
		return dao.selectMember(memberId);
	}

	//아이디 중복체크
	@Override
	public int checkId(String memberId) {	
		return dao.checkId(memberId);
	}

	//회원정보 수정
	@Override
	public int updateMember(Member m) {
		return dao.updateMember(m);
	}

	//이메일 중복확인
	@Override
	public int checkEmail(String email) {
		return dao.checkEmail(email);
	}
	
	//회원가입&회원가입 인증메일 전송(트랜잭션처리)
   @Transactional
   @Override
    public void insertMember(Member m, StringBuffer odagada) throws Exception {	
        System.out.println("서비스레지스, 메일 보내는 곳");
        dao.insertMember(m);//회원가입 
            
        // 인증키 생성
        String key = new TemKey().getKey(50,false); 
        //인증키 db 저장        
        dao.createAuthKey(m.getEmail(),key);
        String path=odagada.toString().split("member")[0];
        //path >> http://localhost:9090/odagada/
        
        //메일 전송
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[odagada] 가입 인증 메일");
        sendMail.setText(
                new StringBuffer().append("<h1>[odagada]메일인증</h1>")
                .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
                .append("<a href='"+path+"emailConfirm.do?memberId=")
                .append(m.getMemberId())
				.append("&email=")
				.append(m.getEmail())
				.append("&mailCode=").append(key)
				.append("' target='_blank'>이메일 인증 확인</a>").toString());
        sendMail.setFrom("burny9057@gmail.com", "[odagada]");
        sendMail.setTo(m.getEmail());
        sendMail.send();  

    }

   //메일 인증상태 업데이트
	@Override
	public int updateStatus(Map<String, String> map) {
		return dao.updateStatus(map);
	}

	@Override
	public int deleteMember(int memberNum) {
		return dao.deleteMember(memberNum);
	}

	@Override
	public Map<String, String> findId(Map findId) {
		// TODO Auto-generated method stub
		return dao.findId(findId);
	}

	@Override

	public Map<String, String> findPw(Map info) {
		// TODO Auto-generated method stub
		return dao.findPw(info);
	}

	//임시 비밀번호 발급
	@Override
	public void sendPw(Map info, StringBuffer odagada) throws Exception {
		     dao.updateTempPw(info);//임시 비밀번호로 업데이트.
		     
		     String path=odagada.toString().split("member")[0];
		     //만들어놓은 임시 비밀번호
		     String newPw=(String)info.get("sendPw");
		            	   
	        //메일 전송
	        MailHandler sendMail = new MailHandler(mailSender);
	        sendMail.setSubject("[odagada] 임시 비밀번호 발송");
	        sendMail.setText(
	                new StringBuffer().append("<h2>임시 비밀번호 안내입니다.</h2>")
	                .append("<h2>임시 비밀번호를 발송해드립니다.</h2>")
	                .append("<h2>임시 비밀번호는 "+newPw+"입니다</h2>")
	                .append("<a href='"+path+"member/loginForm2.do")
	                .append("' target='_blank'>로그인 하러가기</a>")
					.toString());
	        sendMail.setFrom("burny9057@gmail.com", "[odagada]");
	        sendMail.setTo((String)info.get("email"));
	        sendMail.send();     
	    }

	//메일 코드 만들어서 업데이트 시키기. 
	@Override
	public void mailAuth(Member m,StringBuffer odagada) throws Exception {
		 //인증키 생성
	    String key = new TemKey().getKey(50,false); 
		//인증키 db 저장        
        dao.createAuthKey(m.getEmail(),key);  
        //path 받아오기
        String path=odagada.toString().split("member")[0];
        //메일 전송
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[odagada] 메일 인증하기 입니다.");
        sendMail.setText(
                new StringBuffer().append("<h1>메일인증</h1>")
                .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
                .append("<a href='"+path+"emailConfirm.do?memberId=")
                .append(m.getMemberId())
				.append("&email=")
				.append(m.getEmail())
				.append("&mailCode=").append(key)
				.append("' target='_blank'>이메일 인증 확인</a>").toString());
        sendMail.setFrom("burny9057@gmail.com", "[odagada]");
        sendMail.setTo(m.getEmail());
        sendMail.send(); 
	}
		

	public int updatePhoneCode(Member m) {
		return dao.updatePhoneCode(m);
		
	}

	@Override
	public String getPhoneCode(int memberNum) {
		return dao.getPhoneCode(memberNum);
	}

	@Override
	public int updateYPhoneStatus(int memberNum) {
		return dao.updateYPhoneStatus(memberNum);
	}

	@Override
	public int checkPhone(String phone) {
		return dao.checkPhone(phone);
	}

	@Override
	public int updatePassword(Member m) {
		return dao.updatePassword(m);
	}

	@Override
	public void mailUpdate(Member m,StringBuffer odagada) throws Exception {
		 //인증키 생성
	    String key = new TemKey().getKey(50,false); 
		//새로운 인증키로 db 입력        
        dao.updateEmailCode(key, m.getMemberId());      
        //메일 전송
        MailHandler sendMail = new MailHandler(mailSender);
        
        String path=odagada.toString().split("member")[0];
        
        sendMail.setSubject("[odagada] 메일 인증하기 입니다.");
        sendMail.setText(
                new StringBuffer().append("<h1>메일인증</h1>")
                .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
                .append("<a href='"+path+"emailConfirm.do?memberId=")
                .append(m.getMemberId())
				.append("&email=")
				.append(m.getEmail())
				.append("&mailCode=").append(key)
				.append("' target='_blank'>이메일 인증 확인</a>").toString());
        sendMail.setFrom("burny9057@gmail.com", "[odagada]");
        sendMail.setTo(m.getEmail());
        sendMail.send();
		
	}

	@Override
	public int updatePhone(Member m) {
		return dao.updatePhone(m);
	}

	@Override
	public int updateName(Member m) {
		return dao.updateName(m);
	}

	@Override
	public int updateMsg(Member m) {
		return dao.updateMsg(m);
	}

	@Override
	public int deleteMsg(Member m) {
		return dao.deleteMsg(m);
	}

	@Override
	public void deleteLeaveMember() {
		 dao.deleteLeaveMember();
	}		
}
