package com.spring.odagada.community.model.service;

import java.util.List;
import java.util.Map;

import com.spring.odagada.community.model.vo.ChatRoomVo;
import com.spring.odagada.community.model.vo.MessageVo;

public interface CommunityService {
	
	int saveMessage(MessageVo msg);
	List<Map<String,String>> bringMsg(String roomId);
	List<ChatRoomVo> bringChatRooms(String loginId);
	
	int insertNotify(Map<String,Object>map);
	int insertReview(Map<String,Object>map);
	Map<String,Object> selectReview(int carpoolNum);
	List<Map<String,Object>> selectMyReviewList(int memberNum);
	List<Map<String,Object>> selectReviewList(int memberNum);
	int updateReview(Map<String,Object>map);
	int deleteReview(int carpoolNum);
	
}
