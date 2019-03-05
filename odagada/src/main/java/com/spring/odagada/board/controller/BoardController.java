package com.spring.odagada.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping("/board/boardView.do")
	public ModelAndView boardView(int boardNo,HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv = new ModelAndView();
		//int bCount;
	
		Cookie[] cookies = request.getCookies();
		Map cookiesMap = new HashMap();
		
		if(cookies!=null)
		{
			for(int i=0;i<cookies.length;i++)
			{
				Cookie obj = cookies[i];
				cookiesMap.put(obj.getName(), obj.getValue());
			}
		}
		
		String readCount = (String)cookiesMap.get("read_count");
		String newReadCount = "|"+boardNo;
		
		if(StringUtils.indexOfIgnoreCase(readCount, newReadCount) == -1)
		{
			Cookie cookie = new Cookie("read_count",readCount+newReadCount);
			
			response.addCookie(cookie);
			this.service.updateBoardCount(boardNo);
		}
		
		Map<String,String> map = this.service.selectBoard(boardNo);
		
/*		Cookie[] cookies = request.getCookies();
		String boardCookieVal="";
		boolean hasRead = false;
		
		if(cookies!=null)
		{
			outer:
				for(Cookie c : cookies)
				{
					String name = c.getName();
					String value = c.getValue();
					if("boardCookie".equals(name))
					{
						boardCookieVal = value;
						if(value.contains("|"+boardNo+"|"))
						{
							hasRead = true;
						}
						break outer;
					}
				}			
		}
		if(!hasRead)
		{
			Cookie boardCookie = new Cookie("boardCookie",boardCookieVal+"|"+boardNo+"");
			boardCookie.setMaxAge(-1);
			response.addCookie(boardCookie);
		}*/
		
		mv.addObject("board",map);
		//mv.addObject("bCount",bCount);
		mv.setViewName("board/boardView");
		
		return mv;		
	}
	
/*	@RequestMapping("/board/insertBoard")
	public ModelAndView insertBoard()
	{
		
	}*/
	
	

}
