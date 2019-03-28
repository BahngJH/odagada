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
	section{
		font-family: S-CoreDream-3Light;
	}
</style>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1 id="miniTitle"> 도움이 필요하신가요? </h1>
	</div>
</section>
<section class="photo-backround" data-image="${path}/resources/images/boardList3.png">
</section>
<section id="qna-container" class="container" style="margin-top: 0px;">
	<form name="boardFrm" action="${path}/board/qnaModifyEnd" method="post" onsubmit="return validate();">
		<div class="col-6 col-md-6 offset-md-3" style="padding-left: 0px;padding-right: 0px;">
			<input type="text" class="form-control" placeholder="제목" name="qTitle" id="qTitle" value="${qna.QTITLE}" required/>		
		</div>
		<br/>
		<div class="col-6 col-md-6 offset-md-3" style="padding-left: 0px;padding-right: 0px;">
			<input type="text" class="form-control" name="qContent" placeholder="내용" value="${qna.QCONTENT }" required/>
		</div>		
		<div class="col-6 col-md-6 offset-md-3" style="text-align: center;">
			<input type="hidden" name="qnaNum" value="${qna.QNANUM}"/>
			<br/>
			<input type="submit" class="btn btn-outline-success" value="수정">
			<input type="button" class="btn btn-outline-success" onclick="javascript:location.href='${path}/board/qnaList';" value="취소">
		</div>
	</form>
</section>
​
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>​