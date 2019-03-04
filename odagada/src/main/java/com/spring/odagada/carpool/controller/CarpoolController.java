package com.spring.odagada.carpool.controller;

import java.sql.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CarpoolController {

	private Logger l = LoggerFactory.getLogger(CarpoolController.class);
			
	@RequestMapping("/carpool/register")
	public ModelAndView carpoolRegister() {
		ModelAndView mav = new ModelAndView("/carpool/register");	
		
		return mav;
	}
	
	@RequestMapping("/carpool/registerEnd")
	public ModelAndView carpoolRegisterEnd(String startLocation, String destLocation, String startDate, String endDate) {
		ModelAndView mav = new ModelAndView();
		
		l.debug("시작위치: " + startLocation);
		l.debug("도착위치: " + destLocation);
		l.debug("시작날짜: " + startDate);
		l.debug("도착날짜: " + endDate);
		
		
		return mav;
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
		l.debug(startSearch+" "+endSearch+" "+startDate);
		mav.setViewName("carpool/searchEnd");
		return mav;
		
	}
}
