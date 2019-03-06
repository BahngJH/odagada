package com.spring.odagada.community.model.service;

import java.util.List;
import java.util.Map;

import com.spring.odagada.community.model.vo.MessageVo;

public interface CommunityService {
	
	int saveMessage(MessageVo msg);
	List<Map<String,String>> bringMsg(String roomId);
	List<Map<String,String>> bringChatRooms(String loginId);
}
