package com.spring.odagada.driver.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.odagada.driver.model.dao.DriverDao;
import com.spring.odagada.driver.model.vo.Driver;

@Service
public class DriverServiceImpl implements DriverService {
	@Autowired
	DriverDao dao;

	@Override
	public Driver selectOne(int memberNum) {
		return dao.selectOne(memberNum);
	}

	@Override
	public List selectDriverList() {
		return dao.selectDriverList();
	}
	
	
}
