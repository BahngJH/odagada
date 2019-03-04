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
	
	
	
	
	
	
	
	
	
}
