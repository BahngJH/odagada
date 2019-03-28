<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@page import="java.util.*,com.spring.odagada.carpool.model.vo.Carpool"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<style>
	@font-face { font-family: 'silgothic'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/silgothic.woff') format('woff'); font-weight: normal; font-style: normal; }
	@font-face { font-family: 'BMJUA'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff'); font-weight: normal; font-style: normal; }	
	@font-face { font-family: 'netmarbleB'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.1/netmarbleB.woff') format('woff'); font-weight: normal; font-style: normal; }	
	input.search-div{
		margin:13px;
		font-family: 'netmarbleB';
	}
	input#start-date{
		display:none;
	}
	button#btn-reset{
	    height: 38px;
    	margin-top: 12px;	
	}
	span.icon-right{
		margin-top:15px;
	}
	span.span-option{
		float:right;
		margin:5px;
		
	}
	h5.h5-icon{
		color:darkgray;
	}
	img.driver-profile{
		width:70px;
		height:70px;
		border-radius: 100px;
		margin-top:10px;
	}
	.col-text{
		color:rgb(0,175,76);
	}
	span.span_city{
		font-size:16px;
		color:black;
		color:rgb(100,100,100);
	}
	button.start-search{
		float:right;
	}
	img.option-icon{
		width:30px; height:30px;
		float:right;
		margin:8px;
	}
	div.div-pick:hover{
		box-shadow: 4px 4px 15px rgb(190,190,190);
	}
	span.driver-name{
		color:black;
		text-size:14px;
		margin-left:25px;
	}
	div#div-pick{
		border:2px solid rgb(0,175,76);
	}
	div#finish-time{
		border:2px solid rgb(50,50,50);
	}
	/*  */
	#Progress_Loading
	{
	 text-align: center;
	 margin: 0 auto;
	}
	#Progress_Loading
	{
	 position: absolute;
	 left: 50%;
	 top: 50%;
	 background: #ffffff;
	}
	div#option_flex{
		z-index:1;
		background-color:white;
	}
	div#option_flex>div.card-body{
		padding-bottom:5px;
	}
	img.nosearch-img{
		width:90%;
		height:auto;
	}
	a{
	text-decoration: none;
	}
	a.info-a{
		text-decoration: none;
		color:rgb(100,100,100);
		font-size:15px;
		float:right;
		font-family: 'S-CoreDream-3Light';
	}
	.info-img{
	width:100%;
	height:100%;
	}
	.modal-dialog{
		max-width:780px;
	}
	section{
	font-family: 'S-CoreDream-3Light';
	}
	.start-span{
		font-family: netmarbleB;
	}
	.check-span{
		font-size: 13px;
		padding-bottom:5px;
	}
	.back-btn{
		margin-top:12px;
	}
