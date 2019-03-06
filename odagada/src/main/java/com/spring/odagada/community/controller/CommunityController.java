package com.spring.odagada.community.controller;

import java.util.HashMap;
import java.util.Map;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("/community/reviewForm.do")
	public String reviewForm()
	{
		return "community/reviewForm";
	}
		
	
	
}
