package com.spring.odagada.community.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.odagada.community.model.service.CommunityService;
import com.spring.odagada.community.model.vo.ChatRoomVo;
import com.spring.odagada.community.model.vo.MessageVo;
import com.spring.odagada.member.model.vo.Member;

@Controller
public class CommunityController {
	@Autowired
	CommunityService service;
	
	private Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@RequestMapping("/community/moveChatting.do")
	public String test() {
		return "community/chatView";
	}
	
	//채팅방이 아닌곳에서 안읽은 메시지 확인용
	@RequestMapping("/community/checkMsg.do")
	public ModelAndView jsutCheckMsg(ModelAndView mv, String myId) 
	{
		int unIsReadMsg = service.jsutCheckMsg(myId);
		mv.addObject("unIsReadMsg", unIsReadMsg);
		mv.setViewName("jsonView");
		
		return mv;
	}

	@RequestMapping("/community/createRoomClick.do")
	public ModelAndView createRoomClick(ModelAndView mv, String chatUser, HttpServletRequest request)
	{
		Member m =(Member)request.getSession().getAttribute("logined");
		Map<String,String> roomIdData = new HashMap<String, String>();
		roomIdData.put("myId", m.getMemberId());
		roomIdData.put("chatUser", chatUser);
		logger.debug(chatUser+"와 채팅방을 검사합니다");
				
		String roomIdCheck = service.roomIdCheck(roomIdData);
		if(roomIdCheck!=null)
		{
			logger.debug(chatUser+"와 채팅방이 이미 존재한다. 채팅방 이름 : "+roomIdCheck);
			List<ChatRoomVo> chatRooms = service.bringChatRooms(m.getMemberId());
			for(ChatRoomVo i:chatRooms)
			{
				logger.debug("채팅방 정보들"+i);
				i.setcDate(i.getcDate().substring(0, 14));
			}
			
			mv.addObject("chatRooms", chatRooms);
			
			//상대방 정보와 채팅 내역 가져옴
			List<Map<String,String>> chatContent = service.bringMsg(roomIdCheck);

			if(!(chatContent.isEmpty())) 
			{
				logger.debug("방도 있고 메시지도 있다"+chatContent);
				mv.addObject("chatContent", chatContent);
				for(int i=0;i<chatContent.size();i++) {
					logger.debug("MAP데이터22"+chatContent.get(i));
				}
			}
			else 
			{
				logger.debug("방은 있지만 메시지가 없다. 상대 정보만 가져옴");
				List<Map<String,String>> member = service.bringUserInfo(roomIdData);
				logger.debug(member+"");
				mv.addObject("chatMember", member);
			}
		}else {
			logger.info("채팅방 존재하지 않음");
			//roomId = 내아이디,상대아이디 로 구성
			roomIdData.put("roomId", String.join(",",m.getMemberId(), chatUser));
			int insertRoomId = service.insertRoomId(roomIdData);
			
			List<ChatRoomVo> chatRooms = service.bringChatRooms(m.getMemberId());
			for(ChatRoomVo i:chatRooms)
			{
				logger.debug("채팅방 정보들"+i);
				i.setcDate(i.getcDate().substring(0, 14));
			}
			mv.addObject("chatRooms", chatRooms);
			List<Map<String,String>> member = service.bringUserInfo(roomIdData);
			mv.addObject("chatMember", member);
		}
		mv.setViewName("community/chatting");
		return mv;
	}

	//채팅방 입장
	@RequestMapping("/community/chatting.do")
	public ModelAndView chatting(HttpServletRequest request, ModelAndView mv) 
	{
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
	
	//메시지 왔을 때 채팅방 최신화, (원본 세이브)!	
	@RequestMapping("/community/updateRoom.do")
	public ModelAndView updateRoom(HttpServletRequest request, ModelAndView mv, @RequestParam(value="roomId",required=false, defaultValue="null") String roomId)
	{
		Member m = (Member)request.getSession().getAttribute("logined");		
		logger.debug("updateRoom에 들어온 roomId : "+roomId);
		
		if(!roomId.equals("null")) 
		{
			Map<String,Object> isreadData = new HashMap();
			isreadData.put("loginId", m.getMemberId());
			isreadData.put("roomId", roomId);
			int rs = service.checkedMessage(isreadData);
		}
		List<ChatRoomVo> chatRooms = service.bringChatRooms(m.getMemberId());
		
		for(ChatRoomVo i:chatRooms) 
		{
			logger.debug("채팅방 정보들"+i);
		}
		
		mv.addObject("chatRooms", chatRooms);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//채팅방 클릭 했을 때
	@RequestMapping("/community/bringMessage.do")
	public ModelAndView bringMsg(String roomId, ModelAndView mv, HttpServletRequest request) throws UnsupportedEncodingException
	{
		
		Member m =(Member) request.getSession().getAttribute("logined");
		Map<String,Object> isreadData = new HashMap();
		
		isreadData.put("loginId", m.getMemberId());
		isreadData.put("roomId", roomId);
		
		List<Map<String,String>> chatContent = service.bringMsg(roomId);
		int rs = service.checkedMessage(isreadData);
		
		for(Map<String,String> i:chatContent) 
		{
			logger.debug("MAP데이터 : "+i);
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
	public ModelAndView reviewForm(HttpServletRequest request, HttpSession session)
	{
		ModelAndView mv=new ModelAndView();
		Member m = (Member)session.getAttribute("logined");
		
		if(m!=null)
		{
			mv.setViewName("community/reviewForm");
			logger.debug("멤버정보 "+m);
			return mv;
		}
		else
		{
			mv.setViewName("/common/msg");
			mv.addObject("msg","로그인 후 이용해주세요.");
			mv.addObject("loc","/member/loginForm.do");
			
			return mv;
		}
		
	}
	
	@RequestMapping("/community/reviewFormEnd.do")
	public String reviewFormEnd(int memberNum, /*String driverNum,*/ String rContent, int rGrade, Model model)
	{
		
		Map<String, Object> map=new HashMap();
		/*map.put("writerNum", writerNum);*/
		/*map.put("driverNum", driverNum);*/
		map.put("rContent", rContent);
		map.put("rGrade", rGrade);
		map.put("memberNum", memberNum);
		System.out.println("map나와라 짜샤 :"+map);
		
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
	@RequestMapping("community/reviewView.do")
	public String reviewView()
	{
		return "community/reviewView";
	}
	
	@RequestMapping("community/myReviewView.do")
	public ModelAndView myReviewView(int writerNum)
	{
		ModelAndView mv=new ModelAndView();
		Map<String,String> map=service.selectMyReview(writerNum);
		mv.addObject("review",map);
		mv.setViewName("community/myReviewView");
		return mv;
	}
	
	/*@RequestMapping("community/reviewList.do")
	public ModelAndView reviewList(int writerNum, int driverNum)
	{
		ModelAndView mv=new ModelAndView();
		List<Map<String,String>> list=service.selectReviewList(writerNum,driverNum);
		mv.addObject("list",list);
		mv.setViewName("community/reviewList");
	}*/
}
