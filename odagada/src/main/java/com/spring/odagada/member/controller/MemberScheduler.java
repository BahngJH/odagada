package com.spring.odagada.member.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.odagada.member.model.service.MemberService;

@Controller
public class MemberScheduler {
	private Logger logger=LoggerFactory.getLogger(MemberScheduler.class);
	@Autowired
	MemberService service;
		
	/*@Scheduled(cron="0 0 12 1/1 * ?")
	public void deleteLeaveMember() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//오늘 시간?
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, -14);
		service.deleteLeaveMember(sdf.format(cal.getTime()).toString());	
	}*/
	
	@Scheduled(cron="0/1 1/1 * 1/1 * ? ")//1초마다 계산. 테스트용*/
	/*@Scheduled(cron="0 0 12 1/1 * ?")*/
	public void deleteLeaveMember() {
		service.deleteLeaveMember();		
	}


}
