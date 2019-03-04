package com.spring.odagada.board.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.odagada.board.model.service.BoardService;
import com.spring.odagada.common.PageFactory;

@Controller
public class BoardController {
	
	private Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService service;
	
	@RequestMapping("/board/boardList")
	public ModelAndView noticeList(@RequestParam(value="cPage", required=false, defaultValue="0")int cPage)
	{
		ModelAndView mv = new ModelAndView();
		int contentCount = service.selectBoardCount();
		int numPerPage = 5;
		
		List<Map<String,String>> list = service.selectBoardList(cPage,numPerPage);
		mv.addObject("pageBar",PageFactory.getpageBar(contentCount, cPage, numPerPage,"/odagada/board/boardList"));
		mv.addObject("list",list);
		mv.setViewName("board/boardList");
		
		
		return mv;
	}

}
