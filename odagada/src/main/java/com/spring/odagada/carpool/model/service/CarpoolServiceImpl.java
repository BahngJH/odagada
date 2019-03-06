package com.spring.odagada.carpool.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.odagada.carpool.model.dao.CarpoolDao;
import com.spring.odagada.carpool.model.vo.Carpool;
import com.spring.odagada.carpool.model.vo.Option;

@Service
public class CarpoolServiceImpl implements CarpoolService {
	@Autowired
	CarpoolDao dao;

	@Override
	public List<Map<String, String>> selectCarpoolList(Map<String, String> map) {
		return dao.selectCarpoolList(map);
	}

	@Transactional
	@Override
	public int insertCarpool(Carpool carpool, Option option) {
		return 0;
	}
	
	
	
}
