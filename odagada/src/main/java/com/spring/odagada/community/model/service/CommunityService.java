package com.spring.odagada.community.model.service;

import java.util.List;
import java.util.Map;

import com.spring.odagada.community.model.vo.ChatRoomVo;
import com.spring.odagada.community.model.vo.MessageVo;

public interface CommunityService {
	int insertRoomId(Map roomIdData);
	List<Map<String,String>> bringUserInfo(Map<String,String> roomIdData);
	String roomIdCheck(Map<String,String> roomIdData);
	int jsutCheckMsg(String myId);
	int saveMessage(MessageVo msg);
	List<Map<String,String>> bringMsg(String roomId);
	List<ChatRoomVo> bringChatRooms(String loginId);
	int checkedMessage(Map isreadData);
	
	int insertNotify(Map<String,String>map);
	int insertReview(Map<String,Object> map);	
	Map<String,String> selectMyReview(int writerNum);
	
}
