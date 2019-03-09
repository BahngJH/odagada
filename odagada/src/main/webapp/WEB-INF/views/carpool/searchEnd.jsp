<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@page import="java.util.*,com.spring.odagada.carpool.model.vo.Carpool"%>
<%
	List<Carpool> cList = (List)request.getAttribute("cList");
	Carpool cp=new Carpool();
%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<style>
	input.search-div{
		margin:13px;
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
		color:black;
	}
	span.span_city{
		font-size:13px;
		color:black;
	}
	button.start-search{
		float:right;
	}
	img.option-icon{
		width:30px; height:30px;
		float:right;
		margin:4px;
	}
	form-onecar:hover{
		text-shadow: 1px 1px 2px rgb(1,1,1);
	}
	span.driver-name{
		color:black;
		text-size:14px;
		margin-left:25px;
	}
	div#div-pick{
		border:2px solid rgb(0,175,76);
	}
	div.finish-time{
		border:2px solid rgb(50,50,50);
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
				<input class="form-control search-div" type="datetime-local" name="start-date" id="start-date">
				<input type="text" class="form-control search-div" value="${search.startDate }" readonly>
			</div>
		</div>
		<div class="col-12 col-md-2"></div>
	</div>
	<hr>
	<div class="row">
		<div class="col-12 col-md-2"></div>
		<div class="col-12 col-md-3">
			<div class="row">
				<div class="col-12">
					<div class="card"  id="option_flex">
						<div class="card-body" >
	    					<h4 class="card-title">옵션(option)</h4>
	    					<hr>
	    					<div class="row">
	    						<div class="col-12">
	    							<span>시작 검색 반경: </span><br>
									<select name="kmNumS" id="kmNumS" class="form-control">
										<option value="3">3KM 이내 </option>
										<option value="5">5KM 이내 </option>
										<option value="10">10KM 이내</option>
									</select>
	    							<span>도착 검색 반경: </span><br>
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
								<div class="col-6" >
									<label>애완동물 <input type="checkbox" name="animal" id="animal" value="" /></label>
								</div>
								<div class="col-6" >
									<label>흡연 <input type="checkbox" name="smoking" id="smoking" value=""/></label>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label>미성년 <input type="checkbox" name="teenage" id="teenage" value="" /></label>
								</div>
								<div class="col-6">
									<label>대화 <input type="checkbox" name="talking" id="talking" value="" /></label>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label>노래 <input type="checkbox" name="music" id="music" value="" /></label>
								</div>
								<div class="col-6">
									<label>음식 섭취 <input type="checkbox" name="food" id="food" value="" /></label>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label>짐 수납 <input type="checkbox" name="baggage" id="baggage" value="" /></label>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									성별
									<select name="gender" id="gender" class="form-control">
										<option value="A">무관</option>
										<option value="F">여</option>
										<option value="M">남</option>
									</select>
								</div>
								<div class="col-6">
									좌석수 <input type="number" class="form-control" name="seatcount" id="seatcount" min="1" max="11" value="1" />
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<button class="btn btn-success search-div start-search" id='btn-reset'>검색</button>
								</div>
							</div>
						</div>
					</div>
				 </div>
			</div>
		</div>
		<!-- 검색 결과만큼 출력 -->
		<div class="col-12 col-md-5" id="result-search">
			<!-- 조건만큼 검색 결과 출력 -->
			<c:forEach items="${cList}" var="c">
				<c:choose>
					<c:when test='${c.startDate >= today}'>
						<form method="post" action="${path}/carpool/oneSearch.do?carpoolNum=${c.CARPOOLNUM}" id="form-onecar">
							<div id="div-pick" class="card border-success mb-3" onclick="onecar()">
							  <div class="card-body text-success">
							    <div class="row">
							    	<div class="col-6">
							    	 <span class="span_city">${c.STARTDATE }</span><br>
							    		<span class="badge badge-primary">출발</span><br>
							    		<span class="span_city">${c.STARTCITY}${c.STARTDETAIL }</span><br>
								    		<h5 class="fas fa-arrow-down fa-2x h5-icon"></h5><br>
							    		<span class="badge badge-success">도착</span><br>
							    		<span class="span_city">${c.ENDCITY}${c.ENDDETAIL }</span> <br>
						    		</div>
							    	<div class="col-6">
							    		<div class="row">
							    			<div class="col-12">
							    				<span class="span-option col-text">￦${c.PAY}</span>
							    			</div>
							    		</div>
							    		<div class="row">
							    			<div class="col-12">
							    				<span class="span-option">
							    					<img class="driver-profile" src="${path }/resources/images/ilhoon2.jpg"/><br>
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
							  	</div>
							  </div>
							</div>
						</form>
					</c:when>
					<c:otherwise>
						<div id="div-pick" class="card border-success mb-3 finish-time">
							  <div class="card-body text-success">
							    <div class="row">
							    	<div class="col-6">
							    	 <span class="span_city">${c.STARTDATE }</span><br>
							    		<span class="badge badge-primary">출발</span><br>
							    		<span class="span_city">${c.STARTCITY}${c.STARTDETAIL }</span><br>
								    		<h5 class="fas fa-arrow-down fa-2x h5-icon"></h5><br>
							    		<span class="badge badge-success">도착</span><br>
							    		<span class="span_city">${c.ENDCITY}${c.ENDDETAIL }</span> <br>
						    		</div>
							    	<div class="col-6">
							    		<div class="row">
							    			<div class="col-12">
							    				<span class="span-option col-text">￦${c.PAY}</span>
							    			</div>
							    		</div>
							    		<div class="row">
							    			<div class="col-12">
							    				<span class="span-option">
							    					<img class="driver-profile" src="${path }/resources/images/ilhoon2.jpg"/><br>
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
							  	</div>
							  </div>
							</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${empty cList }">
				<div class="row">
					<div class="col-12">
						<div>
							<h2>검색결과가 없습니다.</h2>
						</div>
					</div>
				</div>
			</c:if>
		</div>
		<div class="col-12 col-md-2"></div>
	</div>
</section>
<script>
//옵션바 고정
$(function () {
            var currentPosition = parseInt($("#option_flex").css("top"));
            $(window).scroll(function () {
                var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다. 
                
                $("#option_flex").stop().animate({
                    "top": position + currentPosition + "px"
                }, 500);
            });
});
function validate(){
	return true;
}
function onecar(){
	$("#form-onecar").submit();
};

 $(function(){ 
	
 	$('#btn-reset').on("click",function(){
 		 var animal = $('#animal').is(":checked");
 		 console.log(animal);
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
				"destLong":$('#destLong').val()
			},
			dataType:"html",
			success:function(data){
				$('#result-search').html(data);
			}
		});  
	})
	
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
