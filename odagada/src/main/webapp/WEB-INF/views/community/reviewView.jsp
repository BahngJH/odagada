<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
	<div id="review-container">
		<ul class="review-list">
			<li class="review-context">
				<a href="${path }}/">
					<div class="review-content" id="writerNum" name="writerNum" value="${writerNum}">></div>
				</a>
				<p class="review-content">
					<span class="review-content" value="${rContent }"></span>
				</p>
				<div class="review-content" id="rDate" name="rDate" value="${rDate}"></div>
			</li>
		</ul>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>