package com.spring.odagada.carpool.model.service;

import java.util.List;
import java.util.Map;

import com.spring.odagada.carpool.model.vo.Carpool;
import com.spring.odagada.carpool.model.vo.CarOption;

public interface CarpoolService {
	List<Map<String,String>> selectCarpoolList(Map<String,String> map,int cPage,int numPerPage);
	int insertCarpool(Carpool carpool, CarOption option);
	List<Map<String,String>> selectCarOptionList(Map<String,String> map,int cPage,int numPerPage);
	List<Map<String,String>> selectCarOneList(int carpoolNum);
	List<Map<String,String>> selectPasList(int carpoolNum);
	List<Map<String,String>> selectImageList(int mem);
	int insertPassenger(Map<String, Object> pass);
	List<Map<String,String>> selectReList(int dNum);
	List<Map<String, String>> selectCarpoolList(int memberNum, int cPage, int numPerPage);
	int selectCarpoolCount(int memberNum);
	List<Map<String,String>> selectPopList();
	void setCarpoolStatus(String nowDate);
	String getImpUid(Map<String, Integer> map);
	int updateCPayStatus(Map<String, Integer> map);
}
 