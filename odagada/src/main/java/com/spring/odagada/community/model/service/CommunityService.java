package com.spring.odagada.community.model.service;

import java.util.Map;

import com.spring.odagada.community.model.vo.MessageVo;

public interface CommunityService {
	
	int saveMessage(MessageVo msg);
	int insertNotify(Map<String,String>map);	
}
