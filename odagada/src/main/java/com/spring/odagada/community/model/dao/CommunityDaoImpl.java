package com.spring.odagada.community.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.odagada.community.model.vo.ChatRoomVo;
import com.spring.odagada.community.model.vo.MessageVo;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int insertRoomId(Map roomIdData) {
		// TODO Auto-generated method stub
		int rs = session.insert("community.insertRoomId",roomIdData);
		rs += session.insert("community.insertRoomId2",roomIdData);
		return rs;
	}
	@Override
	public List<Map<String, String>> bringUserInfo(Map<String,String> roomIdData) {
		// TODO Auto-generated method stub
		return session.selectList("community.bringUserInfo", roomIdData);
	}
	@Override
	public String roomIdCheck(Map<String,String> roomIdData) {
		// TODO Auto-generated method stub
		return session.selectOne("community.roomIdCheck", roomIdData);
	}
	@Override
	public int jsutCheckMsg(String myId) {
		// TODO Auto-generated method stub
		return session.selectOne("community.jsutCheckMsg", myId);
	}
	@Override
	public int saveMessage(MessageVo msg) {
		// TODO Auto-generated method stub
		return session.insert("community.saveMessage", msg);
	}

	@Override
	public int checkedMessage(Map isreadData) {
		// TODO Auto-generated method stub
		return session.update("community.checkedMessage",isreadData);
	}

	//채팅 내용들 가져옴
	@Override
	public List<Map<String, String>> bringMsg(String roomId) {
		// TODO Auto-generated method stub
		return session.selectList("community.bringMsg", roomId);
	}
	
	//채팅방들 가져옴
	@Override
	public List<ChatRoomVo> bringChatRooms(String loginId) {
		// TODO Auto-generated method stub
		
		List<ChatRoomVo> chatRoomList =  session.selectList("community.bringChatRooms",loginId);
		for(ChatRoomVo room:chatRoomList)
		{
			room.setIsReadCount(room.getAllMsg()-room.getyMsg());
		}
		/*for(ChatRoomVo room:chatRoomList)
		{
			room.setIsReadCount(session.selectOne("community.isReadCount", room));
		}*/
		return chatRoomList;
	}
	
	//신고 글쓰기
	@Override
	public int insertNotify(Map<String, Object> map) {
		return session.insert("community.insertNotify",map);
	}

	@Override
	public int insertReview(Map<String, Object> map) {
		return session.insert("community.insertReview",map);
	}

	@Override
	public Map<String, Object> selectReview(int carpoolNum) {
		return session.selectOne("community.selectReview", carpoolNum);
	}

	@Override
	public List<Map<String,Object>> selectMyReviewList(int memberNum) {
		return session.selectList("community.selectMyReviewList",memberNum);
	}

	@Override
	public List<Map<String, Object>> selectReviewList(int memberNum) {
		return session.selectList("community.selectReviewList",memberNum);
	}

	@Override
	public int updateReview(Map<String, Object> map) {
		return session.update("community.updateReview",map);
	}

	@Override
	public int deleteReview(int carpoolNum) {
		return session.delete("community.deleteReview",carpoolNum);
	}
	
	
	
	
	
	
	

	
	
	
	
		
	
	
}
