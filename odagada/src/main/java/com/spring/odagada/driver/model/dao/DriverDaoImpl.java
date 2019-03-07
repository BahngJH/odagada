package com.spring.odagada.driver.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.odagada.driver.model.vo.Driver;

@Repository
public class DriverDaoImpl implements DriverDao {
	@Autowired
	SqlSessionTemplate session;

	@Override
	public Driver selectOne(int memberNum) {
		return session.selectOne("driver.selectDriver", memberNum);
	}

	@Override
	public List selectDriverList() {
		return session.selectList("driver.selectDriverList");
	}
	
}
