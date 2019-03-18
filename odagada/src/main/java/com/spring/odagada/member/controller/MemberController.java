package com.spring.odagada.member.controller;


import static com.spring.odagada.common.PageFactory.getPageBar;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.odagada.carpool.model.service.CarpoolService;
import com.spring.odagada.driver.model.service.DriverService;
import com.spring.odagada.member.model.service.MemberService;
import com.spring.odagada.member.model.vo.Member;

@SessionAttributes("logined")
@Controller
public class MemberController {
	
	private Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService service;
	
	@Autowired
	CarpoolService cService;
	
	@Autowired
	DriverService dService;
	
	//비밀번호 암호화 처리
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	

	//email 중복확인
	@ResponseBody
	@RequestMapping("/member/checkEmail.do")
	public String checkEmail(String email) {
		logger.debug("받아오는 메일:"+email);
		int emailNum=service.checkEmail(email);
		String result="";
		if(emailNum==0) {
			result="ok";
		}else {
			result="no";
		}
		return result;
	}
			
	//아이디 중복확인
	@RequestMapping("/member/checkId.do")
	public ModelAndView checkId(String memberId, ModelAndView mv) throws UnsupportedEncodingException
	{
		Map map=new HashMap();
		boolean isId=service.checkId(memberId)==0?false:true;
		map.put("isId", isId);
		
		mv.addAllObjects(map);
		mv.addObject("char",URLEncoder.encode("문자열","UTF-8"));
		mv.addObject("num",1);
		mv.setViewName("jsonView");
		return mv;	
	}
	
	//회원가입페이지 전환
	@RequestMapping("/member/signUp.do")
	public String signUp() {
		return "member/signUpForm";
	}

	//회원가입
	@RequestMapping("/member/signUpEnd.do")
	public String signUpEnd(Model model, Member m, HttpServletRequest request, MultipartFile upFile) throws Exception {		
		logger.debug("뉴비: "+m);
		//암호화 전 패스워드
		String oriPw=m.getMemberPw();
		logger.debug("암호화 전:"+oriPw);
		logger.debug("암호화 후: "+pwEncoder.encode(oriPw));	
		m.setMemberPw(pwEncoder.encode(oriPw));		
		//메일주소
		String email1=request.getParameter("email1");
		String email2=request.getParameter("email2");
		String email=email1+"@"+email2;	
		m.setEmail(email);			
		//전화번호
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		String phone=phone1+phone2;
		m.setPhone(phone);		
		//프로필 사진 저장되는 장소
		String sd=request.getSession().getServletContext().getRealPath("/resources/upload/profile");

		ModelAndView mv=new ModelAndView();
		
		if(!upFile.isEmpty()) {
			//파일명 생성(ReName)
			String oriFileName=upFile.getOriginalFilename();
			String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
			
			//rename 규칙
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rdv=(int)(Math.random()*1000);
			String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
			
			//profile 사진 저장
			try {
				upFile.transferTo(new File(sd+"/"+reName));
			}catch(IllegalStateException | IOException e){
				e.printStackTrace();
			}		
			m.setProfileImageOri(oriFileName);
			m.setProfileImageRe(reName);					
		}
		service.insertMember(m);

		String msg="회원가입이 완료되었습니다. 이용하시려면 인증 메일을 확인해주세요.";
		String loc="/";
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";		
	}
	

	 //이메일 인증 완료 업데이트
    @RequestMapping(value = "/emailConfirm.do", method = RequestMethod.GET)
    public ModelAndView emailConfirm(String email, String memberId) {
    	Map<String, String>map=new HashMap();
    	
    	//컨트롤러 실행되므로 Y 값 넣어서 보내줘도 되고, 쿼리문으로 Y 업데이트 시켜도 된다.
    	map.put("isEmailAuth", "Y");
    	map.put("email", email);
    	map.put("memberId", memberId);
               
        int result=service.updateStatus(map);  
        ModelAndView mv=new ModelAndView();
        
        String msg="";
		String loc="/";
		
		logger.debug("이메일 상태 업데이트의 결과??"+result);
        if(result>0) {
        	msg="이메일 인증이 완료되었습니다.";
        }else {       	
        	mv.addObject("비정상적인 접근입니다.", msg);
        	mv.setViewName("redirect:/");
        }       
        mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("member/successAuth");
		return mv;
    }
    
