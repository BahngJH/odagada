package com.spring.odagada.carpool.model.service;

import java.util.List;
import java.util.Map;

import com.spring.odagada.carpool.model.vo.Carpool;
import com.spring.odagada.carpool.model.vo.CarOption;

public interface CarpoolService {

	List<Carpool> selectCarpoolList(Map<String,String> map);
	int insertCarpool(Carpool carpool, CarOption option);

	List<Map<String, String>> selectCarpoolList(int memberNum, int cPage, int numPerPage);

	int selectCarpoolCount(int memberNum);

}
