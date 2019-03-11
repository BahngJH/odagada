<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>;
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>;
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>;
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
​<section id="driverControll-container" class="container">
<c:set var="isAdmin" value="${logined.isAdmin}"/>
	<%-- <c:if test="${isAdmin eq '1'}">
		<button type="button" class="btn btn-success" style="float: right; margin-bottom: 5px;" onclick="location.href='${path}/board/boardForm';" >글쓰기</button>
	</c:if> --%>
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
	        <th>드라이버 수락</th>
	    </tr>
	    <c:forEach var="d" items="${list}">
	    <tr>
			<td>${d.MEMBERID }</td>
			<td>${d.MEMBERNAME}</td>
			<td>${d.ENROLLDATE}</td>
			<td>
				<c:if test="${d.DRIVERSTATUS == 'N'}">
					<button id='dAdmin' class="btn btn-outline-success" onclick="location.href='${path}/driver/driverAdmin?memberNum=${d.MEMBERNUM}';">승인대기</button>
				</c:if>
				<c:if test="${d.DRIVERSTATUS == 'Y'}">
					<button id='dAdmin' class="btn btn-outline-success" onclick="location.href='${path}/driver/driverAdmin?memberNum=${d.MEMBERNUM}';">승인</button>
				</c:if>
			</td>
        </tr>   
	    </c:forEach>
	</table>
	${pageBar}   
</section>
​
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>​