package com.spring.odagada.carpool.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.spring.odagada.carpool.model.service.CarpoolService;

public class CarpoolScheduler {
	@Autowired
	CarpoolService service;
	
	private Logger l = LoggerFactory.getLogger(CarpoolScheduler.class);
	
	@Scheduled(cron="0 0 0/1 1/1 * ?")
	public void setCarpoolStatus() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd. a h:mm");
		Calendar cal = Calendar.getInstance();
		l.debug(sdf.format(cal.getTime()).toString());
		service.setCarpoolStatus(sdf.format(cal.getTime()).toString());
	}
}
