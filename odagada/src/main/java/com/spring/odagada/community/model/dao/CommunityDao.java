package com.spring.odagada.community.model.dao;

import com.spring.odagada.community.model.vo.MessageVo;

public interface CommunityDao {
	int saveMessage(MessageVo msg);
	
}