</style>
<section class="container" >
<c:set value='0' var="listSize"/>
	<div class="row">
		 <div class="col-12">
		 	<a class="info-a" style="text-decoration: none;color: rgb(140,140,140); font-family: BMJUA;"href="" data-toggle="modal" data-target="#info">◎ 검색 방법 알아보기</a>
		 </div>
	</div>
	<div class="row">
		<div class="col-12 offset-md-1 col-md-9 ">
			<div class="input-group">
				<input class="form-control search-div" type="text" placeholder="출발지" value="${search.startCity }" id="startCity" name="startCity" readonly>
				<span class="fas fa-arrow-right fa-2x icon-right" style="color:rgb(200,200,200);"></span>
				<input class="form-control search-div" type="text" placeholder="도착지" value="${search.endCity }"  id="endCity" name="endCity" readonly>
				<input type="text" class="form-control search-div" id="startDate" value="${search.startDate }" readonly>
				<button class='btn btn-success back-btn' style="padding-top:5px;"onclick='backBtn();'>재검색</button>
			</div>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-12 col-md-4">
			<div class="row">
				<div class="col-12">
					<div class="card"  id="option_flex">
						<div class="card-body" style="position:relative;">
	    					<h4 class="card-title"><b>옵션(option)</b></h4>
	    					<hr>
	    					<div class="row">
	    						<div class="col-12">
	    							<span>출발지 반경: </span><br>
									<select name="kmNumS" id="kmNumS" class="form-control">
										<option value="3">3KM 이내 </option>
										<option value="5">5KM 이내 </option>
										<option value="10">10KM 이내</option>
									</select>
	    							<span>도착지 반경: </span><br>
									<select name="kmNumE" id="kmNumE" class="form-control">
										<option value="3">3KM 이내 </option>
										<option value="5">5KM 이내 </option>
										<option value="10">10KM 이내</option>
									</select>
	    							<hr>
	    							<input type="hidden" name="startLat" id="startLat" value="${search.startLat }"/>
	    							<input type="hidden" name="startLong" id="startLong" value="${search.startLong }"/>
	    							<input type="hidden" name="destLat" id="destLat" value="${search.destLat }"/>
	    							<input type="hidden" name="destLong" id="destLong" value="${search.destLong }"/>
	    						</div>
	    					</div>
	    					<div class="row">
	    						<div class="col-12">
	    							<span class="check-span"><i>(체크시 옵션에 포함되는 카풀만 검색)</i> </span>
	    						</div>
	    					</div>
	    					<div class="row">
								<div class="col-12 col-sm-6  col-md-12 col-lg-6" >
									<label>애완동물 <input type="checkbox" name="animal" id="animal" value="" /></label>
								</div>
								<div class="col-12 col-sm-6  col-md-12 col-lg-6" >
									<label>흡연 <input type="checkbox" name="smoking" id="smoking" value=""/></label>
								</div>
							</div>
							<div class="row">
								<div class="col-12 col-sm-6  col-md-12 col-lg-6">
									<label>미성년 <input type="checkbox" name="teenage" id="teenage" value="" /></label>
								</div>
								<div class="col-12 col-sm-6  col-md-12 col-lg-6">
									<label>대화 <input type="checkbox" name="talking" id="talking" value="" /></label>
								</div>
							</div>
							<div class="row">
								<div class="col-12 col-sm-6  col-md-12 col-lg-6">
									<label>노래 <input type="checkbox" name="music" id="music" value="" /></label>
								</div>
								<div class="col-12 col-sm-6  col-md-12 col-lg-6">
									<label>음식 섭취 <input type="checkbox" name="food" id="food" value="" /></label>
								</div>
							</div>
							<div class="row">
								<div class="col-12 col-sm-6  col-md-12 col-lg-6">
									<label>짐 수납 <input type="checkbox" name="baggage" id="baggage" value="" /></label>
								</div>
							</div>
							<div class="row">
								<div class="col-12 col-sm-6  col-md-12 col-lg-6">
									성별
									<select name="gender" id="gender" class="form-control">
										<option value="A">무관</option>
										<option value="F">여</option>
										<option value="M">남</option>
									</select>
								</div>
								<div class="col-12 col-sm-6 col-md-12 col-lg-6">
									좌석수 <input type="number" class="form-control" name="seatcount" id="seatcount" min="1" max="11" value="1" />
								</div>
							</div>
							<div class="row">
								<div class="col-12 start-search">
									<input type="button" value="검색" class="btn btn-success search-div start-search" id='btn-reset'/>
								</div>
							</div>
						</div>
					</div>
				 </div>
			</div>
		</div>
		<!-- 검색 결과만큼 출력 -->
		<div class="col-12 col-md-8">
			<p class="text-center" style="font-family: BMJUA;">[<i> 입력한 출발일과 가장 가까운 시일의 카풀내역이 검색됩니다. </i>]</p>
			<div  id="result-search" class="result-search">
				<div id = "Progress_Loading"><!-- 로딩바 -->
					<img src="${path }/resources/images/option-icon/Progress_Loading.gif"/>
				</div>
				<!-- 조건만큼 검색 결과 출력 -->
				<c:forEach items="${cList}" var="c">
					<c:if test="${c.BLACKID ==null}">
						<form method="post" action="${path}/carpool/oneSearch.do" class='form-onecar'>
							<div id="div-pick" class="card border-success mb-3 div-pick" >
							  <div class="card-body text-success click">
		  					  <input type="hidden" value="${c.CARPOOLNUM }" id="carpoolNum" name="carpoolNum"/>
							  <input type="hidden" value="${c.SEATCOUNT }" id="seat" name="seat"/>
							  <input type="hidden" value="${c.MEMBERNUM }" id="mem" name="mem"/>
					    		<div class="row">
							    	<div class="col-9">
								    	<div class="row">
					                       <div class="col-6">
					                        	<div class="mark-p"></div><span class="start-span"><b>출발일</b></span><br> <p class="start-span">&nbsp;&nbsp;&nbsp;&nbsp;${fn:substring(c.STARTDATE,0,10)}</p><hr>
					                       </div>
					                       <div class="col-6">
					                        	<div class="mark-p"></div><span class="start-span"><b>출발시간</b></span><br> <p class="start-span">&nbsp;&nbsp;&nbsp;&nbsp;${fn:substring(c.STARTDATE,11,20)}</p><hr>
					                       </div>
				                        </div>
							    		<span class="badge badge-primary">출발</span><br>
							    		<span class="span_city"><b>${c.STARTCITY} ${c.STARTDETAIL }</b></span><br>
							    		<h5 class="fas fa-arrow-down fa-2x h5-icon"></h5><br>
							    		<span class="badge badge-success">도착</span><br>
							    		<span class="span_city"><b>${c.ENDCITY} ${c.ENDDETAIL }</b></span> <br>
						    			<input type="hidden" name="startLat" id="startLat" value="${search.startLat }"/>
		    							<input type="hidden" name="startLong" id="startLong" value="${search.startLong }"/>
		    							<input type="hidden" name="destLat" id="destLat" value="${search.destLat }"/>
		    							<input type="hidden" name="destLong" id="destLong" value="${search.destLong }"/>
						    		</div>
							    	<div class="col-3">
							    		<div class="row">
							    			<div class="col-12">
							    				<span class="span-option col-text">￦${c.PAY}</span>
							    			</div>
							    		</div>
							    		<div class="row">
							    			<div class="col-12">
							    				<span class="span-option">
							    					<img class="driver-profile" src="${path }/resources/upload/profile/${c.PROFILEIMAGERE}"/><br>
							    					<span class="driver-name">${c.MEMBERNAME }</span>
							    				</span>
							    			</div>
							    		</div>
							    	</div>
							    </div>
							  </div>
							  <hr style="margin:0px;">
							  <div class="row">
							  	<div class="col-12">
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
							  	</div>
							  </div>
							</div>
						</form>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="modal fade" id="info" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel"><b>검색하기 이용법</b></h4>                    
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
								<div class="card">
									<div class="card-body">
										<img src="${path }/resources/images/guide-1.png" class="info-img"/>
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
	<div id="tt"></div>
