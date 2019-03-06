package com.spring.odagada.community.model.dao;

import java.util.Map;

import com.spring.odagada.community.model.vo.MessageVo;

public interface CommunityDao {
	
	int saveMessage(MessageVo msg);
	int insertNotify(Map<String,String>map);
	
}
