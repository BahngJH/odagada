package com.spring.odagada.driver.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
import com.spring.odagada.driver.model.vo.CarImage;
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
         int memberNum = m.getMemberNum();      
         Driver driver = service.selectOne(memberNum);   
         
         if(driver!=null)
         {
            mv.setViewName("/common/msg");
            mv.addObject("msg","드라이버 등록되어있습니다.");
            mv.addObject("loc","/");
            
            return mv;
         }
         else {
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
            mv.addObject("driver",driver);
            mv.setViewName("driver/driverEnroll");
            
            
            logger.debug("드라이버 있나요"+driver);
            return mv;
         }         
      }
      else {
         mv.setViewName("/common/msg");
         mv.addObject("msg","회원가입 후 이용해주세요.");
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

      
      ArrayList<CarImage> files = new ArrayList();
      
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
         CarImage cImg = new CarImage();
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
        int numPerPage = 5;   
        int contentCount = service.selectJoinCount();     
            
         List<Map<String,String>> list = service.selectDriverList(cPage,numPerPage);
         mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage,"/odagada/driver/driverList"));
        
         mv.addObject("list",list);
         mv.setViewName("driver/driverJoinList");         
            
         return mv;         
      }
    
    @RequestMapping("/driver/driverForm")
    public ModelAndView driverForm(int memberNum,String carNum)
    {
       System.out.println("여깅하ㅏ하하하하ㅏㅎ"+memberNum+" :"+carNum);
       ModelAndView mv = new ModelAndView();
       Map<String,String> map = service.selectDriverOne(memberNum);
       List<Map<String,String>> carImg = service.selectCarImg(carNum);
       
       String a = map.get("LICENSENUM").substring(0, 3);
       String b = "**-******";
       String c = map.get("LICENSENUM").substring(13);
       
       String licenseNum = a+b+c;
   
      carImg.get(0).put("active", "active");
       
       mv.addObject("driver",map);
       mv.addObject("carImg", carImg);
       mv.addObject("licenseNum",licenseNum);
       mv.setViewName("driver/driverForm");
       
       logger.info("리턴 전"+map);
       
       return mv;
    }
   @RequestMapping("/driver/driverFormEnd")
   public String driverFormEnd(Driver driver,HttpServletRequest request,@RequestParam(value="driverStatus") String driverStatus,@RequestParam(value="memberNum") int memberNum)
   {
      Driver d = service.selectOne(memberNum);
      String licenseNum = d.getLicenseNum();
      
      logger.debug("넘버= "+memberNum);
      logger.debug("드라이버수락여부 = "+driverStatus);
      logger.debug("면허 확인"+licenseNum);
      logger.debug("멤버 = "+driver);
      
      Map<String,Object> map = new HashMap<String,Object>();
         map.put("memberNum", memberNum);
         
      if(driverStatus.equals("N"))
      {
         driverStatus = "Y";
         map.put("driverStatus", driverStatus);
         int result = service.updateStatus(map);
      }
      
      return "redirect: driverList";
      
   }
   
   @RequestMapping("driver/driverRefuse")
   public String deleteDriver(@RequestParam(value="memberNum") int memberNum)
   {
      int result = service.deleteDriver(memberNum);
      
      return "redirect: driverList";
   }
   
    //드라이버 자신이 등록한 카풀 리스트 보기- 정하
    @RequestMapping("/driver/driverCarpool")
    public ModelAndView selectDriverCarpool(HttpSession session) {
       ModelAndView mav = new ModelAndView();
       Member m = (Member) session.getAttribute("logined");
       List<Map<String,String>> dcarList = service.selectDriverCarPool(m.getMemberNum());
       mav.addObject("dcarList",dcarList);
       mav.setViewName("member/driverCarpool");
        return mav;
    }
    
    //드라이버가 동승중인 이용객 보기
    @RequestMapping("/driver/selectDriverPas")
    public ModelAndView selectDriverPas(String driverNum,String carpoolNum){
       ModelAndView mav = new ModelAndView();
       Map<String,String> m = new HashMap();
       m.put("driverNum", driverNum);
       m.put("carpoolNum", carpoolNum);
       List<Map<String,String>> dList =service.selectDriverPas(m);
       logger.debug(""+dList);
       mav.addObject("dList",dList);
       mav.setViewName("member/passengerCk");
       return mav; 
    }

   
}