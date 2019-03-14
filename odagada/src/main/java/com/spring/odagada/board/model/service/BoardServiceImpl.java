package com.spring.odagada.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.odagada.board.model.dao.BoardDao;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;

	@Override
	public List<Map<String, String>> searchList(Map<String, String> searchData) {
		// TODO Auto-generated method stub
		return dao.searchList(searchData);
	}

	@Override
	public int selectAllMemberCount() {
		// TODO Auto-generated method stub
		return dao.selectAllMemberCount();
	}

	@Override
	public List<Map<String, String>> memberList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.memberList(cPage,numPerPage);
	}

	@Override
	public int selectBoardCount() {
		return dao.selectBoardCount();
	}

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		return dao.selectBoardList(cPage,numPerPage);
	}

	@Override
	public Map<String, String> selectBoard(int boardNo) {
		return dao.selectBoard(boardNo);
	}

	@Override
	public int updateBoardCount(int boardNo) {
		return dao.updateBoardCount(boardNo);
	}

	@Override
	public int insertBoard(Map<String, String> board) {
		return dao.insertBoard(board);
	}

	@Override
	public int updateBoard(Map<String,Object> board){
		return dao.updateBoard(board);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return dao.deleteBoard(boardNo);
	}
	
	
	
	
	
	
	
	
	
}
