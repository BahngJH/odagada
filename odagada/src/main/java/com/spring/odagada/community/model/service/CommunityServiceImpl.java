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
	public int insertRoomId(Map roomIdData) {
		// TODO Auto-generated method stub
		return dao.insertRoomId(roomIdData);
	}

	@Override
	public List<Map<String, String>> bringUserInfo(Map<String,String> roomIdData) {
		// TODO Auto-generated method stub
		return dao.bringUserInfo(roomIdData);
	}

	@Override
	public String roomIdCheck(Map<String,String> roomIdData) {
		// TODO Auto-generated method stub
		return dao.roomIdCheck(roomIdData);
	}

	@Override
	public int jsutCheckMsg(String myId) {
		// TODO Auto-generated method stub
		return dao.jsutCheckMsg(myId);
	}

	@Override
	public int saveMessage(MessageVo msg) {
		// TODO Auto-generated method stub
		return dao.saveMessage(msg);
	}
	
	@Override
	public int checkedMessage(Map isreadData) {
		// TODO Auto-generated method stub
		return dao.checkedMessage(isreadData);
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
	public int insertNotify(Map<String, Object> map) {
		return dao.insertNotify(map);
	}
	//리뷰글쓰기
	@Override
	public int insertReview(Map<String, String> map) {
		return dao.insertReview(map);
	}
	//리뷰카운트
	@Override
	public int selectReviewCount(int memberNum) {
		return dao.selectReviewCount(memberNum);
	}
	//리뷰 불러오기
	@Override
	public Map<String, Object> selectReview(Map<String,String> m) {
		return dao.selectReview(m);
	}
	//내가 작성한 리뷰리스트
	@Override
	public List<Map<String,Object>> selectMyReviewList(Map<String,String> map) {
		return dao.selectMyReviewList(map);
	}
	//내게 달린 리뷰 리스트
	@Override
	public List<Map<String, Object>> selectReviewList(int memberNum) {
		return dao.selectReviewList(memberNum);
	}
	//리뷰 수정
	@Override
	public int updateReview(Map<String, String> map) {
		return dao.updateReview(map);
	}
	//리뷰 삭제
	@Override
	public int deleteReview(Map<String, String> map) {
		return dao.deleteReview(map);
	}
	
	
	
	
	
	
}
