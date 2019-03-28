package com.spring.odagada.board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.odagada.board.model.dao.BoardDao;
import com.spring.odagada.board.model.service.BoardService;
import com.spring.odagada.common.PageFactory;
import com.spring.odagada.driver.model.service.DriverService;
import com.spring.odagada.driver.model.vo.Driver;
import com.spring.odagada.member.model.vo.Member;

@Controller
public class BoardController {
   
   private Logger logger = LoggerFactory.getLogger(BoardController.class);
   
   @Autowired
   BoardService service;
   
   @Autowired
   DriverService dService;
   
   @Autowired
   BoardDao dao;
   
   //하루에 0시와 12시, 6시에 실행해 블랙날짜 지난 사람 제거 
   @Scheduled(cron="0 0 0,12,18 * * *")
   public void blackListDelete()
   {
	   int rs = dao.blackListDelete();
   }
   
   //블랙리스트 불러옴
   @RequestMapping("/admin/blackList.do")
   public ModelAndView blackList(@RequestParam(value="cPage",required=false,defaultValue="1")int cPage, ModelAndView mv) 
   {
	   int allBlackCount = service.allBlackCount();
	   int numPerPage=10;
	   List<Map<String,String>> blackList = service.blackList(cPage,numPerPage);
	   mv.addObject("pageBar", PageFactory.getPageBar(allBlackCount, cPage, numPerPage, "/odagada/admin/blackList.do"));
	   mv.addObject("blackList", blackList);
	   mv.setViewName("board/blackList");
	   return mv;
   }
   
   //블랙리스트 처리
   @RequestMapping("/admin/insertBlack.do")
   public ModelAndView insertBlack(String notifyId, String nonNotifyId, String nContent, String blackCount, ModelAndView mv) 
   {
	   logger.debug(notifyId+" "+nonNotifyId+" "+nContent+" "+blackCount);
	   Map<String,Object> bNotify = new HashMap<String,Object>();
	   bNotify.put("notifyId", notifyId);
	   bNotify.put("nonNotifyId", nonNotifyId);
	   bNotify.put("nContent", nContent);
	   
	   int result = service.checkBlackList(nonNotifyId);
	   
	   if(result==0) {
		   int rs = service.deleteNotify(bNotify);
		   bNotify.put("blackCount", Integer.parseInt(blackCount));
		   int rs2 = service.insertBlack(bNotify);
		   
		   mv.setViewName("redirect:/admin/notifyList.do");
		   return mv;
	   }
	   else {
		   mv.addObject("msg","이미 블랙리스트에 있는 회원입니다.");
		   mv.addObject("loc", "/admin/notifyList.do");
		   mv.setViewName("common/msg");
		   return mv;
	   }
	   
	   
   }
   
   //경미한 신고내역 삭제
   @RequestMapping("/admin/deleteNotify.do")
   public ModelAndView deleteNotify(String notifyId, String nonNotifyId, ModelAndView mv) 
   {
	   logger.debug(notifyId+" "+nonNotifyId);
	   Map<String,Object> dNotify = new HashMap<String,Object>();
	   dNotify.put("notifyId", notifyId);
	   dNotify.put("nonNotifyId", nonNotifyId);
	   
	   int rs = service.deleteNotify(dNotify);
	   
	   mv.setViewName("redirect:/admin/notifyList.do");
	   return mv;
   }
   
   //회원 목록 불러옴
   @RequestMapping("/admin/memberList.do")
   public ModelAndView memberList(@RequestParam(value="cPage",required=false,defaultValue="1")int cPage, ModelAndView mv)
   {
	   int allMemberCount = service.selectAllMemberCount();
	   int numPerPage = 10;
	   logger.debug(""+cPage);
	   List<Map<String,String>> memberList = service.memberList(cPage,numPerPage);
	   logger.debug("전체회원 정보"+memberList);
	   mv.addObject("pageBar", PageFactory.getPageBar(allMemberCount, cPage, numPerPage,"/odagada/admin/memberList.do"));
	   mv.addObject("memberList", memberList);
	   mv.setViewName("board/memberManagement");
	   return mv;
   }
   
   //신고내역가져옴
   @RequestMapping("/admin/notifyList.do")
   public ModelAndView notifyList(@RequestParam(value="cPage",required=false,defaultValue="1")int cPage, ModelAndView mv) 
   {
	   int numPerPage=10;
	   int allNotifyCount = service.allNotifyCount();
	   List<Map<String,String>> notifyList = service.notifyList(cPage,numPerPage);
	   mv.addObject("pageBar", PageFactory.getPageBar(allNotifyCount, cPage, numPerPage, "/odagada/admin/notifyList.do"));
	   mv.addObject("notifyList",notifyList);
	   mv.setViewName("board/notifyList");
	   return mv;   
   }
   
