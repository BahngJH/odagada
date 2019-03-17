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
	#comsubmit{
		float: right;
	}
</style>
<div class="container col-md-6">
	<h1>Q&A</h1>
    	<div class="card">
	        <div class="card-body">
	            <h4 class="card-title mb-3">${qna.QTITLE }</h4>
	            <h6 class="card-subtitle text-muted mb-4">
	                <i class="far fa-user"></i> <c:out value="${qna.QWRITER}"/>
	                <i class="far fa-clock"></i> <fmt:formatDate value="${qna.QDATE}" pattern="yyyy-MM-dd"/>
	            </h6>
	            <p class="card-text">${qna.QCONTENT}</p>
	        </div>
	        <div class="card-body">
	            <a href="#" class="btn btn-outline-secondary btn-sm" role="button">수정</a>
	            <a href="#" class="btn btn-outline-secondary btn-sm " role="button">삭제</a>
	        </div>
	        <div class="card-body">
	            <a href='<c:url value='/board/qnaList'/>' class="btn btn-success" role="button">목록으로</a>
	        </div>
	        <div class="card-body text-muted">
		        <ol class="breadcrumb">
			    	<li class="breadcrumb-item active" aria-current="page">댓글확인</li>
			    	
			  	</ol>
			  	<button type="button" id="comsubmit" class="btn btn-success">등록</button>
	        	<!-- <input type="text" value="댓글확인">
				<button type="button" class="btn btn-success">등록</button> -->
	    	</div>
  		</div>
    </div>

​
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>​