	//로그인 페이지
	@RequestMapping("/member/loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}
	
	//로그인
   @RequestMapping("/member/login.do")
   public ModelAndView login(String memberId, String memberPw, Model model) {	   
	   Map<String, String>login=new HashMap();
	   login.put("memberId", memberId);
	   login.put("memberPw", memberPw);
	   
	   Map<String, String>result=service.login(login);
	   	   
	   ModelAndView mv=new ModelAndView();
	   
	   Member m=service.selectMember(memberId);   
	         
		if (m == null) {
			mv.addObject("msg", "등록된 정보가 없습니다.");
			mv.addObject("loc", "/member/loginForm.do");
			mv.setViewName("common/msg");
		} else {
			logger.debug("로그인 멤버 정보" + m);
			logger.debug("관리자 테스트" + m.getIsAdmin());
			if (result != null) {
				if (pwEncoder.matches(memberPw, result.get("MEMBERPW"))) {
					mv.addObject("logined", m);
					mv.setViewName("redirect:/");
				} else {
					mv.addObject("msg", "패스워드가 일치하지 않습니다.");
					mv.addObject("loc", "/member/loginForm.do");
					mv.setViewName("common/msg");
				}
			}
		}
		return mv;
	}

   
   //로그아웃(세션끊기)
   @RequestMapping("/member/logout.do")
   public String logout(SessionStatus status) {
	   	if(!status.isComplete()) {
	   		status.setComplete();
	   	}
	   	return "redirect:/";
   }
   
   //마이페이지 
   @RequestMapping("/member/myInfo.do")
   public ModelAndView myInfo(HttpSession session, ModelAndView mav) {
	   mav.setViewName("member/myInfo");
	   
	   Member m = (Member)session.getAttribute("logined");
	   
	   m = service.selectMember(m.getMemberId()); 
	   
	   mav.addObject("logined", m);
	   return mav;
   }

   
   //비밀번호 체크(ajax ...)
   @ResponseBody
   @RequestMapping("/member/checkPw.do")
   public String checkPw(HttpServletResponse response,String password, String answer, HttpSession session, SessionStatus status) {
	   logger.debug("받아오는 pw 값: "+password);
	   
	   Member m = (Member)session.getAttribute("logined");
	   String result="";
  
	   if(pwEncoder.matches(password, m.getMemberPw())) {
		   if(answer.equals("delete")) {
			   //delete 실행
			   int rs=service.deleteMember(m.getMemberNum());
			   
				if (rs != 0) {
					status.setComplete();
					result = "delete";
				} else {
					result = "noDelete";
				}
			} else {
				logger.debug("ok");
				result = "ok";
			}
		} else {
			logger.debug("no");
			result = "no";
		}
		return result;
	/*   try {
		   if(pwEncoder.matches(answer, m.getMemberPw()))
		      {
		         response.setContentType("text/csv;charset=UTF-8");
		         logger.debug("ok");
		         
		         response.getWriter().println("ok");
		      }
		      else {
		         response.setContentType("text/csv;charset=UTF-8");
		         logger.debug("no");
		         response.getWriter().println("no");
		      }
	   }
	   catch(IOException e)
	   {
		   e.printStackTrace();
	   }*/
   }

   //내 정보 변경페이지
   @RequestMapping("/member/updateInfo.do")
   public String updateInfo(Model model) {
	
	   return "member/updateForm";
   }
  
   //내 사진변경
   @RequestMapping("/member/updateProfile.do")
   public ModelAndView updateInfoEnd(HttpServletRequest request,HttpSession session, MultipartFile upFile) {
	   
	   logger.debug("넘어오는  파일?"+upFile);
		// 프로필 사진 저장되는 장소
		String sd = request.getSession().getServletContext().getRealPath("/resources/upload/profile");
		
		ModelAndView mv=new ModelAndView("common/msg");

		Member m=(Member)session.getAttribute("logined");
		
		//원래 있던 프로필 이미지 이름
		String oldFile = m.getProfileImageRe();
		
		if (!upFile.isEmpty()) {
			// 파일명 생성(ReName)
			String oriFileName = upFile.getOriginalFilename();
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));

			// rename 규칙
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rdv = (int) (Math.random() * 1000);
			String reName = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext;

			// profile 사진 저장
			try {
				upFile.transferTo(new File(sd + "/" + reName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			// 새로운 프로필 이미지 이름(Ori, Re)
			m.setProfileImageOri(oriFileName);
			m.setProfileImageRe(reName);
		}
		int result = service.updateMember(m);
		
		if (result > 0) {
			//원래 있던 프로필 이미지 삭제
			File file=new File(sd+"/"+oldFile);
			if(file.exists()) {
				file.delete();
				Member nM=service.selectMember(m.getMemberId());
				logger.debug("업데이트 된 : "+nM);
				mv.addObject("logined", nM);
			}
			mv.addObject("loc", "/member/updateInfo.do");
		} else {
			mv.addObject("msg", "사진수정 실패!");
			mv.addObject("loc", "/member/updateInfo.do");
		}
		return mv;		
   }
   
    //ID 찾기 화면
   @RequestMapping("/member/findId")
   public String findId() {
	   return "member/findId";
   }
   //ID 찾기
   @RequestMapping("/member/findId.do")
   public ModelAndView findIdEnd(String memberName, String email, Model model) {
	   ModelAndView mv=new ModelAndView();
	  
	   Map<String, String>findId=new HashMap();
	   findId.put("memberName", memberName);
	   findId.put("email", email);
	   
	   Map<String, String> id=service.findId(findId);

			if (id != null) {
				String resultId=id.get("MEMBERID");
				mv.addObject("memberId", resultId);
				mv.setViewName("member/resultId");
			} else {
				mv.addObject("msg", "회원 정보가 없습니다.");
				mv.addObject("loc", "/member/findId");
				mv.setViewName("common/msg");
			}
			return mv;
		}
 
	// 비밀번호 찾기 뷰
	@RequestMapping("/member/findPw")
	public String findPassword() {
		return "member/findPw";
	}
	
	// 비밀번호 찾기
	@RequestMapping("/member/findPw.do")
	public ModelAndView findPassword(String memberId, String email, String memberName) throws Exception {
		Map<String, String>info=new HashMap();
		info.put("memberId", memberId);
		info.put("email", email);
		info.put("memberName", memberName);
		
		Map<String, String>findPw=service.findPw(info);
		ModelAndView mv = new ModelAndView();
		
		String msg="";
		String loc="/";
		if(findPw!=null) {
			int ran=new Random().nextInt(100000)+1000;
			String sendPw=String.valueOf(ran);
			String dbPw=pwEncoder.encode(sendPw);
			info.put("memberPw", dbPw);
			info.put("sendPw", sendPw);
						
			service.sendPw(info);
			msg="등록하신 메일주소로 임시 비밀번호가 발송되었습니다.";
			mv.addObject("msg",msg);
			mv.addObject("loc",loc);
			mv.setViewName("common/msg");		
		}else {
			msg="일치하는 정보가 없습니다.";
			mv.addObject("msg", msg);
			mv.addObject("loc", "/member/findPw");		
		}	
		return mv;
	}
	
	//메일 인증하기
	@RequestMapping("/member/mailAuth")
	public String mailAuth(HttpSession session) throws Exception {
		Member m=(Member)session.getAttribute("logined");
		service.mailAuth(m);
		return "redirect:/";
	}
		

    @ResponseBody
    @RequestMapping("/member/smsCheck")
    public String smsCheck(HttpSession session, String code) {
    	Member m = (Member)session.getAttribute("logined");
    	
    	String saveCode = service.getPhoneCode(m.getMemberNum());
    	
    	if(pwEncoder.matches(code, saveCode)) {
    		int result = service.updateYPhoneStatus(m.getMemberNum());
    		
    		if(result > 0) {
    			return "ok";
    		}else {
    			return "no";
    		}
    	}else {
    		return "no";
    	}
    }
    
    //핸드폰 중복 확인
    @ResponseBody
    @RequestMapping("/member/phoneCheck.do")
    public String phoneCheck(String phone){
    	int result=service.checkPhone(phone);
    	String isPhone="";
    	if(result>0) {
    		isPhone="N";
    	}else {
    		isPhone="Y";
    	}  	
    	return isPhone;  			
    } 

   @RequestMapping("/member/myCarpool")
   public ModelAndView myCarpool(HttpSession session, @RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
	   
	   int numPerPage = 5;
	   
	   ModelAndView mav = new ModelAndView("member/myCarpool");
	   
	   Member m = (Member)session.getAttribute("logined");
	   
	   List<Map<String, String>> list = cService.selectCarpoolList(m.getMemberNum(), cPage, numPerPage);
	   int totalCount = cService.selectCarpoolCount(m.getMemberNum());
	   
	   mav.addObject("carpoolList", list);
	   mav.addObject("pageBar", getPageBar(totalCount, cPage, numPerPage, "/odagada/member/myCarpool"));	   
	   
	   return mav;
   }
   
    @ResponseBody
	@RequestMapping("/member/sendSms")
	public String test(HttpSession session, String receiver) {
		// 인증 코드 생성
		int rand = (int) (Math.random() * 899999) + 100000;

		logger.debug(receiver);
		logger.debug(rand + "");

		String phoneCode = pwEncoder.encode(rand + "");
		Member m = (Member) session.getAttribute("logined");
		m.setPhoneCode(phoneCode);
		int result = service.updatePhoneCode(m);

		if (result > 0) {
			// 문자 보내기 (청기와랩 api 사용)
			String hostname = "api.bluehouselab.com";
			String url = "https://" + hostname + "/smscenter/v1.0/sendsms";

			CredentialsProvider credsProvider = new BasicCredentialsProvider();
			credsProvider.setCredentials(new AuthScope(hostname, 443, AuthScope.ANY_REALM),
					new UsernamePasswordCredentials("odagada", "9c9ca1e0454b11e9acbb0cc47a1fcfae"));

			AuthCache authCache = new BasicAuthCache();
			authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

			HttpClientContext context = HttpClientContext.create();
			context.setCredentialsProvider(credsProvider);
			context.setAuthCache(authCache);

			DefaultHttpClient client = new DefaultHttpClient();

			try {
				HttpPost httpPost = new HttpPost(url);
				httpPost.setHeader("Content-type", "application/json; charset=utf-8");
				String json = "{\"sender\":\"01028257863\",\"receivers\":[\"" + receiver
						+ "\"],\"content\":\"오다가다 핸드폰 번호 인증 코드 : " + rand + "\"}";

				StringEntity se = new StringEntity(json, "UTF-8");
				httpPost.setEntity(se);

				HttpResponse httpResponse = client.execute(httpPost, context);
				System.out.println(httpResponse.getStatusLine().getStatusCode());

				InputStream inputStream = httpResponse.getEntity().getContent();
				if (inputStream != null) {
					BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
					String line = "";
					while ((line = bufferedReader.readLine()) != null)
						System.out.println(line);
					inputStream.close();
				}
			} catch (Exception e) {
				System.err.println("Error: " + e.getLocalizedMessage());
			} finally {
				client.getConnectionManager().shutdown();
			}
			return "true";
		} else {
			return "false";
		}
	}
    

   @RequestMapping("/member/myDriver")
   public ModelAndView myDriver(HttpSession session) {
	   
	   
	   ModelAndView mv = new ModelAndView();
	   
	   Member m = (Member)session.getAttribute("logined");	   
	   int memberNum = m.getMemberNum();	   
	   Map<String, String> driver = dService.selectDriverOne(memberNum);
	   
	   if(driver!=null)
	   {
		   logger.debug("차 넘버"+driver.get("CARNUM"));

		   String carNum = driver.get("CARNUM");
		   List<Map<String,String>> carImg = dService.selectCarImg(carNum);
		   
		   String a = driver.get("LICENSENUM").substring(0,3);
		   String b = "**-******";
		   String c = driver.get("LICENSENUM").substring(13);
		   
		   String licenseNum = a+b+c;
		   
		   logger.debug("차번호"+carNum);
		   logger.debug("차 이미지"+carImg);
		   logger.debug("번호판 길이"+carNum.length());
		   carImg.get(0).put("active", "active");
		   
		   mv.addObject("carImg",carImg);
		   mv.addObject("licenseNum",licenseNum);
	   }
	     
	   logger.debug("테스트"+driver);
	   mv.addObject("driver", driver);
	   mv.setViewName("member/myDriver");
	   
	   return mv;
   }
   
   //비밀번호 변경
   @ResponseBody
   @RequestMapping("/member/changePass")
   public String changePassword(String password, HttpSession session) {
	   String pw=pwEncoder.encode(password);
	   Member m=(Member)session.getAttribute("logined");
	   m.setMemberPw(pw);	      
	   int result=service.updatePassword(m);
	   if(result>0){
		 return "update";  
	   }else {
		   return "fail";
	   }
   }
   
   //이메일 변경
   @ResponseBody
   @RequestMapping("/member/changeEmail")
   public String changeEmail(String email, HttpSession session) throws Exception {
	   Member m=(Member)session.getAttribute("logined");
	   m.setEmail(email);
	   service.mailUpdate(m);
	   return "sent";	   
   }
   
   //핸드폰 번호 변경
   @ResponseBody
   @RequestMapping("/member/phoneUpdate")
   public String smsCheck(HttpSession session, String code, String phone) {
   	Member m = (Member)session.getAttribute("logined");
   	
   	String saveCode = service.getPhoneCode(m.getMemberNum());
   	
   	logger.debug("들어오는 핸드폰 번호"+phone);
   	if(pwEncoder.matches(code, saveCode)) {
   		m.setPhone(phone);
   		m.setIsPhoneAuth("Y");
   		int result = service.updatePhone(m);
   		if(result > 0) {
   			return "ok";
   		}else {
   			return "no";
   		}
   	}else {
   		return "no";
   	}
   }
   
   //이름 변경
   @ResponseBody
   @RequestMapping("/member/changeName")
   public String changeName(HttpSession session, String memberName) {
	   logger.debug("바꾸려는 이름은?"+memberName);
	   Member m=(Member)session.getAttribute("logined");
	   m.setMemberName(memberName);
	   int result=service.updateName(m);
	   
	   if(result>0) {
		   return "ok";
	   }else {
		   return "fail";
	   }
   }
   
}
