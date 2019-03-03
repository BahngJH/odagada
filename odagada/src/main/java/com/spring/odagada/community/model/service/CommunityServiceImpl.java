package com.spring.odagada.community.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.odagada.community.model.dao.CommunityDao;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	CommunityDao Dao;
	
	private Logger logger = LoggerFactory.getLogger(CommunityServiceImpl.class);
	
	
}
