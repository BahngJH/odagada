package com.spring.odagada.community.model.service;

import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.odagada.community.model.dao.CommunityDao;
import com.spring.odagada.community.model.vo.ChatRoomVo;
import com.spring.odagada.community.model.vo.MessageVo;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	CommunityDao dao;
	
	private Logger logger = LoggerFactory.getLogger(CommunityServiceImpl.class);

	@Override
	public int saveMessage(MessageVo msg) {
		// TODO Auto-generated method stub
		return dao.saveMessage(msg);
	}

	//채팅 내용들 가져오는거
	@Override
	public List<Map<String, String>> bringMsg(String roomId) {
		// TODO Auto-generated method stub
		return dao.bringMsg(roomId);
	}
	
	//채팅방 리스트 가져오는거
	@Override
	public List<ChatRoomVo> bringChatRooms(String loginId) {
		// TODO Auto-generated method stub
		return dao.bringChatRooms(loginId);
	}
	
	//신고 글쓰기
	@Override
	public int insertNotify(Map<String, String> map) {
		return dao.insertNotify(map);
	}

	@Override
	public int insertReview(Map<String, String> map) {
		return dao.insertReview(map);
	}
	
	
	
	
	
}
