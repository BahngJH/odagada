package com.spring.odagada.carpool.model.dao;

import java.util.List;
import java.util.Map;

public interface CarpoolDao {
	List<Map<String,String>> selectCarpoolList(Map<String,String> map);

}
