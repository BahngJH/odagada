package com.spring.odagada.driver.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.odagada.driver.model.dao.DriverDao;

@Service
public class DriverServiceImpl implements DriverService {
	@Autowired
	DriverDao dao;
}
