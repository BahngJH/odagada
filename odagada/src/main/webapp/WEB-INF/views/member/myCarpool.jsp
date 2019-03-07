<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,com.spring.odagada.member.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	Member m = (Member) request.getAttribute("logined");
	System.out.println(m);
    String eDate []=m.getEnrollDate().split(" ");
%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>

<style>

  div#enroll-container{width:400px; margin:0 auto;}
  div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
  .menu{text-align:center; font-weight:bold;}
  .info{margin-top:50px; margin-bottom: 50px;}
  .alertS{padding:5px; font-size:12px; text-align:center;}
  
  
</style>

<section class="container">
	<div class="row">

		<div class="col-12 col-sm-4">
			<div class="menu_list info list-group">
				<a href="${path }/member/myInfo.do" class="list-group-item list-group-item-action">회원 정보 관리</a>
				<a href="#" class="list-group-item list-group-item-action">드라이버 정보 관리</a>
				<a class="list-group-item list-group-item-action active">카풀 내역</a>
			</div>
		</div>
		
		<div class="col-12 col-sm-8" id="enroll-container">	
			<div class="info col-12 col-sm-12 col-md-8">
			 
			</div>
		</div>
      

	</div>
</section>






<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>