package com.spring.odagada.community.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.odagada.community.model.vo.ChatRoomVo;
import com.spring.odagada.community.model.vo.MessageVo;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> searchId(String searchId) {
		// TODO Auto-generated method stub
		return session.selectList("community.searchId", searchId);
	}
	
	@Transactional
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
	@Transactional
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
	public int insertNotify(Map<String, Object> map) {
		return session.insert("community.insertNotify",map);
	}
	//리뷰 글쓰기
	@Override
	public int insertReview(Map<String, String> map) {
		return session.insert("community.insertReview",map);
	}
	//리뷰 카운트
	@Override
	public int selectReviewCount(int memberNum) {
		return session.selectOne("community.selectReviewCount",memberNum);
	}
	//리뷰 가져오기
	@Override
	public Map<String, Object> selectReview(Map<String,String> m) {
		return session.selectOne("community.selectReview", m);
	}
	//내가 쓴 리뷰 리스트
	@Override
	public List<Map<String,Object>> selectMyReviewList(Map<String,String> map) {
		return session.selectList("community.selectMyReviewList",map);
	}
	//내게 달린 리뷰 리스트
	@Override
	public List<Map<String, Object>> selectReviewList(int memberNum) {
		return session.selectList("community.selectReviewList",memberNum);
	}
	//리뷰수정
	@Override
	public int updateReview(Map<String, String> map) {
		return session.update("community.updateReview",map);
	}
	//리뷰 삭제
	@Override
	public int deleteReview(Map<String, String> map) {
		return session.delete("community.deleteReview",map);
	}
	
	
	
	
	
	
	

	
	
	
	
		
	
	
}
