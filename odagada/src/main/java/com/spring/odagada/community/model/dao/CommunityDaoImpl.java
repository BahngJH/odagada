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
			room.setIsReadCount(session.selectOne("community.isReadCount", room));
		}
		return chatRoomList;
	}
	
	//신고 글쓰기
	@Override
	public int insertNotify(Map<String, String> map) {
		return session.insert("community.insertNotify",map);
	}

	@Override
	public int insertReview(Map<String, Object> map) {
		return session.insert("community.insertReview",map);
	}

	@Override
	public Map<String, String> selectMyReview(int writerNum) {
		return session.selectOne("community.selectReview",writerNum);
	}
	
	

	
	
	
	
		
	
	
}
