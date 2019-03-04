package com.spring.odagada.community.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("/moveChat")
	public String moveChat() 
	{
		return "community/chatView";
	}
	
	/*@RequestMapping("/community/review.do")
	public String reviewForm()
	{
		return "community/reviewForm";
	}*/
	
	@RequestMapping("/community/notifyForm.do")
	public String notifyForm()
	{
		return "community/notifyForm";
	}
	
	@RequestMapping("/commnity/notifyFormEnd.do")
	public String notifyFormEnd(String notify)
	{
		Map<String,String> map=new HashMap();
		map.put("notify",notify);
		return "home";
	}
		
	
	
}
