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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%
	int seat = (int)request.getAttribute("seat");
	List pList = (List)request.getAttribute("pList"); 
	int stop=0;
%>
<style>
   @media all and (max-width: 550px){
      .start-p{
         font-size:10px;
      }
      .t-img{
         width:100px;
         height:100px;
         padding:8%;
         border-right:1px solid rgb(230,230,230);
      }
   }
   @media(min-width:550px){
     .start-p{
        font-size:14px;
     }
     .t-img{
        width:150px;height:150px;padding:10%;border-right:1px solid rgb(230,230,230);
     }
   }
	input.search-div{
		margin:13px;
		font-family: 'netmarbleB';
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
		margin:12px;
	}
	button.btn-chat{
		font-size: 13px;
		margin-top:10px;
		margin-bottom: 10px;
		font-family: 'BMJUA';
	}
img.driver-img{
      position: relative;
      width: 110px;
      height: 100px;
      margin: 20px 0;
      border-radius: 50% / 10%;
      color: white;
      text-align: center;
      text-indent: .1em;
    }
img.driver-img:before {
      content: '';
      position: absolute;
      top: 10%;
      bottom: 10%;
      right: -5%;
      left: -5%;
      background: inherit;
      border-radius: 5% / 50%;
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
		/* margin-top:40px; */
	}
	img.seat-img{
		width:60px;height:60px;
		margin:8px;
	}
	div.seat-div{
		margin-top:12px;
	}
	p.dhead-p{
		margin-top:10px;
	}
	div.dr-div{
		margin-top:12px;
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
		max-width:70px;height:70px;
		border-radius: 100px;
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
		padding-left:5px;
		padding-right:5px;
	}
	span.pas-span:hover{
		background-color: rgb(240,240,240);
	}
	span.pas-name{
		margin-top:-30px;
	}
	div#pas-toggle{
		display:none;
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
	div.speak-div{
      width: auto;
      height: auto;
      background: #FFFFC2;
      position: relative;
      -moz-border-radius: 10px;
      -webkit-border-radius: 10px;
      border-radius: 10px;
    }
	button.reAll-btn{
		margin-top:15px;
		margin-bottom:10px;
		border:0px;
	}
	.modal-dialog{
		max-width:700px;
	}
	.modal-footer{
		border-top:0px;
	}
	p.pas-p{
		padding-left:18px;
		font-size:15px;
	}
	span.start-p{
		color: rgb(0,175,76);
	}
	button.chat-btn{
		max-width:80px;
		padding:0px;
		font-size:12px;
		margin-top:50px;
	}
	.card{
	font-family: 'S-CoreDream-3Light'; 
	}
	.card-header{
	font-family: 'BMJUA';
	}
	.back-btn{
		margin-top:12px;
		margin-left:8px;
	}
