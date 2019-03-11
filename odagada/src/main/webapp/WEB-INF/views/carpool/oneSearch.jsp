<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%@page import="java.util.*,com.spring.odagada.carpool.model.vo.Carpool"%>
<%
	int seat = (int)request.getAttribute("seat");
	List pList = (List)request.getAttribute("pList"); 
	int stop=0;
%>
<style>
	input.search-div{
		margin:13px;
	}
	span.icon-right{
		margin-top:15px;
	}
	button.start-search{
		margin-top:13px;
	}
	img.option-icon{
		width:50px;height:50px;
		float:left;
		margin:7px;
	}
	button.btn-chat{
		font-size: 13px;
		margin-top:10px;
		margin-bottom: 10px;
	}
	img.driver-img{
		width:80px;height:80px;
		border-radius: 100px;
		float:left;
		margin:19px;
	}
	span.line-div{
		border:1px solid rgb(230,230,230);
		 height:100px;
		float:left;
		border-style: dashed;
		margin-top:10px;
	}
	p.intro-p{
		display:block;
		overflow: hidden; 
/*  		text-overflow: ellipsis;
		white-space: nowrap; */
		width: auto;
		height: 50px;
		margin:30px;
	}
	button.ride-btn{
		margin:10px;
		margin-top:40px;
	}
	img.seat-img{
		width:45px;height:45px;
		margin:8px;
	}
	div.seat-div{
		margin-top:12px;
	}
	img.car-img{
		width:100px; height:100px;
		border:1px;
	}
	span.car-span{
		margin-left:10px;
	}
	img.re-img{
		margin-top:20px;
		margin-left:4px;
		width:70px;height:70px;
		border-radius: 30px;
	}
	div.re-div{
		margin-top:12px;
	}
