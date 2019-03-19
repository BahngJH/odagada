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
	<div>
		<h2>블랙리스트</h2>
	</div>
	<table class="table table-hover">
		<tr>
			<td>블랙당한 아이디</td>
			<td>신고자</td>
			<td>신고 사유</td>
			<td>블랙 해제일</td>
		</tr>
		<c:forEach var="list" items="${blackList }">
			<tr>
				<td>${list.BLACKID }</td>
				<td>${list.REPORT }</td>
				<td>${list.BLACKCONTENT }</td>
				<td>${list.BLACKPUNISH }</td>
		</c:forEach>
	</table>
	${pageBar }
</section>


​
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>​