</section>
<script>
$(document).ready(function(){
   $('#Progress_Loading').hide(); //첫 시작시 로딩바를 숨겨준다.
})
.ajaxStart(function(){
   $('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
})
.ajaxStop(function(){
   $('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
});
//무한스크롤
 $(document).ready(function() {
    // 스크롤 발생 이벤트 처리
    $(document).on("scroll",document,function() {
    	var frmLength = $('.div-pick').length;//반복문으로 생성된 div갯수
    	var numPerPage=5;//한 페이지당 보여줄 갯수
    	var cPage=Math.floor((frmLength)/numPerPage)*numPerPage;
    	var scrollMax = $(document).height() - $(window).height() - $(window).scrollTop();	
    	console.log("frmLength: "+frmLength+" : "+cPage);
    	console.log(scrollMax);
		// 스크롤바가 맨 아래에 위치할 때   
			if (scrollMax<=0.7) {
				if(frmLength%5==0&&frmLength>0){
				    console.log("이벤트1: "+cPage);
				    $.ajax({
						url:"${path}/carpool/searchOption",
						data:{"animal":$('#animal').is(":checked"),
							"smoking":$('#smoking').is(":checked"),
							"teenage":$('#teenage').is(":checked"),
							"talking":$('#talking').is(":checked"),
							"music":$('#music').is(":checked"),
							"gender":$('#gender').val(),
							"food":$('#food').is(":checked"),
							"baggage":$('#baggage').is(":checked"),
							"seatcount":$('#seatcount').val(),
							"kmNumS":$('#kmNumS').val(),
							"kmNumE":$('#kmNumE').val(),
							"startLat":$('#startLat').val(),
							"startLong":$('#startLong').val(),
							"destLat":$('#destLat').val(),
							"destLong":$('#destLong').val(),
							"startDate":$('#startDate').val(),
							"startCity":$('#startCity').val(),
							"endCity":$('#endCity').val(),
							"cPage":cPage
						},
						dataType:"html",
						success:function(data){
							$('#result-search').append(data);
							console.log("success 이벤트2: "+cPage);
						}
					});  
				}
		     } 
		});
 });
//옵션바 고정
$(function () {
    var currentPosition = parseInt($("#option_flex").css("top"));
    var currentPosition1 = parseInt($("#option_flex").css("bottom"));
    $(window).scroll(function () {
        var width = $(window).width();
        var doHeight =$(document).height();
        if (width >= 750) {
            var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다. 
            console.log(currentPosition1+" : "+currentPosition+" : "+position+ " : "+doHeight+" : "+(doHeight-750));
            if(position > 0){
            	if((doHeight-800)<position){
            		$("#option_flex").stop().animate({
		                "top": position + currentPosition - 300 + "px"
		            }, 500);
            	}else{
		            $("#option_flex").stop().animate({
		                "top": position + currentPosition - 100 + "px"
		            }, 500);
            	}
            }else{
            	$("#option_flex").stop().animate({
	                "top": position + currentPosition + "px"
	            }, 500);
            }
        }
    });
});
/* 카풀 한 개 선택 */
$(document).on('click','.form-onecar',function(){
   var carpoolNum=$(this).find('#carpoolNum').val();
   var seat=$(this).find('#seat').val();
   var mem=$(this).find('#mem').val();
   console.log(carpoolNum+" : "+seat+" : "+mem);
   document.getElementById("carpoolNum").value=carpoolNum;
   document.getElementById("seat").value=seat;
   document.getElementById("mem").value=mem;
   $(this).submit();
});
/* 검색버튼 */
$('#btn-reset').on("click",function(){
	$.ajax({
		url:"${path}/carpool/searchOption",
		data:{"animal":$('#animal').is(":checked"),
			"smoking":$('#smoking').is(":checked"),
			"teenage":$('#teenage').is(":checked"),
			"talking":$('#talking').is(":checked"),
			"music":$('#music').is(":checked"),
			"gender":$('#gender').val(),
			"food":$('#food').is(":checked"),
			"baggage":$('#baggage').is(":checked"),
			"seatcount":$('#seatcount').val(),
			"kmNumS":$('#kmNumS').val(),
			"kmNumE":$('#kmNumE').val(),
			"startLat":$('#startLat').val(),
			"startLong":$('#startLong').val(),
			"destLat":$('#destLat').val(),
			"destLong":$('#destLong').val(),
			"startDate":$('#startDate').val(),
			"startCity":$('#startCity').val(),
			"endCity":$('#endCity').val(),
			"cPage":0
		},
		dataType:"html",
		success:function(data){
			$("div#result-search").empty();
			$('#result-search').html(data);
		 	var offset = $('#communityDiv').offset();
		 	$(window).scrollTop("0");
		 	if($("#result-search").children()[0].id =="cPage"){
		 		$('#result-search').append("<img class='nosearch-img' src='${path}/resources/images/nosearch2.gif'/>");
				$('#result-search').append("<h3 style='text-align:center;'>검색 결과가 없습니다.</h3>"); 	
			};
		}
	});  
});
function backBtn(){
	history.back(); 	
}
/* 페이지 로딩과 동시에 검색버튼 클릭 */
function fclick(){
   $('#btn-reset').trigger("click");
};
fclick();

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>