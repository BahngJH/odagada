package com.spring.odagada.driver.model.service;

import java.util.List;
import java.util.Map;

import com.spring.odagada.common.exception.BoardException;
import com.spring.odagada.driver.model.vo.Driver;
import com.spring.odagada.driver.model.vo.carImage;

public interface DriverService {

	Driver selectOne(int memberNum);
	int selectJoinCount();
	List<Map<String,String>> selectDriverList(int cPage,int numPerPage);	
	int enrollDriver(Map<String,Object> driver,List<carImage> files) throws BoardException;
	
	
	
	
	
	
}
