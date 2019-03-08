package com.spring.odagada.carpool.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.odagada.carpool.model.service.CarpoolService;
import com.spring.odagada.carpool.model.vo.CarOption;
import com.spring.odagada.carpool.model.vo.Carpool;
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
	public ModelAndView carpoolSearchEnd(String kmNum,
			String memberNum,String startSearch, 
			String endSearch, String startDate, 
			String startLon, String startLat, 
			String endLon, String endLat)
	{
		ModelAndView mav = new ModelAndView();
		
		Map<String,String> m = new HashMap<String, String>();
		m.put("startCity", startSearch);
		m.put("endCity",endSearch);
		m.put("startDate", startDate);
		m.put("startLong", startLon);
		m.put("startLat",startLat);
		m.put("destLong",endLon);
		m.put("destLat",endLat);
		m.put("kmNum", kmNum);
		l.debug(startLon + " : " + startLat+" : "+endLon+":"+ endLat);
		//반경 구하기(default3)
		
		List<Carpool> carlist = service.selectCarpoolList(m);
		System.out.println(carlist);
		List driverList = dService.selectDriverList();
		System.out.println(driverList);
		
		mav.addObject("cList",carlist);
		mav.addObject("dList",driverList);
		mav.addObject("search", m);
		mav.setViewName("carpool/searchEnd");
		return mav;
		
	}
	
	@RequestMapping("/carpool/oneSearch.do")
	public ModelAndView carpoolOne(int carpoolnum) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("carpool/oneSearch");
		return mav;
	}
	
	@RequestMapping("/carpool/searchOption")
	public void carpoolSearchOption(HttpServletRequest req,
			HttpServletResponse res,
			CarOption option,
			String kmNum,
			String startLong,
			String startLat,
			String destLat,
			String destLong) throws ServletException, IOException 
	{
		l.debug(option.toString());
		ModelAndView mav = new ModelAndView();
		Map<String,String> map=new HashMap();
		if(option.getAnimal().equals("false")) {
			option.setAnimal("N");
			map.put("animal", option.getAnimal());
		}
		else {
			option.setAnimal("Y");
			map.put("animal", option.getAnimal());
		}
			
		if(option.getBaggage().equals("false")) {
			option.setBaggage("N");
			map.put("baggage", option.getBaggage());
		}
		else {
			option.setBaggage("Y");
			map.put("baggage", option.getBaggage());
		}
		if(option.getFood().equals("false")) {
			option.setFood("N");
			map.put("food", option.getFood());
		}
		else {
			option.setFood("Y");
			map.put("food", option.getFood());
		}
		if(option.getSmoking().equals("false")) {
			option.setSmoking("N");
			map.put("smoking", option.getSmoking());
		}
		else {
			option.setSmoking("Y");
			map.put("smoking", option.getSmoking());
		}
		if(option.getTeenage().equals("false")) {
			option.setTeenage("N");
			map.put("teenage", option.getTeenage());
		}
		else {
			option.setTeenage("Y");
			map.put("teenage", option.getTeenage());
		}
		if(option.getTalking().equals("false")) {
			option.setTalking("N");
			map.put("talking", option.getTalking());
		}
		else {
			option.setTalking("Y");
			map.put("talking", option.getTalking());
		}
		if(option.getMusic().equals("false")) {
			option.setMusic("N");
			map.put("music", option.getMusic());
		}
		else {
			option.setMusic("Y");
			map.put("music", option.getMusic());
		}
		
		map.put("animal", option.getAnimal());
		map.put("baggage", option.getBaggage());
		map.put("food", option.getFood());
		map.put("smoking", option.getSmoking());
		map.put("teenage", option.getTeenage());
		map.put("talking", option.getTalking());
		map.put("music", option.getMusic());
		map.put("seatcount",Integer.toString(option.getSeatcount()));
		map.put("gender", option.getGender());
		map.put("kmNum", kmNum);
		map.put("startLat", startLat);
		map.put("startLong", startLong);
		map.put("destLat", destLat);
		map.put("destLong", destLong);
		
		l.debug(map.toString());
		
		List<Map<String,String>> cList = service.selectCarOptionList(map);
		req.setAttribute("cList", cList);
		req.getRequestDispatcher("/WEB-INF/views/carpool/search-fixed.jsp").forward(req, res);
	}
}
