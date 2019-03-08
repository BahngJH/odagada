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
  
  
</style>

<section class="container">
	<div class="row">

		<div class="col-12 col-md-4">
			<div class="menu_list info list-group">
				<a href="${path }/member/myInfo.do" class="list-group-item list-group-item-action">회원 정보 관리</a>
				<a href="#" class="list-group-item list-group-item-action">드라이버 정보 관리</a>
				<a class="list-group-item list-group-item-action active">카풀 내역</a>
			</div>
		</div>
		
		<div class="col-12 col-md-8" id="enroll-container">	
			<div class="info col-12 col-sm-12 col-md-12">
				<table class="table">
					<tr>
						<th>카풀 번호</th>
						<th>출발지</th>
						<th>목적지</th>
						<th>운전자</th>
						<th>요금</th>
						<th>신청상태</th>
						<th>결제코드</th>
					</tr>
				 	<c:forEach items="${carpoolList }" var="list">
						<tr>
							<td><c:out value="${list.CARPOOLNUM}"></c:out></td>
							<td><c:out value="${list.STARTCITY} ${list.STARTDETAIL }"></c:out></td>
							<td><c:out value="${list.ENDCITY} ${list.ENDDETAIL }"></c:out></td>
							<td><c:out value="${list.MEMBERNAME }"></c:out> </td>
							<td><c:out value="${list.PAY }"></c:out></td>
							<td><c:out value="${list.PSTATUS}"></c:out></td>
							<td><c:out value="${list.PAYCODE }"></c:out></td>
						</tr>
				 	</c:forEach>
				</table>
			</div>
		</div>
      

	</div>
</section>






<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>