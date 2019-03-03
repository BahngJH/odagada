package com.spring.odagada.member.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.spring.odagada.member.model.service.MemberService;
import com.spring.odagada.member.model.vo.Member;

@SessionAttributes("logined")
@Controller
public class MemberController {
	
	private Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService service;
	
	@RequestMapping("/member/signUp.do")
	public String signUp() {
		return "member/signUpForm";
	}
	
	@RequestMapping("/member/loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}
	
   @RequestMapping("/member/login.do")
   public ModelAndView login(String memberId, String memberPw, Model model) {
	   logger.debug("로그인 확인 memberId:"+memberId+"password:"+memberPw);
	   
	   Map<String, String>login=new HashMap();
	   login.put("memberId", memberId);
	   login.put("memberPw", memberPw);
	   
	   Map<String, String>result=service.login(login);
	   
	   logger.debug("로그인 결과:"+result);
	   
	   ModelAndView mv=new ModelAndView();
	   
	   Member m=service.selectMember(memberId);   
	
	   String msg="";
	   String loc="/";
	   
	   if(result!=null) {
		   if(memberPw.equals(result.get("MEMBERPW"))){
			   msg="로그인 성공";			   
			   mv.addObject("logined", m);			   
		   }else {
			  msg="패스워드가 일치하지 않습니다.";
		   }	   
		   mv.addObject("msg", msg);
		   mv.addObject("loc", loc);
		   mv.setViewName("common/msg");
	   }	  
	   logger.debug("로그인 멤버 정보"+m);
	   return mv;
   }
   
   @RequestMapping("/member/logout.do")
   public String logout(SessionStatus status) {
	   	if(!status.isComplete()) {
	   		status.setComplete();
	   	}
	   	return "redirect:/index.jsp";
   }
   
   

}
