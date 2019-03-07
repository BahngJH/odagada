package com.spring.odagada.carpool.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.odagada.carpool.model.service.CarpoolService;
import com.spring.odagada.carpool.model.vo.Carpool;
import com.spring.odagada.carpool.model.vo.CarOption;
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
	public String carpoolRegisterEnd(HttpSession session, Carpool carpool, CarOption option) {
		Member m = (Member) session.getAttribute("logined");
		carpool.setMemberNum(m.getMemberNum());
		
		//넘어오지 않은 옵션 값 세팅
		option = setOption(option);
				
		l.debug(carpool.toString());
		l.debug(option.toString());
		
		int result = service.insertCarpool(carpool, option);
		
		return "redirect:/";
	}
	
	private CarOption setOption(CarOption option) {
		if(option.getAnimal() == null) {
			option.setAnimal("N");
		}
		if(option.getBaggage() == null) {
			option.setBaggage("N");
		}
		if(option.getFood() == null) {
			option.setFood("N");
		}
		if(option.getSmoking() == null) {
			option.setSmoking("N");
		}
		if(option.getTeenage() == null) {
			option.setTeenage("N");
		}
		if(option.getTalking() == null) {
			option.setTalking("N");
		}
		if(option.getMusic() == null) {
			option.setMusic("N");
		}
		
		return option;
	}
	
	@RequestMapping("/carpool/search.do")
	public ModelAndView carpoolSearch() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("carpool/search");
		return mav;
	}
	@RequestMapping("/carpool/searchEnd.do")
	public ModelAndView wcarpoolSearchEnd(String memberNum,String startSearch, String endSearch, String startDate, String startLon, String startLat, String endLon, String endLat){
		ModelAndView mav = new ModelAndView();
		
		Map<String,String> m = new HashMap<String, String>();
		m.put("startCity", startSearch);
		m.put("endCity",endSearch);
		m.put("startDate", startDate);
		m.put("startLong", startLon);
		m.put("startLat",startLat);
		m.put("destLong",endLon);
		m.put("destLat",endLat);
		
		List<Carpool> carlist = service.selectCarpoolList(m);
		System.out.println(carlist);
		List driverList = dService.selectDriverList();
		System.out.println(driverList);
		
		mav.addObject("cList",carlist);
		mav.addObject("dList",driverList);
		mav.addObject("startSearch",startSearch);
		mav.addObject("endSearch",endSearch);
		mav.addObject("startDate",startDate);
		mav.addObject("startLong", startLon);
		mav.addObject("startLat",startLat);
		mav.addObject("destLong",endLon);
		mav.addObject("destLat",endLat);
		mav.setViewName("carpool/searchEnd");
		return mav;
		
	}
	
	@RequestMapping("/carpool/oneSearch.do")
	public ModelAndView carpoolOne(int carpoolnum) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("carpool/oneSearch");
		return mav;
	}
}
