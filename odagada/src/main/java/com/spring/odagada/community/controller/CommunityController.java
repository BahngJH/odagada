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
import com.spring.odagada.community.model.vo.ChatRoomVo;
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

	
	//채팅방 클릭 했을 때
	@RequestMapping("/chat/bringMessage.do")
	public ModelAndView bringMsg(String roomId, ModelAndView mv) throws UnsupportedEncodingException
	{
		List<Map<String,String>> chatContent = service.bringMsg(roomId);
		
		for(Map<String,String> i:chatContent) 
		{
			logger.debug("MAP데이터 : "+i);
		}
		
		mv.addObject("chatList",chatContent);
		mv.setViewName("jsonView");
		
		return mv;
	}
	

	//채팅방 입장
	@RequestMapping("/chatting.do")
	public ModelAndView chatting(HttpServletRequest request) 
	{
		ModelAndView mv = new ModelAndView();
		Member m = (Member)request.getSession().getAttribute("logined");
		
		List<ChatRoomVo> chatRooms = service.bringChatRooms(m.getMemberId());
		
		for(ChatRoomVo i:chatRooms) 
		{
			logger.debug("채팅방 정보들"+i);
			i.setcDate(i.getcDate().substring(0, 14));
		}
		
		mv.addObject("chatRooms", chatRooms);
		mv.setViewName("community/chatting");
		
		return mv;
	}
	
	//메시지 왔을 때 채팅방 최신화
	@RequestMapping("/chat/updateRoom.do")
	public ModelAndView updateRoom(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		Member m = (Member)request.getSession().getAttribute("logined");		
		
		List<ChatRoomVo> chatRooms = service.bringChatRooms(m.getMemberId());
		
		for(ChatRoomVo i:chatRooms) 
		{
			logger.debug("채팅방 정보들"+i);
		}
		
		mv.addObject("chatRooms", chatRooms);
		mv.setViewName("jsonView");
		
		return mv;
	}

	@RequestMapping("/community/notifyForm.do")
	public String notifyForm()
	{
		return "community/notifyForm";
	}
	
	@RequestMapping("/community/notifyFormEnd.do")
	public String notifyFormEnd(String notifyNum, String nonNotifyNum, String nContent, Model model)
	{
		Map<String,String> map=new HashMap();
		map.put("notifyNum", notifyNum);
		map.put("nonNotify", nonNotifyNum);
		map.put("nContent",nContent);
		
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
	
	@RequestMapping("/community/reviewFormEnd.do")
	public String reviewFormEnd(/*String writerNum, String driverNum,*/ String rContent, String rGrade, Model model)
	{
		Map<String, String> map=new HashMap();
		/*map.put("writerNum", writerNum);
		map.put("driverNum", driverNum);*/
		map.put("rContent", rContent);
		map.put("rGrade", rGrade);
		
		int result=service.insertReview(map);
		String msg="";
		String loc="/";
		if(result>0)
		{
			msg="리뷰등록 성공";
		}
		else
		{
			msg="리뷰등록 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
		
		
		
	}
}
