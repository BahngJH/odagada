package com.spring.odagada.community.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("/community/reviewForm.do")
	public String reviewForm()
	{
		return "community/reviewForm";
	}
	
	@RequestMapping("/community/notifyForm.do")
	public String notifyForm()
	{
		return "community/notifyForm";
	}
	
	@RequestMapping("/community/notifyFormEnd.do")
	public String notifyFormEnd(String nContent, Model model)
	{
		Map<String,String> map=new HashMap();
		map.put("nContent",nContent);
		System.out.println(map);
		
		
		int result=service.insertNotify(map);
		String msg="";
		String loc="/";
		if(result>0)
		{
			msg="신고완료";
		}
		else
		{
			msg="신고실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
		
	
	
}
