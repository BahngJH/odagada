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
	div#review-container {
	width: 600px;
	}
	div#review-container ul{
	list-style:none;
	padding-left:0px;
	}
	div#review-container h3{
	text-align:center;
	}
	div#review-context{
	border: 1px solid #DDD;
    border-radius: 16px;
    height: 180px;
    margin-bottom: 10px;
    padding:10px;
    height: auto;
	}
	div#writerNum{
	text-align: left;
	margin-bottom:5px;
	}
	span#review-content{
	text-align: Left;
	}
	/* 별점 css 테스트 */
	.star-rating 
	{ 
		width:150px; 
	}
	.star-rating,.star-rating span 
	{ 
		display:inline-block; 
		height:21px; 
		overflow:hidden; 
		background:url(${pageContext.request.contextPath}/resources/images/star1.png)no-repeat; 
	}
	.star-rating span
	{ 
		background-position:left bottom; 
		line-height:0; 
		vertical-align:top; 
	} 
	.star-rating span
	{ 
		background-position:left bottom; 
		line-height:0; 
		vertical-align:top; 
	}
	
	div#enroll-container{width:400px; margin:0 auto;}
	div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
	.menu{text-align:center; font-weight:bold;}
	.info{margin-top:50px; margin-bottom: 50px;}
	#answer{height:50%;}
</style>

<section class="container">
	<div class="row">
		<div class="col-12 col-md-4">
			<div class="menu_list info list-group">
				<a class="list-group-item list-group-item-action">회원 정보관리</a> 
				<a href="#" class="list-group-item list-group-item-action">드라이버정보 관리</a> 
				<a href="${path }/member/myCarpool" class="list-group-item list-group-item-action">카풀 내역</a> 
			</div>
		</div>
		<div id="review-container">
			<h3>내가 작성한 리뷰</h3>
			<div style="overflow: scroll; height: 500px;">
				<c:if test="${empty list}">
					<h2 style="color: red; text-align: center;">작성한 리뷰가 없습니다.</h2>
				</c:if>
				<c:forEach items="${list}" var="r">
					<ul id="review-list">
						<div id="review-context">
							<div class="review-content" id="memberName">
								운전자 : ${driverName}
							</div>
							<div class="star-div">
								<fmt:parseNumber value="${r.RGRADE}" type="number" var="rg" />
								<c:choose>
									<c:when test="${rg >=0 && rg <= 0.5 }">
										<span class="star-rating"> <span style="width: 7.6%"></span>
										</span>
									</c:when>
									<c:when test="${rg >0.5 && rg <= 1 }">
										<span class="star-rating"> <span style="width: 15.2%"></span>
										</span>
									</c:when>
									<c:when test="${rg >1 && rg <= 1.5 }">
										<span class="star-rating"> <span style="width: 22.8%">
										</span>
										</span>
									</c:when>
									<c:when test="${rg >1.5 && rg <= 2 }">
										<span class="star-rating"> <span style="width: 30.4%"></span>
										</span>
									</c:when>
									<c:when test="${rg >2 && rg <= 2.5 }">
										<span class="star-rating"> <span style="width: 38%"></span>
										</span>
									</c:when>
									<c:when test="${rg >2.5 && rg <=3.0 }">
										<span class="star-rating"> <span style="width: 45.6%"></span>
										</span>
									</c:when>
									<c:when test="${rg >3.0 && rg <= 3.5 }">
										<span class="star-rating"> <span style="width: 53.2%"></span>
										</span>
									</c:when>
									<c:when test="${rg >3.5 && rg <= 4.0 }">
										<span class="star-rating"> <span style="width: 60.8%"></span>
										</span>
									</c:when>
									<c:when test="${rg >4.0 && rg <= 4.5 }">
										<span class="star-rating"> <span style="width: 68.4%"></span>
										</span>
									</c:when>
									<c:when test="${rg >4.5 && rg <= 5.0 }">
										<span class="star-rating"> <span style="width: 76%;"></span>
										</span>
									</c:when>
								</c:choose>
							</div>
							<div id="review-content">
								<span id="rContent" name="rContent"><c:out value="${r.RCONTENT}"/></span> 
								<br/>
								<br/>
								<span id="rDate"name="rDate"><c:out value="${r.RDATE }" /></span>
								<br/>
								<input type="button" class="btn btn-outline-success" value="수정" onclick="location.href='${path}/community/reviewModify.do?carpoolNum=${r.CARPOOLNUM }&memberNum=${logined.memberNum }&driverName=${driverName }';"style="margin-left: 440px;"> 
								<input type="button" class="btn btn-outline-success" value="삭제" onclick="location.href='${path}/community/reviewDelete.do?carpoolNum=${r.CARPOOLNUM }&memberNum=${logined.memberNum }';">
							</div>
						</div>
					</ul>
				</c:forEach>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>