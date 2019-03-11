package com.spring.odagada.driver.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.odagada.common.PageFactory;
import com.spring.odagada.common.exception.BoardException;
import com.spring.odagada.driver.model.service.DriverService;
import com.spring.odagada.driver.model.vo.Driver;
import com.spring.odagada.driver.model.vo.carImage;
import com.spring.odagada.member.model.service.MemberService;
import com.spring.odagada.member.model.vo.Member;

@Controller
public class DriverController {
	
	private Logger logger = LoggerFactory.getLogger(DriverController.class);
	
	@Autowired
	DriverService service;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/driver/driverEnroll")
	public ModelAndView driverEnroll(HttpSession session) {
		
		Member m = (Member) session.getAttribute("logined");
		ModelAndView mv = new ModelAndView();
		
		
		if(m!=null)
		{
			
			logger.debug("회원정보"+m);
			logger.debug("앞자리 테스트"+m.getPhone().substring(0,3));
			if(m.getPhone().length()==11)
			{
				logger.debug("나머지테스트"+m.getPhone().substring(3,11));
			}
			else if(m.getPhone().length()==10)
			{
				logger.debug("나머지테스트"+m.getPhone().substring(3,10));
			}
			
			mv.setViewName("driver/driverEnroll");
			
			return mv;
		}
		else {
			mv.setViewName("/common/msg");
			mv.addObject("msg","로그인 후 이용해주세요");
			mv.addObject("loc","/member/loginForm.do");
			
			return mv;
		}
	}
	// 파일에 대한 사이즈를 비교? 배열로 넘...ㄱ...ㅣ....ㅁ..
	
	@RequestMapping("/driver/driverEnrollEnd")
	public String driverEnrollEnd(HttpServletRequest request,MultipartFile[] upFile) throws BoardException
	{
		int memberNum = Integer.parseInt(request.getParameter("memberNum"));
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String birth = request.getParameter("birth");
		
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone = phone1+phone2;
		
		String licenseNum = request.getParameter("licenseNum");
		String carModel = request.getParameter("carModel");
		String carNum = request.getParameter("carNum");
		String driver_info = request.getParameter("driver_info");
		
		int imgOrder = 0;
		
		logger.debug("멤버번호 테스트"+memberNum);
		
		
		Map<String,Object> driver = new HashMap();
		driver.put("memberNum", memberNum);
		driver.put("licenseNum", licenseNum);
		driver.put("carModel", carModel);
		driver.put("carNum",carNum);
		driver.put("driver_info", driver_info);

		
		ArrayList<carImage> files = new ArrayList();
		
		String savDir = request.getSession().getServletContext().getRealPath("/resources/upload/car");
		
		for(MultipartFile f : upFile) {
		
			//파일명을 생성(rename)
			String oriFileName = f.getOriginalFilename();
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
			//rename 규칙설정
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rdv = (int)(Math.random()*1000);
			String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
			//파일을 저장해보쟈
			try {
				f.transferTo(new File(savDir+"/"+reName));
			}catch(IllegalStateException | IOException e)
			{
				e.printStackTrace();
			}
			imgOrder = imgOrder+1;
			carImage cImg = new carImage();
			cImg.setCarImageOri(oriFileName);
			cImg.setCarImageRe(reName);
			logger.debug("자동차 번호 "+carNum);
			cImg.setCarNum(carNum);
			cImg.setImageOrder(imgOrder);
			files.add(cImg);

		}
		
		int result = service.enrollDriver(driver,files);
		
		logger.debug("파일 확인"+files);
		
		return "redirect:/";
	}
	
	 @RequestMapping("/driver/driverList")
	   public ModelAndView driverList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage,HttpSession session)
	   {
		   
		  Member m = (Member) session.getAttribute("logined");
		  ModelAndView mv = new ModelAndView();
		 
	  
			  int contentCount = service.selectJoinCount();
		      int numPerPage = 5;   
		      
		      List<Map<String,String>> list = service.selectDriverList(cPage,numPerPage);
		      mv.addObject("pageBar",PageFactory.getpageBar(contentCount, cPage, numPerPage,"/odagada/driver/driverJoinList"));
		      mv.addObject("list",list);
		      mv.setViewName("driver/driverJoinList");	      
		      
		      return mv;
	      
	   }
	
}
