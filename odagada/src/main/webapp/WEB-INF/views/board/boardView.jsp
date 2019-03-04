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
table thead th#title{
	font-weight: bold;
	font-size: 30px;
	text-align: center;
}

</style>

<section id="board-container" class="container">
<%-- <div class="row">
	<div class="col-12 col-md-8" id="tbl-title">공지사항</div>
	<hr>
</div>
<div class="row">
<div class="col-md-4">
		<div class="col">제목</div>
		<div class="col"><c:out value="${board.BOARDTITLE }"/></div>
</div>
<div class="col-md-4">
		<div class="col">작성일</div>
		<div class="col"><c:out value="${board.BDATE}"/></div>
</div>
</div>
<div class="col-md-4">
	<div class="col">첨부파일</div>
	<div class="col">첨부파일위치</div>
</div>
<div class="col-md-4">
	<div class="col">조회수</div>
	<div class="col"><c:out value="${board.BCOUNT}"/></div>
</div>
	<div class="col-6 col-md-4"><c:out value="${board.BCONTENT}"/></div>
	 --%>
	
<table class="table" class="table table-hover">
  <thead>
	  <th colspan="4" id="title">공지사항</th>
  </thead>
  <tbody>
    <tr>
    	<th id='BTitle'>글 제목</th>
    	<td colspan="2" placeholder="제목" name="boardTitle" id="boardTitle" required><c:out value="${board.BTITLE}"/></td>
    </tr>
    <tr>
    	<th id="BDate">작성일</th>
	    	<td colspan="2" placeholder="작성일" name="boardDate" id="boardDage"><c:out value="${board.BDATE}"/></td>
    	<th id="BCount">조회수</th>
    		<td colspan="2" placeholder="조회수" name="boardCount" id="boardCount"><c:out value="${board.BCOUNT }"/></td>
    </tr>
    <tr>
      <th id="BFile">첨부파일</th>
      <td colspan="4" id="BFile">첨부파일 ㅋㅋ</td>      
    </tr>
    <tr>
    	<th>내용</th>
    	<td colspan="4" name="boardContent" id="boardContent"><c:out value="${board.BCONTENT}"/></td>
    </tr>
    <tr>
    	<td colspan="5" style="text-align: center;">
    	<button class="btn btn-outline-success">목록</button>
    	<button class="btn btn-outline-success">수정</button>
    	<button class="btn btn-outline-success">삭제</button>
    	</td>
    </tr>
    
  </tbody>

</table>


</section>








<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>