package com.spring.odagada.driver.model.dao;

import java.util.List;
import java.util.Map;

import com.spring.odagada.driver.model.vo.Driver;
import com.spring.odagada.driver.model.vo.CarImage;

public interface DriverDao {

	Driver selectOne(int memberNum);
	int enrollDriver(Map<String,Object> driver);
	int insertCarImage(CarImage cImg);
	int selectJoinCount();
	List<Map<String,String>> selectDriverList(int cPage,int numPerPage);
	Map<String,String> selectDriverOne(int memberNum);
	List<Map<String,String>> selectCarImg(String carNum);
	int updateStatus(Map<String,Object> map);
	int deleteDriver(int memberNum);
	
	
}
