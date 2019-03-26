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
		background-image: url(${pageContext.request.contextPath}/resources/images/blackList.png);
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
	#container{
		text-align: center;
	}
</style>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1> 오다가다 블랙리스트</h1>
	</div>
</section>

<section class="photo-backround" data-image="${path}/resources/images/blackList.png">
</section>
​<section id="container">
	
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