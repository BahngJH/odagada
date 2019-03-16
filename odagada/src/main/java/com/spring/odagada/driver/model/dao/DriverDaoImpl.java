package com.spring.odagada.driver.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.odagada.driver.model.vo.Driver;
import com.spring.odagada.driver.model.vo.CarImage;

@Repository
public class DriverDaoImpl implements DriverDao {
	@Autowired
	SqlSessionTemplate session;

	@Override
	public Driver selectOne(int memberNum) {
		return session.selectOne("driver.selectDriver", memberNum);
	}

	@Override
	public int enrollDriver(Map<String, Object> driver) {
		return session.insert("driver.enrollDriver",driver);
	}

	@Override
	public int insertCarImage(CarImage cImg) {
		return session.insert("driver.insertCarImage",cImg);
	}

	@Override
	public int selectJoinCount() {
		return session.selectOne("driver.selectJoinCount");
	}

	@Override
	public List<Map<String, String>> selectDriverList(int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		
		return session.selectList("driver.selectDriverList",null,rb);
	}

	@Override
	public Map<String, String> selectDriverOne(int memberNum) {
		return session.selectOne("driver.selectDriverOne",memberNum);
	}

	@Override
	public List<Map<String, String>> selectCarImg(String carNum) {
		return session.selectList("driver.selectCarImg",carNum);
	}

	@Override
	public int updateStatus(Map<String, Object> map) {
		
		System.out.println("테스트 확인"+map.get("driverStatus"));
		System.out.println("번호 확인"+map.get("memberNum"));
		
		return session.update("driver.updateStatus",map);
	}

	@Override
	public int deleteDriver(int memberNum) {
		return session.delete("driver.deleteDriver",memberNum);
	}
	
	
	
	//드라이버가 등록한 카풀리스트 
	@Override
	public List<Map<String, String>> selectDriverCarPool(int memberNum) {
		return session.selectList("driver.selectDriverCarpool",memberNum);
	}

	@Override
	public List<Map<String, String>> selectDriverPas(Map<String, String> m) {
		return session.selectList("driver.selectDriverPas",m);
	}

	@Override
	public int updatePasOk(Map<String,Integer> map) {
		return session.update("driver.updatePasOk",map);
	}
	
	@Override
	public int updatePasNo(Map<String,Integer> map) {
		return session.update("driver.updatePasNo",map);
	}
}
