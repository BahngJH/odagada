package com.spring.odagada.carpool.model.service;

import java.util.List;
import java.util.Map;

import com.spring.odagada.carpool.model.vo.Carpool;
import com.spring.odagada.carpool.model.vo.CarOption;

public interface CarpoolService {
	List<Map<String,String>> selectCarpoolList(Map<String,String> map);
	int insertCarpool(Carpool carpool, CarOption option);
	List<Map<String,String>> selectCarOptionList(Map<String,String> map);
	List<Map<String,String>> selectCarOneList(int carpoolNum);
	List<Map<String,String>> selectPasList(int carpoolNum);
	List<Map<String,String>> selectImageList(int mem);
	List<Map<String,String>> selectReList(int dNum);
}
