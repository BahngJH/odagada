package com.spring.odagada;

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
import com.spring.odagada.driver.model.service.DriverService;
import com.spring.odagada.member.model.vo.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	CarpoolService cService;
	
	@Autowired
	DriverService dService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/carpool")
	public ModelAndView home(ModelAndView mav,HttpSession session) {
		Member m = (Member)session.getAttribute("logined");
		if(m!=null) {
			Map<String,String> dList = dService.selectDriverOne(m.getMemberNum()); 
			mav.addObject("dList",dList);
		}
		List<Map<String,String>> chList = cService.selectPopList();
		mav.addObject("chList",chList);
		mav.setViewName("home");
		return mav;
	}
	
}
