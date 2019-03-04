package com.spring.odagada.community.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
