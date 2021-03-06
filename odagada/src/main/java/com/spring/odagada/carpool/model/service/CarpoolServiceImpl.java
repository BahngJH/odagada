package com.spring.odagada.carpool.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.odagada.carpool.model.dao.CarpoolDao;
import com.spring.odagada.carpool.model.vo.Carpool;
import com.spring.odagada.carpool.model.vo.CarOption;

@Service
public class CarpoolServiceImpl implements CarpoolService {
	@Autowired
	CarpoolDao dao;

	private Logger l = LoggerFactory.getLogger(CarpoolServiceImpl.class);
	
	@Override
	public List<Map<String,String>> selectCarpoolList(Map<String, String> map,int cPage,int numPerPage) {
		return dao.selectCarpoolList(map,cPage,numPerPage);
	}

	@Transactional
	@Override
	public int insertCarpool(Carpool carpool, CarOption option) {
		
		int result = dao.insertCarpool(carpool);
		
		if (result == 0) {
			throw new RuntimeException();
		}
		
		option.setCarpoolNum(carpool.getCarpoolNum());
		
		result = dao.insertOption(option);
		
		return result;
	}

	@Override
	public List<Map<String,String>> selectCarOptionList(Map<String,String> map,int cPage,int numPerPage) {
		return dao.selectCarOptionList(map,cPage,numPerPage);
	}

	@Override
	public List<Map<String, String>> selectCarOneList(int carpoolNum) {
		return dao.selectCarOneList(carpoolNum);
	}

	@Override
	public List<Map<String, String>> selectPasList(int carpoolNum) {
		return dao.selectPasList(carpoolNum);
	}

	@Override
	public List<Map<String, String>> selectImageList(int mem) {
		return dao.selectImageList(mem);
	}

	@Override
	public List<Map<String, String>> selectReList(int dNum) {
		return dao.selectReList(dNum);
	}

	@Override
	public int insertPassenger(Map<String, Object> pass) {
		return dao.insertPassenger(pass);
	}
	
	public List<Map<String, String>> selectCarpoolList(int memberNum, int cPage, int numPerPage) {
		return dao.selectCarpoolList(memberNum, cPage, numPerPage);
	}

	@Override
	public int selectCarpoolCount(int memberNum) {
		return dao.selectCarpoolCount(memberNum);
	}

	@Override
	public List<Map<String, String>> selectPopList() {
		return dao.selectPopList();
	}
	
	@Override
	public void setCarpoolStatus(String nowDate) {
		dao.setCarpoolStatus(nowDate);
	}

	@Override
	public String getImpUid(Map<String, Integer> map) {
		return dao.getImpUid(map);
	}

	@Override
	public int updateCPayStatus(Map<String, Integer> map) {
		return dao.updateCPayStatus(map);
	}
}
