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
		return session.selectList("community.bringChatRooms",loginId);
	}
	
	//신고 글쓰기
	@Override
	public int insertNotify(Map<String, String> map) {
		return session.insert("community.insertNotify",map);
	}

	@Override
	public int insertReview(Map<String, String> map) {
		return session.insert("community.insertReview",map);
	}
	
	
		
	
	
}
