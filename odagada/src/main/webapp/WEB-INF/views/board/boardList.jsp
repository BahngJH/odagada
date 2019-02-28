<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<section id="notice-container" class="container">
	<button type="button" class="btn btn-success" style="float: right; margin-bottom: 5px;">글쓰기</button>
	<table id="tbl-board" class="table table-hover">
	    <tr>
	        <th>번호</th>
	        <th>제목</th>
	        <th>작성일</th>
	        <th>첨부파일</th>
	    </tr>
	    <c:forEach var="b" items="${list}">
	    <tr>
			<td>${b.BOARDNO }</td>
			<td><a href="${path}/board/boardView.do?boardNo=${b.BOARDNO}">${b.BTITLE }</a></td>
			<td>${b.BDATE }</td>
        </tr>   
	    </c:forEach>
	</table>    
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>