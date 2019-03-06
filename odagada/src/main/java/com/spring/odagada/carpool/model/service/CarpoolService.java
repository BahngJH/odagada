package com.spring.odagada.carpool.model.service;

import java.util.List;
import java.util.Map;

public interface CarpoolService {
	List<Map<String,String>> selectCarpoolList(Map<String,String> map);
}
