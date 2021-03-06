<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,com.spring.odagada.member.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	Member m = (Member) request.getAttribute("logined");
	System.out.println(m);
    String eDate []=m.getEnrollDate().split(" ");
%>

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

div#enroll-container {
	width: 400px;
	margin: 0 auto;
}

div#enroll-container input, div#enroll-container select {
	margin-bottom: 10px;
}

.menu {
	text-align: center;
	font-weight: bold;
}

.info {
	margin-top: 50px;
	margin-bottom: 50px;
}

span.span-option {
	float: right;
}

.col-text {
	color: black;
}

span.span_city {
	font-size: 13px;
	color: black;
}

button.start-search {
	float: right;
}

div.status_option>span {
	float: right;
}

div.driver>span{
	float: left;
}

a#pay{
	color: #FFFFFF;
}
.re-btn{
	width:60px;
	height:30px;
	font-size:11px;
	text-align: center;
	float:right;
	padding:0px;
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
		
		<div class="col-12 col-md-9" id="enroll-container">	
			<div class="info col-12 col-sm-12 col-md-10">
				<!-- 조건만큼 검색 결과 출력 -->
				<c:if test="${carpoolList.isEmpty() }">
					<h3>조회 결과가 없습니다.</h3>
				</c:if>
				<c:if test="${carpoolList.size()>0 }">
					<c:forEach items="${carpoolList }" var="list">
				      <div id="div-pick" class="card border-success mb-3">
				        <div class="card-body text-success">
				          <div class="row">
				             <div class="col-12">
					             <span class="span_city">${list.STARTDATE }</span>
								 <span class="span-option col-text">${list.PAY }원</span><br/>
					             <span class="badge badge-primary">출발</span>
					             <span class="span_city">${list.STARTCITY} ${list.STARTDETAIL }</span> <br/>
					             <span class="badge badge-success">도착</span>
					             <span class="span_city">${list.ENDCITY} ${list.ENDDETAIL }</span> <br>
				             </div>
				             <div class="col-12">
				                <div class="row">
				                	<div class="col-8 driver">
				                        <span class="span-option col-text">운전자 : ${list.MEMBERID}(${list.MEMBERNAME })</span><br/>
				                   </div>
				                   <div class="offset-2 col-2">
				                   <c:if test='${list.PAYSTATUS == "Y"}'>
				                   		<c:choose>
											<c:when test="${list.WRITERNUM != null }">
												<span> 
													<input type="button" value="리뷰보기" id='btn-myReviewView' class='btn btn-success re-btn' onclick='location.href="${path}/community/myReviewView.do?memberNum=${logined.memberNum}&carpoolNum=${list.CARPOOLNUM }&driverName=${list.MEMBERNAME }"'/>
												</span>
											</c:when>
											<c:otherwise>
												<span>
													<input type="button" class="btn btn-outline-success re-btn" value="리뷰작성" onclick="location.href='${path}/community/reviewForm.do?memberNum=${logined.memberNum }&driverNum=${list.MEMBERNUM }&memberName=${list.MEMBERNAME}&carpoolNum=${list.CARPOOLNUM }';">
												</span>
											</c:otherwise>
										</c:choose>
										<span>
											<input type="button" class="btn btn-outline-danger re-btn" value="신고하기"onclick="location.href='${path}/community/notifyForm.do?driverId=${list.MEMBERID }&driverName=${list.MEMBERNAME }'">
										</span>
									</c:if>
				                   </div>
				                   <div class="col status_option">
				                   		<c:if test='${list.PAYSTATUS == "N" }'>
					                        <span class="badge badge-danger"><a id="pay" data-toggle="modal" href="#payModal${list.PAYCODE }">결제 코드</a></span>
					                        <!-- Modal -->
											<div class="modal fade" id="payModal${list.PAYCODE }" tabindex="-1" role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
											  <div class="modal-dialog" role="document">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h5 class="modal-title" id="payModalLabel">결제 코드</h5>
											        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
											          <span aria-hidden="true">&times;</span>
											        </button>
											      </div>
											      <div class="modal-body">
											        ${list.PAYCODE }
											        
											      </div>
											      <div class="modal-footer">
											      	<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="payCancel(${list.CARPOOLNUM });">결제 취소</button>
											        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
											      </div>
											    </div>
											  </div>
											</div>
											<script>
												function payCancel(carpoolNum){
													var isCancel = confirm("정말 취소하시겠습니까?");
													if(isCancel){
														console.log("취소 시작");
														console.log(carpoolNum);
														$.ajax({
															url:"${path}/carpool/paymentCancel",
															type:"post",
															data:{
																"carpoolNum" : carpoolNum,																	
															},
															success:function(response){
																if(response === "ok"){
																	alert("결제 취소 성공");
																}else{
																	alert("결제 취소 실패");
																}
																location.reload();
															}
														});
													}
												}
											</script>
				                   		</c:if>
				                   		<c:if test='${list.PAYSTATUS == "Y"}'>
											<span class="badge badge-success">결제 완료</span>
										</c:if>
										<span>
										&nbsp;&nbsp;
										</span>
				                   		<c:if test='${list.PSTATUS == "N" }'>
					                        <span class="badge badge-danger">미승인</span>
				                   		</c:if>
				                   		<c:if test='${list.PSTATUS == "Y"}'>
											<span class="badge badge-success">승인</span>
										</c:if>
										<c:if test='${list.PSTATUS == "R"}'>
											<span class="badge badge-warning">승인거절</span>
                   						</c:if>
										<c:if test='${list.PSTATUS == "C" }'>
											<span class="badge badge-warning">결제 취소</span>
										</c:if>
										<span>&nbsp;&nbsp;</span>
				                   </div>
				                </div>
				             </div>
				          </div>
				        </div>
				      </div>
					</c:forEach>
				</c:if>
					<div class="row ">
		<div class="col-12 text-center">
			<nav aria-label="Page navigation">
				${pageBar }
			</nav>
		</div>
	</div>
		     </div>

		</div>
	</div>

      
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>