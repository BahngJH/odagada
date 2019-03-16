package com.spring.odagada.board.model.service;

import java.util.List;
import java.util.Map;

public interface BoardService {
	
	int selectBoardCount();
	List<Map<String,String>> selectBoardList(int cPage,int numPerPage);
	Map<String,String> selectBoard(int boardNo);
	int updateBoardCount(int boardNo);
	int insertBoard(Map<String,String> board);
	int updateBoard(Map<String,Object> board);
	int deleteBoard(int boardNo);
	
	int selectQnaCount();
	int selectQnaComCount();
	List<Map<String,String>> selectQnaList(int cPage,int numPerPage);
	int insertQna(Map<String,Object> qna);
	Map<String,String> selectQnaOne(int qnaNum);
	List<Map<String,String>> selectQnaComOne(int cPage,int numPerPage,int qnaNum);
	int updateQna(Map<String,Object> qna);
	int deleteQna(int qnaNum);
}
