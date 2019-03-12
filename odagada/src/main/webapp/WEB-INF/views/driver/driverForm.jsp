<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>;
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>;
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>;
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<style>
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

</style>
<div id="driverForm-container" class="container">
	<h1>드라이버 신청 내역</h1><br><br/>
	<div class="row">
		<div class="col-md-6 offset-md-3">
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
					<span id="d_badge">운전면허번호</span>&nbsp;&nbsp; <span id="cSpan"><c:out value="${driver.LICENSENUM }"/></span>
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
					  <ol class="carousel-indicators">
					    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
					  </ol>
					  <div class="carousel-inner">
						  <c:forEach items="${carImg}" var="c" varStatus="t">					    
								  <div class="carousel-item ${c.active }">
								  	<img class="d-block w-100" src="${path }/resources/upload/car/${c.CARIMAGERE}" >
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
							<input type="submit" class="btn btn-outline-success" value="승인">
						</form>
						
					</c:if>
					<c:if test="${driver.DRIVERSTATUS eq 'Y'}">
						<form action="${path}/driver/driverFormEnd?memberNum=${driver.MEMBERNUM}&&driverStatus=${driver.DRIVERSTATUS}" method="post">
							<input type="submit" class="btn btn-outline-success" value="승인취소">
						</form>
					</c:if>
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
</script>
​
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>​