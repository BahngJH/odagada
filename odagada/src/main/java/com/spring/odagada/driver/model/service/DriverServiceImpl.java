package com.spring.odagada.driver.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.odagada.common.exception.BoardException;
import com.spring.odagada.driver.model.dao.DriverDao;
import com.spring.odagada.driver.model.vo.Driver;
import com.spring.odagada.driver.model.vo.CarImage;

@Service
public class DriverServiceImpl implements DriverService {
	@Autowired
	DriverDao dao;

	@Override
	public Driver selectOne(int memberNum) {
		return dao.selectOne(memberNum);
	}

	@Override
	public int enrollDriver(Map<String, Object> driver, List<CarImage> files) throws BoardException {

		int result=0;
		int boardNo = 0;
		try {
			result = dao.enrollDriver(driver);
			if(result ==0)
			{
				throw new BoardException("가입 실패");
			}
			for(CarImage cImg : files)
			{
				
				result = dao.insertCarImage(cImg);
				if(result==0) throw new BoardException("파일 업로드 실패");
			}
		}catch (Exception e) {
			throw e;
		}
		
		return result;
	}

	@Override
	public int selectJoinCount() {
		return dao.selectJoinCount();
	}

	@Override
	public List<Map<String, String>> selectDriverList(int cPage, int numPerPage) {
		return dao.selectDriverList(cPage,numPerPage);
	}

	@Override
	public Map<String, String> selectDriverOne(int memberNum) {
		return dao.selectDriverOne(memberNum);
	}

	@Override
	public List<Map<String, String>> selectCarImg(String carNum) {
		return dao.selectCarImg(carNum);
	}

	@Override
	public int updateStatus(Map<String, Object> map) {
		return dao.updateStatus(map);
	}

	@Override
	public int deleteDriver(int memberNum) {
		return dao.deleteDriver(memberNum);
	}
	
	
	
	//드라이버 카풀 등록 리스트
	@Override
	public List<Map<String, String>> selectDriverCarPool(int memberNum) {
		return dao.selectDriverCarPool(memberNum);
	}

	@Override
	public List<Map<String, String>> selectDriverPas(Map<String, String> m) {
		return dao.selectDriverPas(m);
	}
	
	
	
	
	
	
	
	
	
}
