package com.spring.odagada.driver.model.service;

import java.util.List;

import com.spring.odagada.driver.model.vo.Driver;

public interface DriverService {

	Driver selectOne(int memberNum);
	List selectDriverList();
}
