package com.spring.odagada.carpool.model.dao;

import java.util.List;
import java.util.Map;

import com.spring.odagada.carpool.model.vo.Carpool;
import com.spring.odagada.carpool.model.vo.CarOption;

public interface CarpoolDao {
	List<Carpool> selectCarpoolList(Map<String,String> map);

	int insertCarpool(Carpool carpool);

	int insertOption(CarOption option);

}
