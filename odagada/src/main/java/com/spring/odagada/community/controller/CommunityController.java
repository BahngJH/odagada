package com.spring.odagada.community.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.odagada.community.model.service.CommunityService;

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
	@RequestMapping("/chatting.do")
	public String chatting() 
	{
		
		return "community/chatting";
	}
	@RequestMapping("/chat/bringMessage.do")
	public ModelAndView bringMsg(String roomId) 
	{
		ModelAndView mv = new ModelAndView();
		List<Map<String,String>> chatContent = service.bringMsg(roomId);
		
		for(Map i:chatContent) {
			logger.info("MAP데이터 : "+i);
		}
		mv.addObject("chatList",chatContent);
		mv.setViewName("jsonView");
		return mv;
	}
}
