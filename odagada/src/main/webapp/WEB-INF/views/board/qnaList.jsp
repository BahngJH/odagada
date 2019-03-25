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
@font-face { font-family: 'NIXGONM-Vb'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONM-Vb.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'S-CoreDream-3Light'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff'); font-weight: normal; font-style: normal; }	
@font-face { font-family: 'silgothic'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/silgothic.woff') format('woff'); font-weight: normal; font-style: normal; }	
	h1{
		/* font-family : S-CoreDream-3Light; */
		font-family : silgothic;
		text-align: left;
		margin: 20px 0 20px 0;
	}
	.photo-backround{
		background-image: url(${pageContext.request.contextPath}/resources/images/boardList3.png);
		background-position: center center;
		background-repeat: no-repeat;
		background-size: cover;
		height: 300px;
		margin-bottom: 30px;
		margin-top: 10px;
	}
	#tbl-board{
		margin-bottom: 30px;
	}
	a{
		color: black;
		text-decoration: none;
	}
</style>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1> 도움이 필요하신가요? </h1>
	</div>
</section>
<section class="photo-backround" data-image="${path}/resources/images/boardList3.png">
</section>

<section id="qna-container" class="container">
<div class="col-md-8 offset-md-2">
	<button type="button" class="btn btn-outline-success" style="float: right; margin-bottom: 5px;" onclick="location.href='${path}/board/qnaForm';" >글쓰기</button>
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