package com.spring.odagada.driver.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.odagada.driver.model.service.DriverService;

@Controller
public class DriverController {
	@Autowired
	DriverService service;
}
