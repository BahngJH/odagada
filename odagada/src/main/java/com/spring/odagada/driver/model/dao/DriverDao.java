package com.spring.odagada.driver.model.dao;

import java.util.List;
import java.util.Map;

import com.spring.odagada.driver.model.vo.Driver;
import com.spring.odagada.driver.model.vo.carImage;

public interface DriverDao {

	Driver selectOne(int memberNum);
	int enrollDriver(Map<String,Object> driver);
	int insertCarImage(carImage cImg);
	int selectJoinCount();
	List<Map<String,String>> selectDriverList(int cPage,int numPerPage);

	
}
