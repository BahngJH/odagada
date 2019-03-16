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


<style>
.btn-g{margin:3px;} 
.out-div{text-align:center; margin:5%;}
#findId-h{margin-bottom:5%;}
h3{margin-bottom:2%;}
</style>


<div class="row out-div">
	<div class="col-12">
     	<div class="row">
     		<div class="col-12">
     			<h3>ID 찾기 결과</h3>
   				<h5 id="findId-h">아이디: <%=resultId %></h5>
				<span>
					<button class="btn btn-success btn-sm btn-g" onclick="location.href='${path}/member/loginForm.do'">로그인</button>
					<button class="btn btn-success btn-sm btn-g"onclick="location.href='${path}/member/findPw'">패스워드 찾기</button>
					<button class="btn btn-outline-success btn-sm btn-g" onclick="location.href='${path}/'">홈으로</button>
				</span>
			</div> 
		</div>
 	 </div>    
</div>
         
         

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>