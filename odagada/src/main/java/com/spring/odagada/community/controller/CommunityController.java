package com.spring.odagada.community.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.odagada.community.model.service.CommunityService;
import com.spring.odagada.member.model.vo.Member;

@Controller
public class CommunityController {
	@Autowired
	CommunityService service;
	
	private Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@RequestMapping("/moveChat.do")
	public String moveChat() 
	{
		return "community/chatView";
	}
	
	//채팅방 입장
	@RequestMapping("/chatting.do")
	public ModelAndView chatting(HttpServletRequest request) 
	{
		ModelAndView mv = new ModelAndView();
		Member m = (Member)request.getSession().getAttribute("logined");
		logger.debug(m+"");
		List<Map<String,String>> chatRooms = service.bringChatRooms(m.getMemberId());
		for(Map i:chatRooms) {
			logger.debug("채팅방 정보들"+i);
		}
		mv.addObject("chatRooms", chatRooms);
		mv.setViewName("community/chatting");
		return mv;
	}
	@RequestMapping("/chat/bringMessage.do")
	public ModelAndView bringMsg(String roomId) throws UnsupportedEncodingException
	{
		ModelAndView mv = new ModelAndView();
		List<Map<String,String>> chatContent = service.bringMsg(roomId);
		
		for(Map<String,String> i:chatContent) {
			logger.debug("MAP데이터 : "+i);
			i.put("CCONTENT", URLEncoder.encode((String)i.get("CCONTENT"),"UTF-8"));
		}
		mv.addObject("chatList",chatContent);
		mv.setViewName("jsonView");
		return mv;
	}
}
