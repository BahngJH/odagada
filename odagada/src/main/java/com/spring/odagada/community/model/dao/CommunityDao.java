package com.spring.odagada.community.model.dao;

import java.util.List;
import java.util.Map;

import com.spring.odagada.community.model.vo.MessageVo;

public interface CommunityDao {
	
	int saveMessage(MessageVo msg);
	List<Map<String,String>> bringMsg(String roomId);
	List<Map<String,String>> bringChatRooms(String loginId);
	int insertNotify(Map<String,String>map);
	int insertReview(Map<String,String>map);
	
}
