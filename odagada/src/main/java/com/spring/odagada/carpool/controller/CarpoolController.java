package com.spring.odagada.carpool.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.odagada.carpool.model.service.CarpoolService;
import com.spring.odagada.carpool.model.vo.Carpool;
import com.spring.odagada.carpool.model.vo.Option;
import com.spring.odagada.driver.model.service.DriverService;
import com.spring.odagada.driver.model.vo.Driver;
import com.spring.odagada.member.model.vo.Member;

@Controller
public class CarpoolController {

	@Autowired
	CarpoolService service;
	@Autowired
	DriverService dService;
	
	
	private Logger l = LoggerFactory.getLogger(CarpoolController.class);
			
	@RequestMapping("/carpool/register")
	public ModelAndView carpoolRegister(HttpSession session) {
		Member m = (Member) session.getAttribute("logined");
		ModelAndView mav = new ModelAndView();	

		l.debug("로그인 정보 : " + m);
		
		if(m != null) {
			Driver d = dService.selectOne(m.getMemberNum());
			l.debug("드라이버 정보: " + d);
			
			if(d == null) {
				l.debug("드라이버 등록 필요");
				mav.setViewName("/");
				return mav;
			}else {
				mav.setViewName("/carpool/register");
				return mav;
			}
			
		}else {
			l.debug("로그인 필요");
			mav.setViewName("/common/msg");
			mav.addObject("msg", "로그인 해주세요.");
			mav.addObject("loc", "/member/loginForm.do");
			return mav;
		}
		
		
		
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
