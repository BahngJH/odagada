<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.spring.odagada.member.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
String resultId=(String)request.getAttribute("memberId");
%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>



 <div id="enroll-container">
   	<form name="memberEnrollFrm" id="memberEnrollFrm" action="${path }/member/updateInfoEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">         
   		<div class="row">    		
         	  <div class="col-6">           			                                	       			
                 <div class="row passwordInfo">    	
	           		<div class="ptext col-5">
	           			<p class="badge badge-secondary">비밀번호 변경 시 유의사항</p>&nbsp&nbsp  
	       			</div>  
	       			<div class="col-7">      	
         					<p class="pPassword">숫자/영문자/특수문자 조합 6~15자</p>
	          		</div> 		
           		 </div>
	           		 <!--기존 Email 정보  -->
       		     <div class="row passwordInfo" id="oriEmailDiv">    	
	           		<div class="ptext col-6">
	           			<p class="oriEmail font-weight-bold"><%=resultId %></p>
	       			</div>  
	       			<div class="col-6 chgBtnDiv">
	       				<button type="button" id="chgEmailBtn" onclick="location.href='${path}/member/loginForm.do'" class="cg btn btn-secondary btn-sm">로그인 하러가기</button>      	
	          		</div> 		
          		 </div>           		
                 <input type="submit" class="btn btn-outline-success" id="enrollBtn" value="정보변경" >&nbsp;
                 <input type="reset" class="btn btn-outline-success" value="취소">
      	 	</div>       			   			
       </div>
   </form>
</div> 


<script></script>














<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>