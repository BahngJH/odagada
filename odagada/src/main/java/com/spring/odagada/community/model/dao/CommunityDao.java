package com.spring.odagada.community.model.dao;

import java.util.List;
import java.util.Map;

import com.spring.odagada.community.model.vo.ChatRoomVo;
import com.spring.odagada.community.model.vo.MessageVo;

public interface CommunityDao {
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
	int insertReview(Map<String,Object>map);
	Map<String,Object> selectReview(int carpoolNum);
	List<Map<String,Object>> selectMyReviewList(int memberNum);
	List<Map<String,Object>> selectReviewList(int memberNum);
	int updateReview(Map<String,Object>map);
	int deleteReview(int carpoolNum);


	
	
}
