package com.spring.odagada.driver.model.dao;

import com.spring.odagada.driver.model.vo.Driver;

public interface DriverDao {

	Driver selectOne(int memberNum);

}