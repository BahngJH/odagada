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
		background-image: url(${pageContext.request.contextPath}/resources/images/miniHeader1.png);
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
	table td input#enrollResult{
		border: 1px solid rgba(0,0,0,0);
	}
	section{
		font-family: S-CoreDream-3Light;
	}
	h1{
		text-align: center;
	}
	#d_badge{
		color : #fff;
		background-color: #28a745;
		display: inline-block;
		padding: 0.25em 0.4em;
		font-weight : bold;
		line-height: 1;
		text-align: center;
		white-space: nowrap;
		vertical-align: baseline;
		border-radius: 0.25rem;
		font-size: 15px;
		
	}
	.form_Title{
		margin : 5;
	}
	#cSpan{
		font-size: 20px;
	}
	#carouselExampleIndicators
	{
		width: 500px;
		height: 350px;
	}
	
	#memProfile{
		border-radius: 100%;
		width: 250px;
		height: 250px;
		margin-left: 30%;
	}
	
	div.container{
		font-family: S-CoreDream-3Light;
	}

</style>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1> 오다가다 드라이버 관리</h1>
	</div>
</section>

<section class="photo-backround" data-image="${path}/resources/images/miniHeader1.png">
</section>
<div id="driverForm-container" class="container" style="margin-top: 0px;">
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<div class="row container" id="memberImg" style="margin-top: 0px;">
				<img id="memProfile" src="${path}/resources/upload/profile/${driver.PROFILEIMAGERE}" >
			</div>
			<div class="row">
				<div class="col form_Title" >
					<span id="d_badge">아이디</span>&nbsp;&nbsp;<span id="cSpan"> <c:out value="${driver.MEMBERID}"/></span>
				</div>
			</div>
			<div class="row">
				<div class="col form_Title">
					<span id="d_badge">이름</span>&nbsp;&nbsp; <span id="cSpan"><c:out value="${driver.MEMBERNAME }"/></span>
				</div>
			</div>
			<div class="row">
				<div class="col form_Title">
					<span id="d_badge">생년월일</span>&nbsp;&nbsp; <span id="cSpan"><c:out value="${driver.BIRTH }"/></span>
				</div>
			</div>
			<div class="row">
				<div class="col form_Title">
					<span id="d_badge">핸드폰번호</span>&nbsp;&nbsp; <span id="cSpan"><c:out value="${driver.PHONE }"/></span>
				</div>
			</div>
			<div class="row">
				<div class="col form_Title">
					<span id="d_badge">운전면허번호</span>&nbsp;&nbsp; <span id="cSpan"><c:out value="${licenseNum}"/></span>
				</div>
			</div>
			<div class="row">
				<div class="col form_Title">
					<span id="d_badge">차종</span>&nbsp;&nbsp; <span id="cSpan"><c:out value="${driver.CARMODEL }"/></span>
				</div>
			</div>
			<div class="row">
				<div class="col form_Title">
					<span id="d_badge">차 번호</span>&nbsp;&nbsp; <span id="cSpan"><c:out value="${driver.CARNUM }"/></span>
				</div>
			</div>
			<div class="row">
				<div class="col form_Title">
					<span id="d_badge">자동차 사진</span><br><br>
					<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
						  <div class="carousel-inner">
							  <c:forEach items="${carImg}" var="c" varStatus="t">					    
									  <div class="carousel-item ${c.active }">
									  	<img class="d-block w-100" style="width: 500px;height: 350px;" src="${path }/resources/upload/car/${c.CARIMAGERE}" >
									  </div>
							  </c:forEach>
						  </div>
						  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="sr-only">이전</span>
						  </a>
						  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="sr-only">다음</span>
						  </a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<c:if test="${driver.DRIVERSTATUS eq 'N'}">
						<form action="${path}/driver/driverFormEnd?memberNum=${driver.MEMBERNUM}&&driverStatus=${driver.DRIVERSTATUS}" method="post">
							<input type="submit" class="btn btn-outline-success" value="드라이버 승인">
						</form>
						<button class="btn btn-outline-success" data-toggle="modal" data-target="#MsgModal" data-membernum="${driver.MEMBERNUM}">드라이버 승인 거절</button>		
					</c:if>
					<c:if test="${driver.DRIVERSTATUS eq 'Y'}">
						<button class="btn btn-outline-success" onclick="javascript:location.href='${path}/driver/driverList';">목록</button>
					</c:if>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="MsgModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">승인거절 메세지를 입력해주세요.</h5>
<!-- 				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">X</span>
				        </button> -->
				      </div>
				      <div class="modal-body">
				        <input type="text" id="carMsg" name="carMsg" style="width: 300px;" placeholder="ex) 잘못된 자동차 사진입니다.">
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				        <button type="button" class="btn btn-primary" onclick="insertCarMsg();">전송</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div>		
		</div>
	</div>		
</div>

<script>
$(function(){
	$('.carousel').carousel()

	function fileDownload(oName,rName)
	{
		oName = encodeURIComponent(oName);
		location.href="${path}/board/filedownLoad.do?oName="+oName+"&rName="+rName;
	}
});
	var MEMBERNUM ="";

	$(document).ready(function(){
		$('#MsgModal').on('show.bs.modal',function(event){
			MEMBERNUM = $(event.relatedTarget).data('membernum');
		});
	});
	
	function insertCarMsg()
	{
		var carMsg = $('#carMsg').val();
		if(carMsg==""){
			alert("승인 거절 사유를 입력하세요.");
			return false;
		}
		var msg = /[ㄱ-ㅎ가-힣,.\s]/g;
		if(!msg.test($("input[name=carMsg]").val())){
			alert("한글,',','.',' '만 입력 가능합니다.");
			return false;
		}
		
		location.href='${path}/driver/driverRefuse?memberNum='+MEMBERNUM+'&carMsg='+carMsg;
	}

</script>
​
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>​