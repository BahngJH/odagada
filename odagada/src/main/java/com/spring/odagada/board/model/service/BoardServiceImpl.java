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
	public int allBlackCount() {
		// TODO Auto-generated method stub
		return dao.allBlackCount();
	}

	@Override
	public int allNotifyCount() {
		// TODO Auto-generated method stub
		return dao.allNotifyCount();
	}

	@Override
	public List<Map<String, String>> blackList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.blackList(cPage,numPerPage);
	}

	@Override
	public int checkBlackList(String checkId) {
		// TODO Auto-generated method stub
		return dao.checkBlackList(checkId);
	}

	@Override
	public int insertBlack(Map<String, Object> bNotify) {
		// TODO Auto-generated method stub
		return dao.insertBlack(bNotify);
	}

	@Override
	public int deleteNotify(Map<String, Object> dNotify) {
		// TODO Auto-generated method stub
		return dao.deleteNotify(dNotify);
	}

	@Override
	public List<Map<String, String>> notifyList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.notifyList(cPage,numPerPage);
	}

	@Override
	public int searchListAll(Map<String, String> searchData) {
		// TODO Auto-generated method stub
		return dao.searchListAll(searchData);
	}

	@Override
	public List<Map<String, String>> searchList(Map<String, String> searchData,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.searchList(searchData,cPage,numPerPage);
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

	@Override
	public int selectQnaCount() {
		return dao.selectQnaCount();
	}
	
	@Override
	public int selectQnaComCount() {
		return dao.selectQnaComCount();
	}

	@Override
	public List<Map<String, String>> selectQnaList(int cPage, int numPerPage) {
		return dao.selectQnaList(cPage,numPerPage);
	}
	

	@Override
	public int insertQna(Map<String, Object> qna) {
		return dao.insertQna(qna);
	}

	@Override
	public Map<String, String> selectQnaOne(int qnaNum) {
		return dao.selectQnaOne(qnaNum);
	}

	@Override
	public List<Map<String, String>> selectQnaComList(int cPage, int numPerPage, int qnaNum) {
		return dao.selectQnaComList(cPage,numPerPage,qnaNum);
	}

	public int updateQna(Map<String, Object> qna) {
		return dao.updateQna(qna);
	}

	@Override
	public int deleteQna(int qnaNum) {
		return dao.deleteQna(qnaNum);
	}

	@Override
	public int insertQnaCom(Map<String, Object> comment) {
		return dao.insertQnaCom(comment);
	}

	@Override
	public Map<String, Object> selectQnaComOne(int commentNum) {
		return dao.selectQnaComOne(commentNum);
	}
	
	
	
	
	
	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
}
