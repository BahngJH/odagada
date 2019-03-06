package com.spring.odagada.carpool.model.service;

import java.util.List;
import java.util.Map;

import com.spring.odagada.carpool.model.vo.Carpool;

public interface CarpoolService {
	List<Carpool> selectCarpoolList(Map<String,String> map);
}
