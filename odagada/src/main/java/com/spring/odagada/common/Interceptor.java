package com.spring.odagada.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.odagada.member.model.vo.Member;

public class Interceptor extends HandlerInterceptorAdapter {

	private Logger logger=LoggerFactory.getLogger(Interceptor.class);
	
	//드라이버 익셉션(email, phone 인증 안 했을 경우, 드라이버 등록 못하게 막음.)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
				
		Member m=(Member)request.getSession().getAttribute("logined");
		
		if(m== null) {
			request.setAttribute("msg", "로그인 해주세요.");
			request.setAttribute("loc", "/member/loginForm2.do");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false;
		}
		 
			
		if(!(m.getIsEmailAuth().equals("Y")&&m.getIsPhoneAuth().equals("Y"))){
			request.setAttribute("msg", "마이페이지-나의 정보에서 E-mail, phone 인증 후 이용하실 수 있습니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false;
		}				
		return super.preHandle(request, response, handler);
	}
}