</style>
<section id="container">
	<div class="row">
		<div class="col-12 col-md-2"></div>
		<div class="col-12 col-md-8">
			<div class="input-group">
				<input class="form-control search-div" type="text" placeholder="출발지" value="${search.startCity }" readonly>
				<span class="fas fa-arrow-right fa-2x icon-right"></span>
				<input class="form-control search-div" type="text" placeholder="도착지" value="${search.endCity }" readonly>
				<input type="text" class="form-control search-div" value="${search.startDate }" readonly>
			</div>
		</div>
		<div class="col-12 col-md-2"></div>
	</div>
	<hr>
	<!-- body -->
	<div class="row">
		<div class="col-12 col-md-2"></div>
		<div class="col-12 col-md-5">
			<div class="card">
			  <div class="card-header">
			    <ul class="nav nav-tabs card-header-tabs">
			      <li class="nav-item" id="li1" >
			        <a class="nav-link active" >카풀 정보</a>
			      </li>
			      <li class="nav-item"id="li2" >
			        <a class="nav-link" >경로 보기</a>
			      </li>
			    </ul>
			  </div>
			  <div class="card-body">
			  	<!-- 경로 정보 -->
			  	<c:forEach items="${oList}" var="o">
				  	<div class="row">
				  		<div class="col-12">
				  			<span class="badge badge-pill badge-warning">출발</span>
				  			<span> |&nbsp;${o.STARTCITY } ${o.STARTDETAIL}</span>
				  		</div>
			  		</div><br>
			  		<div class="row">
				  		<div class="col-12">
				  			<span class="badge badge-pill badge-warning">도착</span>
				  			<span> |&nbsp;${o.ENDCITY } ${o.ENDDETAIL}</span>
				  		</div>
			  		</div><br>
			  		<div class="row">
				  		<div class="col-6">
				  			<span class="badge badge-pill badge-warning">출발일</span>
				  			<span> |&nbsp;${fn:substring(o.STARTDATE,0,10)}</span>
			  			</div>
			  			<div class="col-6">
				  			<span class="badge badge-pill badge-warning">출발 예정 시간</span>
				  			<span> |&nbsp;${fn:substring(o.STARTDATE,11,19)}</span>
				  		</div>
			  		</div><br>
			  		<div class="row">
						<div class="col-12">
				  			<span class="badge badge-pill badge-warning">인당 금액</span>
				  			<span> |&nbsp;￦ ${o.PAY }</span>
				  		</div>
			  		</div>
				  	<hr>
				  	<!-- 드라이버 소개 -->
				  	<div class="card text-center">
				  		<div class="row">
				  			<div class="col-3">
								<span>
				  					<img src="${path }/resources/images/ilhoon2.jpg" class="driver-img"/>
				  					<span class="line-div"></span>
				  				</span>
				  			</div>
				  			<div class="col-9">
				  				<p class="intro-p">${o.INTRODUCE }</p>
				  			</div>
				  		</div>
				  	</div>
			  	</c:forEach>
			  </div>
			</div>
			<br>
			<div class="row">
				<div class="col-12">
					<div class="card">
					  <div class="card-header">이용 현황</div>
					  <div class="card-body">
					  	<div class="row">
					  		<div class="col-8">
					  			<span class="badge badge-pill badge-warning">이용 좌석 </span>
					  			<span>&nbsp;| &nbsp;(${fn:length(pList)}/${seat })</span>
					  		</div>
					  	</div>
					  	<div class="row">
					  		<div class="col-12">
					  			<div class="card seat-div">
					  				<div class="row">
					  					<div class="col-9">
					  						<span>
										  		<c:forEach begin="1" end="${seat }"  var="count">
										  			<c:choose>
											  			<c:when test="${count <= fn:length(pList)}">
										  						<img src="${path }/resources/images/option-icon/full.png" class="seat-img"/>
								  						</c:when>
								  						<c:otherwise>
								  							<img src="${path }/resources/images/option-icon/empty.png" class="seat-img"/>
							  							</c:otherwise>
							  						</c:choose>
							  					</c:forEach>
						  					</span>
					  					</div>
					  					<div class="col-3">
					  					<span class="line-div"></span>
					  						<button class="btn btn-success ride-btn" onclick="ridePayment();">탑승 신청</button>
					  						<script>
					  							function ridePayment(){
					  								if(${logined == null}){
					  									return alert("로그인 필요");
					  								}

					  								$.ajax({
		  												url: "${path}/carpool/paymentEnd",
		  												data: {"carpoolNum": "${oList.get(0).CARPOOLNUM}",
		  														"memberNum": "${logined.memberNum}"	
		  												},
		  												type: "post",
		  											 	success:function(result){
		  													if(result==="ok"){
		  														alert("신청 완료");
		  													}else if(result ==="no"){
		  														alert("신청 실패");
		  													}
		  													
															location.reload();
		  											 	}
		  											});
					  								
					  								/* 
				  									var imp = window.IMP;
				  									imp.init('imp87992639');
				  									
				  									imp.request_pay({
				  										pg : 'inicis',
				  										amount : '${oList.get(0).PAY}',
				  										pay_method : 'card',
				  										merchant_uid : 'merchant_' + new Date().getTime(),
				  										name : '주문명: 결제테스트',
				  										buyer_email : '${logined.email}',
				  										buyer_name : '${logined.memberName}',
				  										buyer_tel : '${logined.phone}',
				  										m_redirect_url : '${path}/'
				  									}, function(rsp){
				  										if(rsp.success){
				  											$.ajax({
				  												url: "/carpool/paymentEnd",
				  												data: {"carpoolNum": "${oList.get(0).CARPOOLNUM}",
				  														"memberNum": "${logined.memberNum}"	
				  												},
				  												type: "post",
				  											 	success:function(result){
				  													console.log(result);
				  											 	}
				  											});
				  										}else{
				  											console.log(rsp);
				  										}
				  									}) */
			  									};
					  						</script>
					  					</div>
					  				</div>
					  				
			  					</div>
					  		</div>
					  	</div>
					  </div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-3">
			<div class="card bg-light mb-3">
			  <div class="card-header">드라이버 정보</div>
			  <div class="card-body">
			     <div class="row">
				  	<div class="col-12">
					  	<div class="card text">
					  		<span class="badge badge-secondary">드라이버 선택 옵션 </span>
					  		<c:forEach items="${oList}" var="c">
					  			<span class="span-option">
						  			<c:if test='${c.ANIMAL eq "Y"}'>
						  				<span><img src="${path }/resources/images/option-icon/animal.png" class="option-icon"></span>
						  			</c:if>
				  					<c:if test='${c.SMOKING eq "Y"}'>
				  						<span><img src="${path }/resources/images/option-icon/smoking.png" class="option-icon"></span>
									</c:if>
									<c:if test='${c.TEENAGE eq "Y"}'>
										<span><img src="${path }/resources/images/option-icon/teenage.png" class="option-icon"></span>
									</c:if>
									<c:if test='${c.TALKING eq "Y"}'>
										<span><img src="${path }/resources/images/option-icon/talking.png" class="option-icon"></span>
									</c:if>
									<c:if test='${c.MUSIC eq "Y"}'>
										<span><img src="${path }/resources/images/option-icon/music.png" class="option-icon"></span>
									</c:if>
									<c:if test='${c.FOOD eq "Y"}'>
										<span><img src="${path }/resources/images/option-icon/food.png" class="option-icon"></span>
									</c:if>
									<c:if test='${c.BAGGAGE eq "Y"}'>
										<span><img src="${path }/resources/images/option-icon/baggage.png" class="option-icon"></span>
									</c:if>
									<c:choose>
										<c:when test='${c.GENDER eq "A"}'>
										</c:when>
										<c:when test='${c.GENDER eq "F"}'>
											<span><img src="${path }/resources/images/option-icon/genderF.png" class="option-icon"></span>
										</c:when>
										<c:when test='${ c.GENDER eq "M"}'>
											<span><img src="${path }/resources/images/option-icon/genderM.png" class="option-icon"></span>
										</c:when>
									</c:choose>
						  		</span>
							</c:forEach>
						</div>
				  	</div>
				  </div>
				  <!-- 채팅창 연결 버튼 -->
				  <div class="row">
				  	<div class="col-3"></div>
				  	<div class="col-6">
				  		<button class="btn btn-success search-div btn-chat">드라이버와 채팅</button>
				  	</div>
				  	<div class="col-3"></div>
				  </div>
				  <div class="row">
				  	<div class="col-12">
				  		<div class="card">
				  			<span class="badge badge-secondary">드라이버 차량 </span>
				  			<div class="row">
				  				<div class="col-10">
				  					<span class="badge badge-pill badge-warning car-span">차종 </span> <span>&nbsp;|&nbsp; ${oList[0].CARMODEL}</span>
				  				</div>
			  				</div>
			  				<div class="row">
				  				<div class="col-10">
				  					<span class="badge badge-pill badge-warning car-span">차량 번호  </span> <span>&nbsp;|&nbsp;${oList[0].CARNUM}</span>
				  				</div>
			  				</div>
				  			<hr>
				  			<span>
					  			<c:forEach items="${cList }" var="c">
				  					<img src="${path }/resources/images/${c.CARIMAGERE}" class="car-img"/>
					  			</c:forEach>
				  			</span>
				  		</div>
				  	</div>
				  </div>
				  <div class="row">
				  	<div class="col-12">
				  		<div class="card re-div">
				  			<span class="badge badge-secondary">리뷰</span>
				  			<div class="row">
				  				<c:forEach items="${rList }" var="r">
					  				<div class="col-4">
					  					<img src="${path }/resources/images/ilhoon2.jpg" class="re-img"/>
					  					<span class="line-div"></span>
					  				</div>
					  					<span class="line-div"></span>
					  				<div class="col-7">
					  					<div>
					  						별점 이미지: ${r.RGRADE }
					  					</div>
					  					<div>
					  						${r.RCONTENT }
				  						</div>
					  				</div>
				  				</c:forEach>

				  			</div>
				  		</div>
				  	</div>
				  </div>
				   <!-- 드라이버 신고 버튼 -->
				  <div class="row">
				  	<div class="col-3"></div>
				  	<div class="col-6">
				  		<button class="btn btn-danger search-div btn-chat">드라이버 신고하기</button>
				  	</div>
				  	<div class="col-3"></div>
				  </div>
			  </div>
			</div>
		</div>
		<div class="col-12 col-md-2">
		</div>
	</div>
	<!-- 카풀 이용객 현황 -->
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>