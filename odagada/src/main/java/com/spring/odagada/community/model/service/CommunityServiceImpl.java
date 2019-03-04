package com.spring.odagada.community.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.odagada.community.model.dao.CommunityDao;
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

	@Override
	public List<Map<String, String>> bringMsg(String roomId) {
		// TODO Auto-generated method stub
		return dao.bringMsg(roomId);
	}
	
	
}
