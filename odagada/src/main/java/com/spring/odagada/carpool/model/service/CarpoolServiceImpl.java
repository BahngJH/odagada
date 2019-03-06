package com.spring.odagada.carpool.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.odagada.carpool.model.dao.CarpoolDao;

@Service
public class CarpoolServiceImpl implements CarpoolService {
	@Autowired
	CarpoolDao dao;

	@Override
	public List<Map<String, String>> selectCarpoolList(Map<String, String> map) {
		return dao.selectCarpoolList(map);
	}
	
	
	
}
