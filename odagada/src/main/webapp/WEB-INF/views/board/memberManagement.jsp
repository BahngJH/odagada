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
		<h2>회원관리</h2>
	</div>
	<table class="table table-hover">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>생년월일</td>
			<td>휴대폰</td>
			<td>이메일</td>
			<td>성별</td>
			<td>이메일 인증</td>
			<td>휴대폰 인증</td>
		</tr>
		<c:forEach var="list" items="${memberList }">
			<tr>
				<td>${list.MEMBERID }</td>
				<td>${list.MEMBERNAME }</td>
				<td>${list.BIRTH }</td>
				<td>${list.PHONE }</td>
				<td>${list.EMAIL }</td>
				<td>${list.GENDER }</td>
				<td>${list.ISPHONEAUTH }</td>
				<td>${list.ISEMAILAUTH }</td>
			</tr>
		</c:forEach>
	</table>

</section>

​
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>​