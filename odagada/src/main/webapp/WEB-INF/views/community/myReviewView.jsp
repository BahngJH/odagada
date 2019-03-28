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
		background-image: url(${pageContext.request.contextPath}/resources/images/person.png);
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
	.info {
	margin-top: 50px;
	margin-bottom: 50px;
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
		background:url(${pageContext.request.contextPath}/resources/images/option-icon/star.png)no-repeat; 
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
	
	#rtitle{
	text-align:center;
	font-size:40px;
	}
</style>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1 id="miniTitle">나의 오다, 가다</h1>
	</div>
</section>
<section class="photo-backround" data-image="${path}/resources/images/person.png">
</section>
<section class="container" style="margin-top: 0px;">
	<div class="row">
		<div class="col-12 col-md-3">
			<div class="menu_list info list-group">
				<a href="${path }/member/myInfo.do" class="list-group-item list-group-item-action">나의 정보</a>
				<a href="${path }/member/myCarpool" class="list-group-item list-group-item-action  active">카풀 동승 내역</a>
				<c:if test="${driver ne null}">
				<a href="${path}/member/myDriver" class="list-group-item list-group-item-action">나의 드라이버 정보</a>
				<a href="${path }/driver/driverCarpool" id="driverCarpool" class="list-group-item list-group-item-action">등록한 카풀 내역</a>
				</c:if>
			</div>
		</div>
		<div class="col-12 col-md-9" id="review-container">	
			<div class="info col-12 col-sm-12 col-md-9">
				<p id="rtitle">내가 작성한 리뷰</p>
				<div>
					<c:if test="${empty list}">
						<h2 style="color: red; text-align: center;">작성한 리뷰가 없습니다.</h2>
					</c:if>
					<c:forEach items="${list}" var="r">
							<div id="review-context">
								<div class="review-content" id="memberName">
								<%-- ${list.MEMBERID}(${list.MEMBERNAME }) --%>
									운전자 : ${r.MEMBERID}(${r.MEMBERNAME})
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
								<div id="review-content" >
									<span id="rContent" ><c:out value="${r.RCONTENT}"/></span> 
									<br/>
									<br/>
									<span id="rDate"><fmt:formatDate value="${r.RDATE}" pattern="yyyy-MM-dd"/></span>
									<br/>
									<div style="height:50px;">	
										<span><input type="button" class="btn btn-outline-success" value="삭제" onclick="location.href='${path}/community/reviewDelete.do?carpoolNum=${r.CARPOOLNUM }&memberNum=${logined.memberNum }';"style="float: right;"></span>
										<span><input type="button" class="btn btn-outline-success" value="수정" onclick="location.href='${path}/community/reviewModify.do?carpoolNum=${r.CARPOOLNUM }&memberNum=${logined.memberNum }&driverName=${driverName }';"style="float: right;"></span> 
									</div>	
								</div>
							</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>