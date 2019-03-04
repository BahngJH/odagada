package com.spring.odagada.community.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<Map<String, String>> bringMsg(String roomId) {
		// TODO Auto-generated method stub
		return session.selectList("community.bringMsg", roomId);
	}
	
	
	
}
