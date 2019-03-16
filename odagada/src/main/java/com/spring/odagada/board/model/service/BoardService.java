package com.spring.odagada.board.model.service;

import java.util.List;
import java.util.Map;

public interface BoardService {
	int allBlackCount();
	int allNotifyCount();
	List<Map<String,String>> blackList(int cPage, int numPerPage);
	int checkBlackList(String checkId);
	int insertBlack(Map<String,Object> bNotify);
	int deleteNotify(Map<String,Object> dNotify);
	List<Map<String,String>> notifyList(int cPage, int numPerPage);
	int searchListAll(Map<String, String> searchData);
	List<Map<String,String>>searchList(Map<String,String> searchData, int cPage,int numPerPage);
	int selectAllMemberCount();
	List<Map<String,String>> memberList(int cPage, int numPerPage);
	int selectBoardCount();
	List<Map<String,String>> selectBoardList(int cPage,int numPerPage);
	Map<String,String> selectBoard(int boardNo);
	int updateBoardCount(int boardNo);
	int insertBoard(Map<String,String> board);
	int updateBoard(Map<String,Object> board);
	int deleteBoard(int boardNo);
	
	int selectQnaCount();
	List<Map<String,String>> selectQnaList(int cPage,int numPerPage);
	Map<String,String> selectQnaOne(int qnaNum);
	/*List<Map<String,String>> selectQnaList(int qna)*/
}
