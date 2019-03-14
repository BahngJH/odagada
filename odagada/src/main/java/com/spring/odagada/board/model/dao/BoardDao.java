package com.spring.odagada.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


public interface BoardDao {
	List<Map<String,String>> memberList();
	int selectBoardCount();
	List<Map<String,String>> selectBoardList(int cPage,int numPerPage);
	Map<String,String> selectBoard(int boardNo);
	int updateBoardCount(int boardNo);
	int insertBoard(Map<String,String> board);
	int updateBoard(Map<String,Object> board);
	int deleteBoard(int boardNo);

}