</style>
<section class="container">
	<div class="row">
		<div class="col-12 offset-md-1 col-md-9 ">
			<div class="input-group">
				<input class="form-control search-div" type="text" placeholder="출발지" value="${search.startCity }" readonly>
				<span class="fas fa-arrow-right fa-2x icon-right"></span>
				<input class="form-control search-div" type="text" placeholder="도착지" value="${search.endCity }" readonly>
				<input type="text" class="form-control search-div" value="${search.startDate }" readonly>
				<button class='btn btn-success back-btn' style="padding-top:5px;"onclick='location.href="${path}/carpool/search.do"'>재검색</button>
				<button class='btn btn-success back-btn' style="padding-top:5px;"onclick='backBtn()'>목록으로</button>
			</div>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-12 col-md-8">
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
						  			<span> | ${o.STARTCITY } ${o.STARTDETAIL}</span>
						  		</div>
					  		</div><br>
					  		<div class="row">
						  		<div class="col-12">
						  			<span class="badge badge-pill badge-warning">도착</span>
						  			<span> | ${o.ENDCITY } ${o.ENDDETAIL}</span>
						  		</div>
					  		</div><br>
					  		<div class="row">
						  		<div class="col-6">
						  			<span class="badge badge-pill badge-warning">출발일</span>
						  			<span> | ${fn:substring(o.STARTDATE,0,10)}</span>
					  			</div>
					  			<div class="col-6">
						  			<span class="badge badge-pill badge-warning">출발 예정 시간</span>
						  			<span> | ${fn:substring(o.STARTDATE,11,20)}</span>
						  		</div>
					  		</div><br>
					  		<div class="row">
								<div class="col-12">
						  			<span class="badge badge-pill badge-warning">1인당 금액</span>
						  			<span> | ￦ ${o.PAY }</span>
						  		</div>
					  		</div>
					  		<input type="hidden" value="${o.CARPOOLNUM }" id="carpoolNum" name="carpoolNum">
						  	<hr>
						  	<!-- 드라이버 소개 -->
						  	<div class="text-center intro-driver" >
						  		<div class="row">
						  			<div class="col-12 col-md-3">
						  				<div class="row">
						  					<div class="col-12">
												<span>
								  					<%-- <img src="${path }/resources/images/${o.PROFILEIMAGERE}" class="driver-img"/> --%>
								  					<img src="${path }/resources/upload/profile/${o.PROFILEIMAGERE}" class="img-fluid driver-img"/>
								  				</span>
							  				</div>
						  				</div>
						  				<div class="row">
						  					<div class="col-12">
						  						<c:set var="driverId" value="${o.MEMBERID }"/>
						  						<c:set var="driverNum" value="${o.MEMBERNUM }"/>
						  						<span>${o.MEMBERNAME }</span>
					  						</div>
					  					</div>
						  			</div>
						  			<div class="col-12 offset-md-1 col-md-7 speak-div">
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
								<div id="map_div" style="width:600px; height:400px;"></div>
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
				  				<span> |  (${si}/${seat })</span>
					  		</div>
					  	</div>
					  	<div class="row">
					  		<div class="col-12">
					  			<div class="seat-div">
					  				<div class="row">
					  					<div class="col-9">
					  						<span>
										  		<c:forEach begin="1" end="${seat }"  varStatus="count">
										  			<c:choose>
										  				<c:when test='${pList[count.index-1].PSTATUS eq "Y" }'>
									  						<img src="${path }/resources/images/option-icon/full.png" class="seat-img"/>
								  						</c:when>
								  						<c:otherwise>
								  							<img src="${path }/resources/images/option-icon/empty.png" class="seat-img"/>
							  							</c:otherwise>
							  						</c:choose>
							  					</c:forEach>
						  					</span>
					  					</div>
					  					<div class="col-3 col-md-12 col-lg-3">
					  						<c:if test="${logined != null }">
					  							<c:set var="flag" value="false"/>
						  						<c:forEach items='${pList }' var='p' varStatus="count">
						  							<c:if test="${not flag }">
					  									<c:choose>
					  										<c:when test='${logined.memberNum == driverNum }'>
					  											<button class="btn btn-warning ride-btn" onclick="checkIng();">탑승객<br/>확인</button>
					  											<c:set var="flag" value="true"/>
					  										</c:when>
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
													/*
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
					  								*/
					  								
				  									var imp = window.IMP;
				  									imp.init('imp87992639');
				  									
				  									imp.request_pay({
				  										pg : 'inicis',
				  										amount : '${oList.get(0).PAY}',
				  										pay_method : 'card',
				  										merchant_uid : 'merchant_' + new Date().getTime(),
				  										name : '오다가다 카풀',
				  										buyer_email : '${logined.email}',
				  										buyer_name : '${logined.memberName}',
				  										buyer_tel : '${logined.phone}',
				  										m_redirect_url : '${path}/'
				  									}, function(rsp){
				  										if(rsp.success){
				  											$.ajax({
				  												url: "${path}/carpool/paymentEnd",
				  												data: {
				  													"carpoolNum": "${oList.get(0).CARPOOLNUM}",
			  														"memberNum": "${logined.memberNum}",
			  														"impUid":rsp.imp_uid,
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
				  										}else{
				  											console.log(rsp);
				  										}
				  									}) 
			  									};
					  						</script>
											</c:if>
					  					</div>
					  				</div>
					  				<hr>
					  				<div class="row">
						  				<div class="col-2">
						  					<span class="badge badge-pill badge-warning">탑승객 정보 보기</span>
						  				</div>
						  			</div>
					  				<!-- 이용객 정보 -->
								  	<div class="row">
								  		<div class="col-12">
								  			<c:choose>
								  				<c:when test='${fn:length(pList) != 0 }'>
								  					<c:forEach items='${pList }' var='p' varStatus="count">
									  					<c:if test='${pList[count.index].PSTATUS eq "Y" }'>
								  							<div class="row" id="pas-toggle${count.index }" style="padding:1%; border-bottom:1px solid rgb(230,230,230);">
									  							<div class="col-4 ">
										  							<div class="text-center " >
										  								<img src="${path }/resources/upload/profile/${p.PROFILEIMAGERE}" class='t-img'/>
										  							</div>
									  							</div>
									  							<div class="col-5" style="padding-top:5%;">
									  								<span class="start-p"><b>나이: </b></span><span class="start-p" style='color:rgb(50,50,50);'>${p.BIRTH }</span><br>
									  								<span class="start-p"><b>이름: </b></span><span class="start-p" style='color:rgb(50,50,50);'>${p.MEMBERNAME }</span><br>
									  								<span class="start-p"><b>나이: </b></span><span class="start-p" style='color:rgb(50,50,50);'>${p.BIRTH }</span><br>
									  								<span class="start-p"><b>성별: </b></span><span class="start-p" style='color:rgb(50,50,50);'>${p.GENDER }</span><br>
									  							</div>
									  							<div class="col=3">
									  								<button class="btn btn-success chat-btn" onclick="moveChatting('${p.MEMBERID}')">회원 채팅하기</button>
									  							</div>
								  							</div>
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
		<div class="col-12 col-md-4">
			<div class="card bg-light mb-3">
			  <div class="card-header">
				 <div class="row">
				 	<div class="col-12 col-xl-6">
				 		<p class='dhead-p'>드라이버 정보</p>
				 	</div>
				 	<c:if test="${logined.memberId != driverId && logined!=null}">
					 	<div class='col-12 col-xl-4 offset-xl-1'>
					 		<button class="btn btn-success search-div btn-chat" onclick="moveChatting('${oList.get(0).MEMBERID}')">드라이버와 채팅</button>
					 	</div>
				 	</c:if>
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
				  <div class="row">
				  	<div class="col-12">
				  		<div class="card dr-div">
				  			<span class="badge badge-secondary">드라이버 차량 </span>
				  			<div class="row">
				  				<div class="col-10">
				  					<span class="badge badge-pill badge-warning car-span">차종 </span> <span> |  ${oList[0].CARMODEL}</span>
				  				</div>
			  				</div>
			  				<div class="row">
				  				<div class="col-10">
				  					<span class="badge badge-pill badge-warning car-span">차량 번호  </span> <span> | ${oList[0].CARNUM}</span>
				  				</div>
			  				</div>
				  			<hr>
				  			<c:forEach items="${cList }" var="c" varStatus="count">
				  				<div class='row'>
					  				<div class='col-12'>
					  					<img src="${path }/resources/upload/car/${c.CARIMAGERE}" class="img-fluid car-img "/>
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
								  					<img src="${path }/resources/upload/profile/${r.PROFILEIMAGERE}" class="re-img"/>
								  					<p class="pas-p">${r.MEMBERNAME }</p>
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
										  							<span style="width:68.4%"></span>;
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
						  				<br>
					  					<div class="col-12 text-center">
					  						<button class="badge badge-light reAll-btn" data-toggle="modal" data-target="#review" >전체 리뷰</button>
					  					</div>
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
				<c:if test="${logined != null }">
				<c:set value='true' var='rFlag'/>
					<c:if test="${rFlag eq true }">
						<c:choose>
							<c:when test='${logined.memberNum == driverNum }'>
							  <div class="row">
							  	<div class="col-6 offset-3">
							  	</div>
							  </div>
							  <c:set value="false" var="rFlag"/>
							</c:when>
							<c:otherwise>
								<div class="row">
									<div class="col-6 offset-3">
										<button class="btn btn-danger search-div btn-chat" onclick="location.href='${path}/community/notifyForm.do?driverId=${oList.get(0).MEMBERID }&driverName=${oList.get(0).MEMBERNAME }'">드라이버 신고하기</button>
									</div>
								</div>
								<c:set value="false" var="rFlag"/>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:if>
			  </div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="review" tabindex="-1" role="dialog" aria-labelledby="reviewModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel"><b>드라이버 리뷰보기</b></h4>                    
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="ttMessage-div">
					<div class="row">
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-12">
							<!-- 여기부터 리뷰 전체보기 바디 -->
								<div class="card">
									<div class="card-header">
										<h5>${oList.get(0).MEMBERNAME}님의 리뷰</h5>
									</div>
									<div class="card-body">
										<c:choose>
								  			<c:when test="${fn:length(rList) !=0}">
									  				<c:forEach items="${rList }" var="r" varStatus="count">
									  					<div class="row">
											  				<div class="col-4 col-sm-4 col-md-12 col-lg-4 text-center">
											  					<img src="${path }/resources/upload/profile/${r.PROFILEIMAGERE}" class="re-img"/>
											  					<p>${r.MEMBERNAME }</p>
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
											  					<div class="text-center" style="margin-top:10px;background-color:rgb(248,248,248);border-radius:10px;">
											  						${r.RCONTENT }
										  						</div>
											  				</div>
										  				</div>
										  				<hr/>
									  				</c:forEach>
								  			</c:when>
							  			</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
</script>
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

function backBtn(){
	history.back(); 	
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>