   //회원관리에서 아이디나 이름 상세검색
   @RequestMapping("/admin/searchMember.do")
   public ModelAndView searchMember(@RequestParam(value="cPage",required=false,defaultValue="1")int cPage, String searchType, String keyword,ModelAndView mv) 
   {
	   logger.debug(keyword+"");
	   logger.debug(""+searchType);
	   logger.debug(""+cPage);
	   
	   Map<String,String> searchData = new HashMap<String,String>();
	   searchData.put("searchType", searchType);
	   searchData.put("keyword", keyword);
	   
	   int searchListAll = service.searchListAll(searchData);
	   int numPerPage = 10;
	   List<Map<String,String>> searchList = service.searchList(searchData,cPage,numPerPage);
	   mv.addObject("pageBar", PageFactory.getPageBar(searchListAll, cPage, numPerPage,"/odagada/admin/searchMember.do",searchType,keyword));
	   mv.addObject("memberList", searchList);
	   mv.addObject("searchType", searchType);
	   mv.addObject("keyword", keyword);
	   mv.setViewName("board/memberManagement");
	   return mv;
   }
   
   @RequestMapping("/board/boardList")
   public ModelAndView noticeList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage)
   {
      ModelAndView mv = new ModelAndView();
      int numPerPage = 5;   
      int contentCount = service.selectBoardCount();
      
      
      List<Map<String,String>> list = service.selectBoardList(cPage,numPerPage);
      mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage,"/odagada/board/boardList"));
      mv.addObject("list",list);
      mv.setViewName("board/boardList");
      
      
      return mv;
   }
   
   @RequestMapping("/board/boardView.do")
   public ModelAndView boardView(int boardNo,HttpServletRequest request,HttpServletResponse response)
   {
      ModelAndView mv = new ModelAndView();
      //int bCount;
   
      Cookie[] cookies = request.getCookies();
      Map cookiesMap = new HashMap();
      
      if(cookies!=null)
      {
         for(int i=0;i<cookies.length;i++)
         {
            Cookie obj = cookies[i];
            cookiesMap.put(obj.getName(), obj.getValue());
         }
      }
      
      String readCount = (String)cookiesMap.get("read_count");
      String newReadCount = "|"+boardNo;
      
      if(StringUtils.indexOfIgnoreCase(readCount, newReadCount) == -1)
      {
         Cookie cookie = new Cookie("read_count",readCount+newReadCount);
         
         response.addCookie(cookie);
         this.service.updateBoardCount(boardNo);
      }
      
      Map<String,String> map = this.service.selectBoard(boardNo);
      mv.addObject("board",map);
      //mv.addObject("bCount",bCount);
      mv.setViewName("board/boardView");
      
      return mv;      
   }

   @RequestMapping("/board/filedownLoad.do")
   public void filedownLoad(String oName,String rName,HttpServletRequest request,HttpServletResponse response)
   {
      BufferedInputStream bis = null;
      ServletOutputStream sos = null;
      
      String dir = request.getSession().getServletContext().getRealPath("/resources/upload/board");
      File savedFile = new File(dir+"/"+rName);
      try {
         FileInputStream fis = new FileInputStream(savedFile);
         bis = new BufferedInputStream(fis);
         sos = response.getOutputStream();
         
         String resFileName = "";
         boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE")!=-1||request.getHeader("user-agent").indexOf("Trident")!=-1;
         if(isMSIE)
         {
            resFileName = URLEncoder.encode(oName, "UTF-8");
            resFileName = resFileName.replaceAll("//", "%20");
         }
         else {
            resFileName = new String(oName.getBytes("UTF-8"),"ISO-8859-1");
         }
         
         response.setContentType("application/octet-stream;charset=utf-8");
         response.addHeader("Content-Disposition","attachment;filename=\""+resFileName+"\"");
         
         response.setContentLength((int)savedFile.length());
         
         int read=0;
         while((read=bis.read())!=-1)
         {
            sos.write(read);
         }
      }catch(IOException e)
      {
         e.printStackTrace();
      }
      finally {
         try {
            sos.close();
            bis.close();
         }catch(IOException e)
         {
            e.printStackTrace();
         }
      }
      
   }
   
   @RequestMapping("/board/boardForm")
   public String boardForm()
   {
      return "board/boardForm";
   }
   
   @RequestMapping("/board/boardFormEnd")
   public String boardFormEnd(String bTitle, String bContent,MultipartFile upFile,
         HttpServletRequest request,HttpServletResponse response)
   {
      Map<String,String> board = new HashMap();
      
      board.put("title", bTitle);
      board.put("content", bContent);
         
      String savDir=request.getSession().getServletContext().getRealPath("/resources/upload/board");
      
      if(!upFile.isEmpty())
      {
         //파일명을 생성(Rename)
         String oriFileName = upFile.getOriginalFilename();
         String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
         
         //rename 규칙
         SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
         int rdv = (int)(Math.random()*1000);
         String reName = sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
         
         //첨부파일 저장
         try {
            upFile.transferTo(new File(savDir+"/"+reName));
         }catch(IOException e)
         {
            e.printStackTrace();
         }
         
         board.put("oriFileName", oriFileName);
         board.put("reFileName", reName);         
      }
      int result = service.insertBoard(board);
      
      logger.info("게시판"+board);
      
      return "redirect:/board/boardList";
   }
   
   @RequestMapping("/board/boardModify")
   public ModelAndView boardModify(int boardNo,HttpServletRequest request,HttpServletResponse response) 
   {
      ModelAndView mv = new ModelAndView();
      
      Map<String,String> map = service.selectBoard(boardNo);
      mv.addObject("board",map);
      mv.setViewName("board/boardModify");
      
      logger.info("게시판번호"+boardNo);
      
      return mv;
   }   
   
   @RequestMapping("/board/boardModifyEnd")
   public String boardModifyEnd(String bTitle, String bContent,int boardNo,MultipartFile upFile,String upFile2, String upFile3,
         HttpServletRequest request,HttpServletResponse response)
   {
      Map<String,String> map = service.selectBoard(boardNo);
   
      Map<String,Object> board= new HashMap();
      
      board.put("title", bTitle);
      board.put("content", bContent);
      board.put("boardNo", boardNo);
         System.out.println("gggggg"+upFile2+" :"+upFile3);
      String savDir=request.getSession().getServletContext().getRealPath("/resources/upload/board");
      
      if(!upFile.isEmpty())
      {
         //파일명을 생성(Rename)
         String oriFileName = upFile.getOriginalFilename();
         String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
         
         //rename 규칙
         SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
         int rdv = (int)(Math.random()*1000);
         String reName = sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
         
         //첨부파일 저장
         try {
            upFile.transferTo(new File(savDir+"/"+reName));
         }catch(IOException e)
         {
            e.printStackTrace();
         }
         
         board.put("oriFileName", oriFileName);
         board.put("reFileName", reName);         
      }
      else {
         board.put("oriFileName", upFile2);
         board.put("reFileName", upFile3);   
      }
      logger.info("게시판"+board);
      logger.info("게시판번호"+boardNo);
      int result = service.updateBoard(board);
      
      return "redirect:/board/boardList";
   }
   
   @RequestMapping("/board/boardDelete")
   public String boardDelete(int boardNo)
   {
      int result = service.deleteBoard(boardNo);
      
      return "redirect:/board/boardList";
   }
   
   
   
   
   
   @RequestMapping("/board/qnaList")
   public ModelAndView qnaList(HttpSession session,@RequestParam(value="cPage", required=false,defaultValue="1") int cPage)
   {
	   
	   ModelAndView mv = new ModelAndView();
	   
	   Member m = (Member)session.getAttribute("logined");
	   
	   if(m!=null)
	   {
		   int memberNum = m.getMemberNum();
		   
		   int numPerPage = 5;
		   int contentCount = service.selectQnaCount();
		   
		   List<Map<String,String>> list = service.selectQnaList(cPage,numPerPage);
		   
		   logger.debug("멤버확인"+m);
		   mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage,"/odagada/board/qnaList"));
		   mv.addObject("member",m);
		   mv.addObject("list",list);
		   mv.setViewName("board/qnaList");
		   
		   return mv;
	   }
	   else
	   {
		   mv.addObject("msg","로그인 후 이용해주세요!");
		   mv.addObject("loc","/member/loginForm.do");
		   mv.setViewName("/common/msg");
		   
		   return mv;
	   }
   }
   
   @RequestMapping("/board/qnaView.do")
   public ModelAndView qnaView(HttpSession session,int qnaNum,@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, HttpServletRequest request,HttpServletResponse response)
   {
	   Member m = (Member)session.getAttribute("logined");
	   
	   ModelAndView mv = new ModelAndView();
	   int numPerPage = 10;
	   int contentCount = service.selectQnaComCount();
	   
	   Map<String,String> map = service.selectQnaOne(qnaNum);
	   List<Map<String,String>> com = service.selectQnaComList(cPage,numPerPage,qnaNum);
	   mv.addObject("pageBar", PageFactory.getPageBar(contentCount, cPage, numPerPage,"/odagada/board/qnaView.do", qnaNum));
	   
	   
	   logger.debug("멤버확인"+m);
	   
	   logger.debug("댓글 확인"+com);
	   
	   mv.addObject("member",m);
 	   mv.addObject("qna",map);
 	   mv.addObject("comment",com);
	   mv.setViewName("board/qnaView");
	   
	   return mv;
   }
   
   @RequestMapping("/board/qnaForm")
   public ModelAndView qnaForm(HttpSession session)
   {
	   Member m = (Member)session.getAttribute("logined");
	   
	   ModelAndView mv = new ModelAndView();
	   mv.addObject("member",m);
	   mv.setViewName("/board/qnaForm");
	   
	   return mv;
   }
   
   @RequestMapping("/board/qnaFormEnd")
   public String qnaFormEnd(HttpSession session,String qTitle,String qContent,HttpServletRequest request,HttpServletResponse response)
   {
	   Member m = (Member)session.getAttribute("logined");
	   Map<String,Object> qna = new HashMap();
	   
	   int memberNum = m.getMemberNum();
	   
	   qna.put("title", qTitle);
	   qna.put("content", qContent);
	   qna.put("memberNum",memberNum);   
	   
	   int result = service.insertQna(qna);
	   
	   return "redirect:/board/qnaList";
	   
	   
   }
   
   @RequestMapping("/board/qnaModify")
   public ModelAndView qnaModify(int qnaNum,HttpServletRequest request,HttpServletResponse response) 
   {
      ModelAndView mv = new ModelAndView();
      
      Map<String,String> map = service.selectQnaOne(qnaNum);
      mv.addObject("qna",map);
      mv.setViewName("board/qnaModify");
      
      logger.info("게시판번호"+qnaNum);
      
      return mv;
   }
   
   
   @RequestMapping("/board/qnaModifyEnd")
   public String qnaModifyEnd(HttpSession session,String qTitle,String qContent,int qnaNum,HttpServletRequest request,HttpServletResponse response) 
   {
	  Member m = (Member) session.getAttribute("logined");
	  
	  int memberNum = m.getMemberNum();
	  
	  Map<String,Object> qna = new HashMap();
	  qna.put("title", qTitle);
	  qna.put("content", qContent);
	  qna.put("memberNum",memberNum);
	  qna.put("qnaNum", qnaNum);
	  
	  int result = service.updateQna(qna);
	  
	  return "redirect:/board/qnaList";
   }
   
   @RequestMapping("/board/qnaDelete")
   public String qnaDelete(int qnaNum)
   {
	   int result = service.deleteQna(qnaNum);
	   
	   return "redirect:/board/qnaList"; 
   }
   
   @RequestMapping("/board/qnaComEnroll")
   public String qnaComEnroll(String comContent,int qnaNum,HttpServletResponse response,HttpServletRequest request )
   {
	   Map<String,Object> comment = new HashMap();
	   comment.put("qnaNum", qnaNum);
	   comment.put("content", comContent);
	   
	   int result = service.insertQnaCom(comment);
	   
	   return "redirect:/board/qnaView.do?qnaNum="+qnaNum;
   }
   
   @RequestMapping("/board/qnaComModify")
   public ModelAndView qnaComModify(@RequestParam(value="cPage", required=false,defaultValue="1") int cPage,int qnaNum,int commentNum,HttpSession session,HttpServletRequest request,HttpServletResponse response) 
   {
	  int numPerPage = 10;
	  int contentCount = service.selectQnaComCount();
	  
      ModelAndView mv = new ModelAndView();
      Member m = (Member)session.getAttribute("logined");
      
      Map<String,Object> map = service.selectQnaComOne(commentNum);
      Map<String,String> qna = service.selectQnaOne(qnaNum);
      List<Map<String,String>> com = service.selectQnaComList(cPage,numPerPage,qnaNum);
      
      mv.addObject("comment",map);
      mv.addObject("pageBar", PageFactory.getPageBar(contentCount, cPage, numPerPage,"/odagada/board/qnaComModify"));
      mv.addObject("qna",qna);
      mv.addObject("com",com);
      mv.addObject("member",m);
      mv.setViewName("board/qnaComModify");

      return mv;

   }
   
   @RequestMapping("/board/qnaComModifyEnd")
   public ModelAndView qnaComModifyEnd(@RequestParam(value="cPage", required=false,defaultValue="1") int cPage,HttpSession session,String comContent,String qnaNum, String comNum,
		   HttpServletRequest request, HttpServletResponse response)
   {
	   int numPerPage = 10;
	   int contentCount = service.selectQnaComCount();
	   
	   logger.debug("내용"+comContent);
	   logger.debug("댓글번호"+comNum);
	   logger.debug("글번호"+qnaNum);
	   
	   ModelAndView mv = new ModelAndView();
	   
	   Map<String,Object> com = new HashMap();
	   com.put("comContent", comContent);
	   com.put("comNum", comNum);
	   
	   int result = service.updateComment(com);
	   
	   //mv.addObject("pageBar", PageFactory.getPageBar(contentCount, cPage, numPerPage,"/odagada/board/qnaView.do"));
	   mv.addObject("qnaNum", qnaNum);
	   mv.setViewName("redirect:/board/qnaView.do");
	   
	   return mv;
   }
   
   @RequestMapping("/board/qnaComDelete")
   public String qnaComDelete(int commentNum,int qnaNum)
   {
	   int result = service.deleteQnaCom(commentNum);
	   
	   return "redirect:/board/qnaView.do?qnaNum="+qnaNum;
	   
   }
   
   @RequestMapping("/board/faqList.do")
   public ModelAndView faqList(HttpSession session,String faqNo)
   {
	   Member m = (Member)session.getAttribute("logined");
	   
	   ModelAndView mv = new ModelAndView();
	   
	   if(m!=null)
	   {
		   List<Map<String,String>> list = service.selectFaqList(faqNo);
		   
		   mv.addObject("list",list);
		   mv.setViewName("board/faqList");
		   
		   return mv;
	   }
	   else
	   {
		   mv.addObject("msg","로그인 후 이용해주세요!");
		   mv.addObject("loc","/member/loginForm.do");
		   mv.setViewName("/common/msg");
		   
		   return mv;
	   }
   }
   
   @RequestMapping("/board/faqForm.do")
   public String faqForm()
   {
	   return "board/faqForm";
   }
   @RequestMapping("/board/faqFormEnd.do")
   public String boardFormEnd (HttpServletRequest request,HttpServletResponse response,String faqNo, String fTitle, String fContent, Model model)
	{
		Map<String, String> faq=new HashMap();
		faq.put("faqNo", faqNo);
		faq.put("fTitle", fTitle);
		faq.put("fContent", fContent);
		int result=service.insertFaq(faq);
		
		String msg="";
		String loc="/board/faqList.do?faqNo="+faqNo;
		if(result>0)
		{
			msg="등록성공";
		}
		else
		{
			msg="등록실패";
		}
		model.addAttribute("faqNo",faqNo);
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
   @RequestMapping("/board/faqModify.do")
   public ModelAndView faqModify(HttpServletRequest request,HttpServletResponse response,String faqNo) 
   {
	   ModelAndView mv = new ModelAndView();
	  
	   Map<String,String> faq = service.selectFaqOne(faqNo);
	   mv.addObject("faq",faq);
	   mv.setViewName("board/faqModify");
	  
	   return mv;
   }
   
   @RequestMapping("/board/faqModifyEnd.do")
   public String faqModifyEnd(HttpServletRequest request,HttpServletResponse response,HttpSession session,String faqNo, String fTitle,String fContent,Model model) 
   {
	  
	   Map<String,String> faq = new HashMap();
	   faq.put("faqNo", faqNo);
	   faq.put("fTitle", fTitle);
	   faq.put("fContent", fContent);
	   logger.debug("넘버 : "+faqNo+"타이틀 : "+fTitle+"냉요 : "+fContent);
	  
	  int result = service.updateFaq(faq);
	  
	  String msg="";
	  String loc="/board/faqList.do?";
	  if(result>0)
	  {
		  msg="수정성공";
	  }
	  else
	  {
		  msg="수정실패";
	  }
	  model.addAttribute("msg",msg);
	  model.addAttribute("loc",loc);
	  return "common/msg";
	  }
   
   @RequestMapping("/board/faqDelete.do")
	public String faqDelete(String faqNo, Model model) {
		
		int result = service.deleteFaq(faqNo);
		
		String msg = "";
		String loc = "/board/faqList.do?faqNo="+faqNo;
		if (result > 0) {
			msg = "삭제성공";
		} else {
			msg = "삭제실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "common/msg";
	}

}