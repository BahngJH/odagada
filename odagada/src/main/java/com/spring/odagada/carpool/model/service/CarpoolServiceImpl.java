package com.spring.odagada.carpool.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.odagada.carpool.model.dao.CarpoolDao;

@Service
public class CarpoolServiceImpl implements CarpoolService {
	@Autowired
	CarpoolDao dao;
}
