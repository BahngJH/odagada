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


<section id="qna-container" class="container">
<div class="col-md-6 offset-md-3">
	<h1>Q&A</h1>
	
	<button type="button" class="btn btn-success" style="float: right; margin-bottom: 5px;" onclick="location.href='${path}/board/qnaForm';" >글쓰기</button>
	<table id="tbl-board" class="table table-hover">
	    <tr>
	        <th>번호</th>
	        <th>제목</th>
	        <th>작성자</th>
	        <th>작성일</th>
	    </tr>
	    
		    <c:forEach var="q" items="${list}">
			    <c:if test="${member.isAdmin eq '1' || q.QWRITER eq member.memberName}">
			    <tr>
					<td>${q.QNANUM}</td>
					<td><a href="${path}/board/qnaView.do?qnaNum=${q.QNANUM}">${q.QTITLE}
					<c:if test="${q.COMCNT >0 }">
						<span style="color: red;">(${q.COMCNT})</span>
					</c:if>
					</a>
					</td>
					<td>${q.QWRITER}</td>
					<td>
					<fmt:formatDate value="${q.QDATE}" pattern="yyyy-MM-dd"/>
					</td>
		        </tr>
		        </c:if>
		    </c:forEach>
	</table>
	
	${pageBar} 
</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>