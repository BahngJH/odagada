<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>;
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>;
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>;
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<style>
	table td input#enrollResult{
		border: 1px solid rgba(0,0,0,0);
	}
</style>
​<section id="driverControll-container" class="container">
<c:set var="isAdmin" value="${logined.isAdmin}"/>
	<div class="col-6 col-md-6 offset-md-3" style="text-align: center; font-weight: bold;">
	<br><br>
      <h2>드라이버 관리</h2>
   <br>    
   </div>      
	<table id="driver-board" class="table table-hover">
	    <tr>
	        <th>아이디</th>
	        <th>이름</th>
	        <th>신청일</th>
	        <th>드라이버 심사</th>
	        <th>드라이버 심사결과</th>
	    </tr>
	    <c:forEach var="d" items="${list}">
	    <tr>
			<td>${d.MEMBERID }</td>
			<td>${d.MEMBERNAME}</td>
			<td>${d.ENROLLDATE}</td>
			<td>
				<button class="btn btn-outline-success" onclick="location.href='${path}/driver/driverForm?memberNum=${d.MEMBERNUM}';">신청서 확인</button>
			</td>
			<td>
				<c:if test="${d.DRIVERSTATUS == 'N'}">
					<p>승인대기</p>
					<!-- <input type="text" id= "enrollResult" value="승인대기"/> -->
				</c:if>
				<c:if test="${d.DRIVERSTATUS == 'Y'}">
					<p>승인완료</p>
					<!-- <input type="text" id= "enrollResult" value="승인완료"/> -->
				</c:if>
			</td>
        </tr>   
	    </c:forEach>
	</table>
	${pageBar}   
</section>
​
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>​