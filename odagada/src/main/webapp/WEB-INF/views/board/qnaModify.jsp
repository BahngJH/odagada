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
		font-weight: bold;
	}
</style>
<section id="qna-container" class="container">
<h1>Q&A</h1>
<hr/>
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