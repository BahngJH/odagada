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
	
	section{
		font-family: S-CoreDream-3Light;
	}
</style>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1> 오다가다 신고리스트</h1>
	</div>
</section>

<section class="photo-backround" data-image="${path}/resources/images/blackList.png">
</section>
​<section class="container">

	<table class="table table-hover">
		<tr>
			<td>신고한 회원</td>
			<td>신고 당한 회원</td>
			<td>신고 내용</td>
			<td>신고 날짜</td>
			<td>처리</td>
		</tr>
		<c:forEach var="list" items="${notifyList }">
			<tr>
			
				<td>${list.NOTIFYID }</td>
				<td>${list.NONNOTIFYID }</td>
				<td>${list.NCONTENT }</td>
				<td>${list.NDATE }</td>
				<td>
				<button class="btn btn-success" onclick="deleteNotify('${list.NOTIFYID}','${list.NONNOTIFYID}');">용서</button> &nbsp; 
				<button data-toggle="modal" data-target="#insertBlack"  data-notifyid="${list.NOTIFYID }" data-nonnotifyid="${list.NONNOTIFYID }" data-ncontent="${list.NCONTENT }" class="btn btn-danger">블랙</button>
				</td>
				
			</tr>
		</c:forEach>
	</table>
	
<!-- Modal -->
<div class="modal fade" id="insertBlack" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="myModalLabel">블랙할 기간을 입력하세요. </h5>
      </div>
      <div class="modal-body">
        <input type="text" id="blackCount" placeholder="1일 일 경우 => 1">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="insertBlack();">확인</button>
      </div>
    </div>
  </div></div>
  
	${pageBar }
</section>

<script>

	var NOTIFYID="";
	var NONNOTIFYID="";
	var NCONTENT="";
	
	$(document).ready(function() {     
	    $('#insertBlack').on('show.bs.modal', function(event) {          
	        NOTIFYID = $(event.relatedTarget).data('notifyid');
	        NONNOTIFYID = $(event.relatedTarget).data('nonnotifyid');
	        NCONTENT = $(event.relatedTarget).data('ncontent');
	    });
	});
	
	
	function deleteNotify(notifyid,nonnotifyid)
	{
		var ncontent=$(event.target).parent("td").prev().prev().text();
		location.href='${path}/admin/deleteNotify.do?notifyId='+notifyid+'&nonNotifyId='+nonnotifyid;
	}
	
	function insertBlack()
	{
		var blackCount = $('#blackCount').val();
		if(blackCount==""){
			alert("블랙할 기간을 쓰세요");
			return false;
		}
		var numCk = /[^0-9]/g;
		if(numCk.test(blackCount)){
			alert("숫자만 입력하세요");
			return false;
		}
		location.href='${path}/admin/insertBlack.do?notifyId='+NOTIFYID+'&nonNotifyId='+NONNOTIFYID+'&nContent='+NCONTENT+'&blackCount='+blackCount;
	}
</script>

​
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>​