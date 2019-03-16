package com.spring.odagada.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int allBlackCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.allBlackCount");
	}

	@Override
	public int allNotifyCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.allNotifyCount");
	}

	@Override
	public List<Map<String, String>> blackList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage); 
		return sqlSession.selectList("board.blackList",null,rb);
	}

	@Override
	public int checkBlackList(String checkId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.checkBlackList", checkId);
	}

	@Override
	public int insertBlack(Map<String, Object> bNotify) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.insertBlack", bNotify);
	}

	@Override
	public int deleteNotify(Map<String, Object> dNotify) {
		// TODO Auto-generated method stub
		return sqlSession.delete("board.deleteNotify",dNotify);
	}

	@Override
	public List<Map<String, String>> notifyList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage); 
		return sqlSession.selectList("board.notifyList",null,rb);
	}

	@Override
	public int searchListAll(Map<String, String> searchData) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.searchListAll", searchData);
	}

	@Override
	public List<Map<String, String>> searchList(Map<String, String> searchData,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage); 
		return sqlSession.selectList("board.searchList",searchData,rb);
	}

	@Override
	public int selectAllMemberCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.selectAllMemberCount");
	}

	@Override
	public List<Map<String, String>> memberList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage); 
		return sqlSession.selectList("board.memberList",null,rb);
		
	}

	@Override
	public int selectBoardCount() {
		return sqlSession.selectOne("board.selectBoardCount");
	}

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		
		return sqlSession.selectList("board.selectBoardList",null,rb);
	}

	@Override
	public Map<String, String> selectBoard(int boardNo) {
		return sqlSession.selectOne("board.selectBoard",boardNo);
	}

	@Override
	public int updateBoardCount(int boardNo) {
		return sqlSession.update("board.updateBoardCount",boardNo);
	}

	@Override
	public int insertBoard(Map<String, String> board) {
		return sqlSession.insert("board.insertBoard",board);
	}

	@Override
	public int updateBoard(Map<String,Object> board){
		return sqlSession.update("board.updateBoard",board);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return sqlSession.delete("board.deleteBoard",boardNo);
	}

	@Override
	public int selectQnaCount() {
		return sqlSession.selectOne("board.selectQnaCount");
	}

	@Override
	public List<Map<String, String>> selectQnaList(int cPage, int numPerPage) {
		
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		
		return sqlSession.selectList("board.selectQnaList",null,rb);
	}

	@Override
	public Map<String, String> selectQnaOne(int qnaNum) {
		return sqlSession.selectOne("board.selectQnaOne",qnaNum);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
