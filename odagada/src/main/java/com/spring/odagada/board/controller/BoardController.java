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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.odagada.board.model.dao.BoardDao;
import com.spring.odagada.board.model.service.BoardService;
import com.spring.odagada.common.PageFactory;

@Controller
public class BoardController {
   
   private Logger logger = LoggerFactory.getLogger(BoardController.class);
   
   @Autowired
   BoardService service;
   
   @Autowired
   BoardDao dao;
   
   //하루에 0시와 12시, 6시에 실행해 블랙날짜 지난 사람 제거 
   @Scheduled(cron="0 0 0,12,18 * * *")
   public void blackListDelete()
   {
	   int rs = dao.blackListDelete();
	   logger.debug(rs+"개의 블랙리스트 회원이 제거됨");
   }
   
   //블랙리스트 불러옴
   @RequestMapping("/admin/blackList.do")
   public ModelAndView blackList(@RequestParam(value="cPage",required=false,defaultValue="0")int cPage, ModelAndView mv) 
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
   public ModelAndView deleteNotify(String notifyId, String nonNotifyId, String nContent, ModelAndView mv) 
   {
	   logger.debug(notifyId+" "+nonNotifyId+" "+nContent);
	   Map<String,Object> dNotify = new HashMap<String,Object>();
	   dNotify.put("notifyId", notifyId);
	   dNotify.put("nonNotifyId", nonNotifyId);
	   dNotify.put("nContent", nContent);
	   int rs = service.deleteNotify(dNotify);
	   
	   mv.setViewName("redirect:/admin/notifyList.do");
	   return mv;
   }
   
   //회원 목록 불러옴
   @RequestMapping("/admin/memberList.do")
   public ModelAndView memberList(@RequestParam(value="cPage",required=false,defaultValue="0")int cPage, ModelAndView mv)
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
   public ModelAndView notifyList(@RequestParam(value="cPage",required=false,defaultValue="0")int cPage, ModelAndView mv) 
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
   public ModelAndView searchMember(@RequestParam(value="cPage",required=false,defaultValue="0")int cPage, String searchType, String keyword,ModelAndView mv) 
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
   public ModelAndView noticeList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage)
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
   public ModelAndView qnaList(@RequestParam(value="cPage", required=false,defaultValue="0") int cPage)
   {
	   ModelAndView mv = new ModelAndView();
	   int numPerPage = 5;
	   int contentCount = service.selectQnaCount();
	   
	   List<Map<String,String>> list = service.selectQnaList(cPage,numPerPage);

	   mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage,"/odagada/board/qnaList"));
	   mv.addObject("list",list);
	   mv.setViewName("board/qnaList");
	   
	   return mv;
   }
   
   @RequestMapping("/board/qnaView.do")
   public ModelAndView qnaView(int qnaNum,@RequestParam(value="cPage", required=false,defaultValue="0") int cPage,HttpServletRequest request,HttpServletResponse response)
   {
	   ModelAndView mv = new ModelAndView();
	   int numPerPage = 10;
	  /* int contentCount = service.select*/
  
	   Map<String,String> map = service.selectQnaOne(qnaNum);
	 /*  List<Map<String,String>> com = service.selectComOne(qnaNum);*/
 	   mv.addObject("qna",map);
	   mv.setViewName("board/qnaView");
	   
	   return mv;

	   
   }
   
   

}