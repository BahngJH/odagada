package com.spring.odagada.community.model.service;

import java.util.List;
import java.util.Map;

import com.spring.odagada.community.model.vo.ChatRoomVo;
import com.spring.odagada.community.model.vo.MessageVo;

public interface CommunityService {
	List<Map<String,String>> searchId(String searchId);
	int insertRoomId(Map roomIdData);
	List<Map<String,String>> bringUserInfo(Map<String,String> roomIdData);
	String roomIdCheck(Map<String,String> roomIdData);
	int jsutCheckMsg(String myId);
	int saveMessage(MessageVo msg);
	List<Map<String,String>> bringMsg(String roomId);
	List<ChatRoomVo> bringChatRooms(String loginId);
	int checkedMessage(Map isreadData);
	
	int insertNotify(Map<String,Object>map);
	int insertReview(Map<String,String>map);
	int selectReviewCount(int memberNum);
	Map<String,Object> selectReview(Map<String,String> m);
	List<Map<String,Object>> selectMyReviewList(Map<String,String> map);
	List<Map<String,Object>> selectReviewList(int memberNum);
	int updateReview(Map<String,String>map);
	int deleteReview(Map<String,String>map);
	
}
