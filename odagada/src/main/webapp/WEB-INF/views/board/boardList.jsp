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
	h1{
		text-align: center;
	}
</style>
<section id="notice-container" class="container">
<div class="col-md-6 offset-md-3">
<h1>공지사항</h1>
<c:set var="isAdmin" value="${logined.isAdmin}"/>
	<c:if test="${isAdmin eq '1'}">
		<button type="button" class="btn btn-success" style="float: right; margin-bottom: 5px;" onclick="location.href='${path}/board/boardForm';" >글쓰기</button>
	</c:if>      
	<table id="tbl-board" class="table table-hover">
	    <tr>
	        <th>번호</th>
	        <th>제목</th>
	        <th>작성일</th>
	        <th>첨부파일</th>
	        <th>조회수</th>
	    </tr>
	    <c:forEach var="b" items="${list}">
	    <tr>
			<td>${b.BOARDNO }</td>
			<td><a href="${path}/board/boardView.do?boardNo=${b.BOARDNO}">${b.BTITLE }</a></td>
			<td>
			<fmt:formatDate value="${q.QDATE}" pattern="yyyy-MM-dd"/>
			</td>
			<td>
				<c:if test="${b.BREFILENAME !=null}">
					<img src="${path}/resources/images/file.png"/>
				</c:if>
			</td>
			<td>${b.BCOUNT}</td>
        </tr>   
	    </c:forEach>
	</table>
	${pageBar}
	</div>   
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>