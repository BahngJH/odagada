package com.spring.odagada.carpool.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarpoolDaoImpl implements CarpoolDao {
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> selectCarpoolList(Map<String, String> map) {
		return session.selectList("carpool.selectCarpoolList", map);
	}
	
}