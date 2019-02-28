package com.spring.odagada.carpool.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CarpoolController {

	@RequestMapping("/carpool/register")
	public ModelAndView carpoolRegister() {
		ModelAndView mav = new ModelAndView("/carpool/register");	
		
		return mav;
	}
}
