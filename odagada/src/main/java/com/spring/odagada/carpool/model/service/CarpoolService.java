package com.spring.odagada.carpool.model.service;

import java.util.List;
import java.util.Map;

import com.spring.odagada.carpool.model.vo.Carpool;
import com.spring.odagada.carpool.model.vo.Option;

public interface CarpoolService {
	List<Map<String,String>> selectCarpoolList(Map<String,String> map);

	int insertCarpool(Carpool carpool, Option option);
}
