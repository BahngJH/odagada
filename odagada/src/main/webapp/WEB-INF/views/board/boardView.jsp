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
	table thead th#boardTitle{
	/* font-weight: bold; */
	font-size: 25px;
	text-align: center;
	font-family: silgothic;
	}
	div div#bTITLE{
	font-weight: bold;
	font-size: 30px;
	text-align: center;
	color:#393939;
	
	}
	hr {
  	border-top: 1px dashed #bbb;
	}
	#board-container{
		margin-top: 50px;
		margin-bottom: 30px;
	}

</style>

<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1> 오다가다의 새로운 소식</h1>
	</div>
</section>
<section class="photo-backround" data-image="${path}/resources/images/boardList3.png">
</section>
<section id="board-container" class="container">
	<div class="col-md-8 offset-md-2">
	<table class="table" class="table table-hover">
	  <thead>
		  <th colspan="4" id="boardTitle" name="boardTitle" required><c:out value="${board.BTITLE}"/></th>
	  </thead>
	  <tbody>
	    <tr>
<%-- 	    	<th id='BTitle'>글 제목</th>
	    	<td colspan="2" placeholder="제목" name="boardTitle" id="boardTitle" required><c:out value="${board.BTITLE}"/></td>
	    </tr> --%>
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
				<button class="btn btn-outline-success" onclick="javascript:location.href='${path}/board/boardDelete?boardNo=${board.BOARDNO}';">삭제</button>
			</c:if>   	    	
	    	
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