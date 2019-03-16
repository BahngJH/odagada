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
/* div div.col-md-6{
	font-weight: bold;
	font-size: 40px;
	text-align: center;
} */
div div#bTITLE{
	font-weight: bold;
	font-size: 30px;
	text-align: center;
	color:#393939;
	
}
hr {
  border-top: 1px dashed #bbb;
}

</style>

<section id="board-container" class="container">
	<div class="col-md-6 offset-md-3">
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
		    	<td placeholder="작성일" name="boardDate" id="boardDage"><c:out value="${board.BDATE}"/></td>
	    	<th id="BCount">조회수</th>
	    		<td placeholder="조회수" name="boardCount" id="boardCount"><c:out value="${board.BCOUNT }"/></td>
	    </tr>
	    <tr>
	      <th id="BFile">첨부파일</th>
	      <td colspan="3" id="BFile">
	      	<button type="button" class="btn btn-outline-success btn-block" onclick="fileDownload('${board.BORIFILENAME}','${board.BREFILENAME}');">
	      		첨부파일 - ${board.BORIFILENAME}
	      	</button>
	      </td>      
	    </tr>
	    <tr>
	    	<th>내용</th>
	    	<td colspan="3" name="boardContent" id="boardContent"><c:out value="${board.BCONTENT}"/></td>
	    </tr>
	    <tr>
	    	<td colspan="4" style="text-align: center;">
	    	<button class="btn btn-outline-success" onclick="javascript:location.href='${path}/board/boardList';">목록</button>
	    	<c:set var="isAdmin" value="${logined.isAdmin}"/>
	    	<c:if test="${isAdmin eq '1'}">
				<button class="btn btn-outline-success" onclick="javascript:location.href='${path}/board/boardModify?boardNo=${board.BOARDNO}';">수정</button>
			</c:if>   	    	
	    	<button class="btn btn-outline-success" onclick="javascript:location.href='${path}/board/boardDelete?boardNo=${board.BOARDNO}';">삭제</button>
	    	</td>
	    </tr>    
	  </tbody>
	</table>
	</div>
</section>
<script>
	function fileDownload(oName,rName)
	{
		oName = encodeURIComponent(oName);
		location.href="${path}/board/filedownLoad.do?oName="+oName+"&rName="+rName;
	}
</script>








<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>