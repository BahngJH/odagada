package com.spring.odagada.carpool.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.odagada.carpool.model.service.CarpoolService;
import com.spring.odagada.carpool.model.vo.Carpool;
import com.spring.odagada.carpool.model.vo.Option;

@Controller
public class CarpoolController {

	@Autowired
	CarpoolService service;
	
	
	private Logger l = LoggerFactory.getLogger(CarpoolController.class);
			
	@RequestMapping("/carpool/register")
	public ModelAndView carpoolRegister() {
		ModelAndView mav = new ModelAndView("/carpool/register");	
		
		return mav;
	}

	
	@RequestMapping("/carpool/registerEnd")
	public String carpoolRegisterEnd(Carpool carpool, Option option) {
		
		l.debug(carpool.toString());
		l.debug(option.toString());
				
		return "redirect:/";
	}
	
	@RequestMapping("/carpool/search.do")
	public ModelAndView carpoolSearch() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("carpool/search");
		return mav;
	}
	@RequestMapping("/carpool/searchEnd.do")
	public ModelAndView carpoolSearchEnd(String startSearch, String endSearch, String startDate){
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("carpool/searchEnd");
		return mav;
		
	}
}
