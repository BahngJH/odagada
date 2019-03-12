<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
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
		margin:14px;
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
		margin-top:35%;
	}
	span.line-div{
		border:1px solid rgb(230,230,230);
		height:auto;
		position:relative;
		float:left; 
		border-style: dashed;
		margin-top:10px;
	}
	div.intro-driver{
		position:relative;
		height:auto;
	}
	p.intro-p{
		/* display:block; */
		width: auto;
		margin:30px;
		position:relative;
		height:auto;
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
	p.dhead-p{
		margin-top:10px;
	}
	img.car-img{
		/* width:165px; height:165px; */
		border:1px;
		border-radius:3px;
		/* margin-left:22px;
		margin-bottom: 10px; */
		padding:10px;
	}
	span.car-span{
		margin-left:10px;
	}
	img.re-img{
		margin:10px;
		max-width:100%;height:70px;
		border-radius: 30px;
	}
	div.re-div{
		margin-top:12px;
		position:relative;
	}
	img.pas-img{
		width:70px; height:70px;
		border-radius:50px;
		margin:10px;
	}
	span.pas-span{
		float:left;
		border:none;
		margin-bottom:10px;
	}
	span.pas-name{
		margin-top:-30px;
	}
	div.star-div{
		margin-top:20px;
		margin-left:25px;
	}
/* 	.re-size{
		overflow:scroll;
	} */
	/* 별점 css 테스트 */
	.star-rating { width:150px; }
	.star-rating,.star-rating span { display:inline-block; height:21px; overflow:hidden; background:url(${pageContext.request.contextPath}/resources/images/option-icon/star.png)no-repeat; }
	.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; } 
	/* 지도 */
	/* 거리표시 팝업*/
	.mPop{
	    border: 1px;
	    background-color: #FFF;
	    font-size: 12px;
	    border-color: #FF0000;
	    border-style: solid;
	    text-align: center;
	}
	/*공통사용 클래스*/
	.mPopStyle {
	    border: 1px;
	    background-color: #FFF;
	    font-size: 12px;
	    border-color: #FF0000;
	    border-style: solid;
	    text-align:left;
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
	<div class="row">
		<div class="col-12 col-md-2"></div>
		<div class="col-12 col-md-5">
			<div class="card"  id="li-div">
			  <div class="card-header">
			    <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
			      <li class="nav-item" >
			        <a class="nav-link active" id="carpool-tab" data-toggle="tab" href="#carpool" role="tab" aria-controls="carpool" aria-selected="true">카풀 정보</a>
			      </li>
			      <li class="nav-item" >
			        <a class="nav-link" id="road-tab" data-toggle="tab" href="#road" role="tab" aria-controls="road" aria-selected="false">경로 보기</a>
			      </li>
			    </ul>
			  </div>
			  <div class="tab-content" id="myTabContent">
				  <div class="tab-pane fade show active" id="carpool" role="tabpanel" aria-labelledby="carpool-tab">
					  <div class=" card-body">
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
						  			<span> |&nbsp;${fn:substring(o.STARTDATE,11,20)}</span>
						  		</div>
					  		</div><br>
					  		<div class="row">
								<div class="col-12">
						  			<span class="badge badge-pill badge-warning">1인당 금액</span>
						  			<span> |&nbsp;￦ ${o.PAY }</span>
						  		</div>
					  		</div>
					  		<input type="hidden" value="${o.CARPOOLNUM }" id="carpoolNum" name="carpoolNum">
						  	<hr>
						  	<!-- 드라이버 소개 -->
						  	<div class="card text-center intro-driver" >
						  		<div class="row">
						  			<div class="col-3">
						  				<div class="row">
						  					<div class="col-10">
												<span>
								  					<%-- <img src="${path }/resources/images/${o.PROFILEIMAGERE}" class="driver-img"/> --%>
								  					<img src="${path }/resources/images/ilhoon2.jpg" class="driver-img"/>
								  				</span>
							  				</div>
						  				</div>
						  				<div class="row">
						  					<div class="col-12">
						  						<c:set var="driverId" value="${o.MEMBERID }"/>
						  						<span>${o.MEMBERNAME }</span>
					  						</div>
					  					</div>
						  			</div>
						  			<div class="col-9">
						  				<p class="intro-p">${o.INTRODUCE }</p>
						  				<input type="hidden" id="intro" name="intro" value="${o.INTRODUCE }"/>
						  				<div class="row">
						  					<c:if test="${fn:length(o.INTRODUCE) >= 65 }">
						  						<div class="col-2 offset-9 plus-content">
				  									<i class="fas fa-angle-down"></i>
						  						</div>
						  					</c:if>
						  				</div>
						  			</div>
						  		</div>
						  	</div>
					  	</c:forEach>
					  </div>
				  </div>
					<!-- 경로보기 tab -->
					<div class="tab-pane fade" id="road" role="tabpanel" aria-labelledby="road-tab" >
						<div class="card-body"  >
							<c:forEach items="${oList }" var="o">
								<!-- <div class="row">
									<div class="col-12"> -->
										<div id="map_div" style="width:600px; height:400px;"></div>
									<!-- </div>
								</div> -->
								<input type="hidden" value="${o.STARTLAT }" id="startLat" name="startLat">
								<input type="hidden" value="${o.STARTLONG }" id="startLong" name="startLong">
								<input type="hidden" value="${o.DESTLAT }" id="endLat" name="endLat">
								<input type="hidden" value="${o.DESTLONG }" id="endLong" name="endLong">
							</c:forEach>
						</div>
					</div>
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
					  			<c:set var='size' value='0'/>
					  			<fmt:parseNumber value="${size}" type="number" var="si"/>
					  			<c:if test='${fn:length(pList)!=0 }'>
						  			<c:forEach begin="0" end="${fn:length(pList)-1 }"  varStatus="count">
							  				<c:if test='${pList[count.index].PSTATUS eq "Y" }'>
							  					<c:set var="si" value='${si+1 }'/>
					  						</c:if>
				  					</c:forEach>
			  					</c:if>
				  				<span>&nbsp;| &nbsp;(${si}/${seat })</span>
					  		</div>
					  	</div>
					  	<div class="row">
					  		<div class="col-12">
					  			<div class="card seat-div">
					  				<div class="row">
					  					<div class="col-9">
					  						<span>
										  		<c:forEach begin="1" end="${seat }"  varStatus="count">
										  			<c:choose>
											  			<%-- <c:when test="${count.index <= fn:length(pList)}"> --%>
											  				<c:when test='${pList[count.index-1].PSTATUS eq "Y" }'>
										  						<img src="${path }/resources/images/option-icon/full.png" class="seat-img"/>
									  						</c:when>
								  						<%-- </c:when> --%>
								  						<c:otherwise>
								  							<img src="${path }/resources/images/option-icon/empty.png" class="seat-img"/>
							  							</c:otherwise>
							  						</c:choose>
							  					</c:forEach>
						  					</span>
					  					</div>
					  					<div class="col-3 col-md-12 col-lg-3">
					  						<span class="line-div"></span>
					  						<c:if test="${logined != null }">
					  							<c:set var="flag" value="false"/>
						  						<c:forEach items='${pList }' var='p' varStatus="count">
						  							<c:if test="${not flag }">
					  									<c:choose>
					  										<c:when test='${logined.memberNum == pList[count.index].MEMBERNUM and pList[count.index].PSTATUS eq "Y" }'>
					  											<button class="btn btn-danger ride-btn" onclick="checkIng();">탑승중</button>
					  											<c:set var="flag" value="true"/>
					  										</c:when>
					  										<c:when test='${logined.memberNum == pList[count.index].MEMBERNUM and pList[count.index].PSTATUS eq "N" }'>
					  											<button class="btn btn-danger ride-btn" onclick="checkSubmit();">탑승<br/>승인중</button>
					  											<c:set var="flag" value="true"/>
					  										</c:when>
					  									</c:choose>
						  							</c:if>
							  					</c:forEach>
							  					
					  						</c:if>
											<c:if test="${logined == null or flag == false}">
	  											<button class="btn btn-success ride-btn" onclick="ridePayment()">탑승신청</button>
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
											</c:if>
					  					</div>
					  				</div>
					  				<hr>
					  				<!-- 이용객 정보 -->
								  	<div class="row">
								  		<div class="col-12">
								  			<c:choose>
								  				<c:when test='${fn:length(pList) != 0 }'>
								  					<c:forEach items='${pList }' var='p' varStatus="count">
									  					<c:if test='${pList[count.index-1].PSTATUS eq "Y" }'>
									  						<span class="card pas-span">
									  							<%-- <img src="${path }/resources/images/${p.PROFILEIMAGERE}" class="pas-img"><br> --%>
									  							<img src="${path }/resources/images/ilhoon.jpg" class="pas-img"><br>
									  							<span class="text-center pas-name">${p.MEMBERNAME }</span>
								  							</span>
							  							</c:if>
								  					</c:forEach>
								  				</c:when>
								  				<c:otherwise>
								  					<div class="text-center">
								  						<p><b>이용중인 탑승객이 없습니다.</b></p>
								  					</div>
								  				</c:otherwise>
								  			</c:choose>
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
		<!-- 왼쪽바 : 드라이버 정보창 -->
		<div class="col-12 col-md-3">
			<div class="card bg-light mb-3">
			  <div class="card-header">
				 <div class="row">
				 	<div class="col-12 col-xl-6">
				 		<p class='dhead-p'>드라이버 정보</p>
				 	</div>
				 	<div class='col-12 col-xl-5 offset-xl-1'>
				 		<button class="btn btn-success search-div btn-chat" onclick="moveChatting('${driverId}')">드라이버와 채팅</button>
				 	</div>
				 </div> 
			  </div>
			  <div class="card-body">
			     <div class="row">
				  	<div class="col-12">
					  	<div class="card text">
					  		<span class="badge badge-secondary">드라이버 선택 옵션 </span>
					  		<c:forEach items="${oList}" var="c">
					  			<span class="span-option">
						  			<c:if test='${c.ANIMAL eq "Y"}'>
						  				<span><img src="${path }/resources/images/option-icon/animal.png" class="option-icon" title="애완견 동반 가능"></span>
						  			</c:if>
				  					<c:if test='${c.SMOKING eq "Y"}'>
				  						<span><img src="${path }/resources/images/option-icon/smoking.png" class="option-icon" title="흡연 가능"></span>
									</c:if>
									<c:if test='${c.TEENAGE eq "Y"}'>
										<span><img src="${path }/resources/images/option-icon/teenage.png" class="option-icon" title="미성년자 가능"></span>
									</c:if>
									<c:if test='${c.TALKING eq "Y"}'>
										<span><img src="${path }/resources/images/option-icon/talking.png" class="option-icon" title="대화 가능"></span>
									</c:if>
									<c:if test='${c.MUSIC eq "Y"}'>
										<span><img src="${path }/resources/images/option-icon/music.png" class="option-icon" title="음악 가능"></span>
									</c:if>
									<c:if test='${c.FOOD eq "Y"}'>
										<span><img src="${path }/resources/images/option-icon/food.png" class="option-icon" title="음식물 섭취 가능"></span>
									</c:if>
									<c:if test='${c.BAGGAGE eq "Y"}'>
										<span><img src="${path }/resources/images/option-icon/baggage.png" class="option-icon" title="짐 수용"></span>
									</c:if>
									<c:choose>
										<c:when test='${c.GENDER eq "A"}'>
										</c:when>
										<c:when test='${c.GENDER eq "F"}'>
											<span><img src="${path }/resources/images/option-icon/genderF.png" class="option-icon" title="여성 전용"></span>
										</c:when>
										<c:when test='${ c.GENDER eq "M"}'>
											<span><img src="${path }/resources/images/option-icon/genderM.png" class="option-icon" title="남성 전용"></span>
										</c:when>
									</c:choose>
						  		</span>
							</c:forEach>
						</div>
				  	</div>
				  </div>
				  <!-- 채팅창 연결 버튼 -->
				  <div class="row">
				  	<div class="col-6 offset-4">
				  		
				  	</div>
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
				  			<c:forEach items="${cList }" var="c" varStatus="count">
				  				<div class='row'>
					  				<div class='col-12'>
					  					<img src="${path }/resources/images/${c.CARIMAGERE}" class="img-fluid car-img "/>
						  			</div>
		  						</div>
				  			</c:forEach>
				  		</div>
				  	</div>
				  </div>
				  <div class="row">
				  	<div class="col-12">
				  		<div class="card re-div">
				  			<span class="badge badge-secondary">리뷰</span>
				  			<c:choose>
					  			<c:when test="${fn:length(rList) !=0}">
						  			<div class="row">
						  				<c:forEach items="${rList }" var="r" varStatus="count">
						  					<c:if test="${count.index <2}">
								  				<div class="col-4 col-sm-4 col-md-12 col-lg-4">
								  					<%-- <img src="${path }/resources/images/${r.PROFILEIMAGERE}" class="re-img"/> --%>
								  					<img src="${path }/resources/images/ilhoon2.jpg" class="re-img"/>
								  				</div>
								  				<div class="col-8 col-sm-8 col-md-12 col-lg-8 re-size">
								  					<div class="star-div">
								  						<fmt:parseNumber value="${r.RGRADE}" type="number" var="rg"/>
								  						<c:choose>
								  							<c:when test="${rg >=0 && rg <= 0.5 }">
								  								<span class="star-rating">
										  							<span style="width:7.6%"></span>
										  						</span>
								  							</c:when>
								  							<c:when test="${rg >0.5 && rg <= 1 }">
								  								<span class="star-rating">
										  							<span style="width:15.2%"></span>
										  						</span>
								  							</c:when>
								  							<c:when test="${rg >1 && rg <= 1.5 }">
								  								<span class="star-rating">
										  							<span style="width:22.8%"> </span>
										  						</span>
								  							</c:when>
								  							<c:when test="${rg >1.5 && rg <= 2 }">
								  								<span class="star-rating">
										  							<span style="width:30.4%"></span>
										  						</span>
								  							</c:when>
								  							<c:when test="${rg >2 && rg <= 2.5 }">
								  								<span class="star-rating">
										  							<span style="width:38%"></span>
										  						</span>
								  							</c:when>
								  							<c:when test="${rg >2.5 && rg <=3.0 }">
								  								<span class="star-rating">
										  							<span style="width:45.6%"></span>
										  						</span>
								  							</c:when>
								  							<c:when test="${rg >3.0 && rg <= 3.5 }">
								  								<span class="star-rating">
										  							<span style="width:53.2%"></span>
										  						</span>
								  							</c:when>
								  							<c:when test="${rg >3.5 && rg <= 4.0 }">
								  								<span class="star-rating">
										  							<span style="width:60.8%"></span>
										  						</span>
								  							</c:when>
								  							<c:when test="${rg >4.0 && rg <= 4.5 }">
								  								<span class="star-rating">
										  							<span style="width:68.4%"></span>
										  						</span>
								  							</c:when>
								  							<c:when test="${rg >4.5 && rg <= 5.0 }">
								  								<span class="star-rating">
										  							<span style="width:76%;"></span>
										  						</span>
								  							</c:when>
								  						</c:choose>
								  					</div>
								  					<div class="text-center rcontent-div">
								  						${r.RCONTENT }
							  						</div>
								  				</div>
							  				</c:if>
						  				</c:forEach>
						  			</div>
					  			</c:when>
					  			<c:otherwise>
					  				<div class="row">
						  				<div class="col-12">
						  					<div class="text-center">
						  						<p><b>등록된 리뷰가 없습니다.</b></p>
						  					</div>
						  				</div>
						  			</div>
					  			</c:otherwise>
				  			</c:choose>
				  		</div>
				  	</div>
				  </div>
				   <!-- 드라이버 신고 버튼 -->
				  <div class="row">
				  	<div class="col-6 offset-4">
				  		<button class="btn btn-danger search-div btn-chat">드라이버 신고하기</button>
				  	</div>
				  </div>
			  </div>
			</div>
		</div>
		<div class="col-12 col-md-2">
		</div>
	</div>

</section>

<!-- 채팅방 -->
<script>

   function moveChatting(chatUser)
   {
	   console.log(chatUser);
       location.href="${path}/community/createRoomClick.do?chatUser="+chatUser;
   }
</script>
<script>
var introFlag=true;
	//더보기
	$('.plus-content').on('click',function(){
		var length=65;
		var textL = $('.intro-p').text().trim().length;
		if(introFlag){
			$('div.plus-content>i').removeClass('fa-angle-down');
			$('div.plus-content>i').addClass('fa-angle-up');
			introFlag=false;
			$('.intro-p').text($('#intro').val());
		}
		else{
			$('div.plus-content>i').removeClass('fa-angle-up');
			$('div.plus-content>i').addClass('fa-angle-down');
			introFlag=true;
			if(textL>length){
				$('.intro-p').text($('.intro-p').text().trim().substr(0,length)+'...');
			}
		}
	});
	//인트로 
	$('.intro-p').each(function(){
		var length=65;
		$(this).each(function(){
			if($(this).text().trim().length >= length){
				$(this).text($(this).text().trim().substr(0,length)+'...');
			}
		});
	}); 
	//리뷰 콘텐츠
	$('.rcontent-div').each(function(){
		var length=20;
		$(this).each(function(){
			if($(this).text().trim().length >= length){
				$(this).text($(this).text().trim().substr(0,length)+'...');
			}
		});
	});
</script>

<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=8ea84df6-f96e-4f9a-9429-44cee22ab70f"></script>
<!-- 지도 로딩 -->
<script>
	var startLat = $('#startLat').val();
	var startLong = $('#startLong').val();
	var endLat = $('#endLat').val();
	var endLong = $('#endLong').val();
	var map, routeSearchLayer, styleMap, point_vector_layer;
	//페이지가 로딩이 된 후 호출하는 함수입니다.
	function initTmap(){
		//map 생성
		//Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
		$("#map_div").empty();
		
		map = new Tmap.Map({div:'map_div'});
		
		$("#map_div").css("width", "100%");
		
         markerLayer = new Tmap.Layer.Markers();
     	map.addLayer(markerLayer);
         
         setMarker(startLong, startLat);
		 setMarker(endLong, endLat);
		apiRequest();
	}
	//데이터 로드가 성공적으로 완료되었을 때 발생하는 이벤트 함수 입니다. 
	var count = 0;
	function setMarker(lon, lat){
		var size = new Tmap.Size(24,38);
		var offset = new Tmap.Pixel(-(size.w/2), -(size.h));
		
		//출발지와 목적지 마커 분류
		if(count === 0){
			var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png',size, offset);		
		}else if(count === 1){
			var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png',size, offset);
		}
		
		count++;
		
		var lonlat = new Tmap.LonLat(lon, lat);
		
		var m = new Tmap.Marker(lonlat.transform("EPSG:4326", "EPSG:3857"), icon);
		
		markerLayer.addMarker(m);
	}
		function apiRequest(){
		var prtcl;
		var headers = {};
		headers["appKey"] = "8ea84df6-f96e-4f9a-9429-44cee22ab70f";
			
		$.ajax({
			method: "POST",
			headers : headers,
			url : "https://api2.sktelecom.com/tmap/routes?version=1&format=xml",
			async: false,
			data:{
				startX: startLong,
				startY: startLat,
				endX: endLong,
				endY: endLat,
				reqCoordType : "WGS84GEO",
				resCoordType : "EPSG3857",
				angle: "172",
				searchOption: "0",
				trafficInfo : "N"
			}, success:function(response){
				prtcl = response;
				
				var xmlDoc = $.parseXML(new XMLSerializer().serializeToString(prtcl));
				$xml = $(xmlDoc);
				$xmlData = $xml.find("Document");
							
				routeLayer = new Tmap.Layer.Vector("route");
				
				var prtclLine = new Tmap.Format.KML({extractStyles:true, extractAttributes:true}).read(prtcl);
			
				routeLayer.events.register("beforefeatureadded", routeLayer, onBeforeFeatureAdded);
				function onBeforeFeatureAdded(e){
					var style={};
					
					switch (e.feature.attributes.styleUrl) {
		        	case "#pointStyle":
			        	style.externalGraphic = "http://topopen.tmap.co.kr/imgs/point.png"; //렌더링 포인트에 사용될 외부 이미지 파일의 url입니다.
						style.graphicHeight = 16; //외부 이미지 파일의 크기 설정을 위한 픽셀 높이입니다.
						style.graphicOpacity = 1; //외부 이미지 파일의 투명도 (0-1)입니다.
						style.graphicWidth = 16; //외부 이미지 파일의 크기 설정을 위한 픽셀 폭입니다.
		        	break;
		        	default:
						style.strokeColor = "#ff0000";//stroke에 적용될 16진수 color
						style.strokeOpacity = "1";//stroke의 투명도(0~1)
						style.strokeWidth = "5";//stroke의 넓이(pixel 단위)
		        	};
				
					e.feature.style = style;
				};
				
				routeLayer.addFeatures(prtclLine);			
				
				map.addLayer(routeLayer);
				
				map.zoomToExtent(routeLayer.getDataExtent());
				
			}, error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	// 맵 생성 실행
	initTmap();
</script>
<script>
//탑승중 / 탑승승인중
function checkIng(){
	if(!confirm('탑승 확인을 위해 마이페이지로 이동하시겠습니까?')){
		return;
	}
	else{
		location.href="${path}/member/myInfo.do";
	}
}
function checkSubmit(){
	if(!confirm('탑승 상태 확인을 위해 마이페이지로 이동하시겠습니까?')){
		return;
	}
	else{
		location.href="${path}/member/myInfo.do";
	}
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>