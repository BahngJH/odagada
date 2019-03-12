package com.spring.odagada.common.aop;

import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component //bean 객체 등록(어노테이션)
@Aspect //aop 객체
public class UnAuthAspect {
	private Logger logger=LoggerFactory.getLogger(UnAuthAspect.class);

/*	@Around("execution(* com.spring.odagada.member.controller)")
	public boolean preHandle() { 
		
	}
	*/
}
