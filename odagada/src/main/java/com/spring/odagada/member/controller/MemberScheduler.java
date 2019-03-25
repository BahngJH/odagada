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
	
	@RequestMapping("member/do")
	@Scheduled(cron="0 0 12 1/1 * ?")
	public void deleteLeaveMember() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd. a h:mm");
		Calendar cal = Calendar.getInstance();
		logger.debug("sdf가 뭐에요?"+sdf);
		logger.debug("cal뭐에요?"+cal);
		logger.debug(sdf.format(cal.getTime()).toString());
		
		service.deleteLeaveMember(sdf.format(cal.getTime()).toString());
		
	}

}
