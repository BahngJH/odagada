<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>

<style>
	#container{
		text-align: center;
	}
</style>

​<section id="container">
	<div id="title">
		<h2>신고 내역</h2>
	</div>
	<table class="table table-hover">
		<tr>
			<td>신고한 회원</td>
			<td>신고 당한 회원</td>
			<td>신고 내용</td>
			<td>신고 날짜</td>
		</tr>
		<c:forEach var="list" items="${notifyList }">
			<tr>
				<td>${list.NOTIFYID }</td>
				<td>${list.NONNOTIFYID }</td>
				<td>${list.NCONTENT }</td>
				<td>${list.NDATE }</td>
			</tr>
		</c:forEach>
	</table>
	${pageBar }
</section>


​
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>​