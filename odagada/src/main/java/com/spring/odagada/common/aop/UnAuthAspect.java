package com.spring.odagada.common.aop;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.odagada.member.model.vo.Member;

@Component //bean 객체 등록(어노테이션)
@Aspect //aop 객체
public class UnAuthAspect {
/*	private Logger logger=LoggerFactory.getLogger(UnAuthAspect.class);
	
	@Before("execution(* com.spring.odagada.driver..*(..))")
	public void startLog(JoinPoint jp)throws Exception {
		
		HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		request.getSession().getAttribute("logined");
		logger.debug("request 세션????"+request.getSession().getAttribute("logined"));
		logger.debug("1.전달되는 모든 파라미터들:"+Arrays.toString(jp.getArgs()));
		logger.debug("2.Adivce? 타입: "+jp.getKind());
		logger.debug("3.실행 대상 객체의 메소드 정보"+jp.getSignature().getName());
		
		ModelAndView mv=new ModelAndView();
		Member m=(Member)request.getSession().getAttribute("logined");
		String msg="";
		String loc="/";
		
		try {
			if(m!=null) {
				if(m.getIsPhoneAuth().equals("Y")&&m.getIsEmailAuth().equals("Y")) {
					logger.debug("당신은 모든 인증 완료했음."+m);
					mv.setViewName("driver/driverEnroll");
					return mv;
				}else {			
					logger.debug("둘 중 하나만 인증했음."+m);
					mv.addObject("Email, 핸드폰 인증후 이용 바랍니다.",msg);		
					mv.addObject("loc", loc);
					mv.setViewName("common/msg");
					return mv;
				}		
		}catch{
			
		}
	}
		return mv;*/
}

/*	@Around("execution(* com.spring.odagada.driver.*.*(..))")
	public Object preHandle(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable {
		
		Member m=(Member)session.getAttribute("logined");
		Signature signature=joinPoint.getSignature();
		String type=signature.getDeclaringTypeName();
		String methodName=signature.getName();
		if(m.getIsPhoneAuth().equals("N")) {
			return true;
		}else {
			return false;
		}
		
		String componentName="";
		if(type.indexOf("Controller")>-1) {
			componentName="Controller \t : ";
		}else if(type.indexOf("Service")>-1) {
			componentName="Service \t : ";
		}else if(type.indexOf("Dao")>-1) {
			componentName="Dao \t: ";
		}
		Object obj=joinPoint.proceed();
		return obj;
	}*/
	

