package com.spring.odagada.board.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.odagada.board.model.service.BoardService;

@Controller
public class BoardController {
	
	private Logger logger = Logger.getLogger(BoardController.class);
	
	@Autowired
	BoardService service;

}
