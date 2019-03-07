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
	}
	h5.h5-icon{
		color:darkgray;
	}
	img.driver-profile{
		width:70px;
		height:70px;
		border-radius: 100px;
	}
	.col-text{
		color:black;
	}
	span.span_city{
		font-size:10px;
		color:black;
	}
</style>
<section id="container">
	<div class="row">
		<div class="col-12 col-md-2"></div>
		<div class="col-12 col-md-8">
			<div class="input-group">
				<input class="form-control search-div" type="text" placeholder="출발지" value="${startSearch }" readonly>
				<span class="fas fa-arrow-right fa-2x icon-right"></span>
				<input class="form-control search-div" type="text" placeholder="도착지" value="${endSearch }" readonly>
				<input class="form-control search-div" type="datetime-local" name="start-date" id="start-date">
				<input type="text" class="form-control search-div" value="${startDate }" readonly>
				<!-- <button class="btn btn-success search-div" id='btn-reset' onclick="search-reset()">초기화</button> -->
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
					<div class="card ">
						<div class="card-body">
	    					<h4 class="card-title">옵션(option)</h4>
	    					<hr>
	    					<div class="row">
								<div class="col-6" >
									<label>애완동물 <input type="checkbox" name="animal" id="animal" value="Y" /></label>
								</div>
								<div class="col-6" >
									<label>흡연 <input type="checkbox" name="smoking" id="smoking" value="Y"/></label>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label>미성년 <input type="checkbox" name="teenage" id="teenage" value="Y" /></label>
								</div>
								<div class="col-6">
									<label>대화 <input type="checkbox" name="talking" id="talking" value="Y" /></label>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label>노래 <input type="checkbox" name="music" id="music" value="Y" /></label>
								</div>
								<div class="col-6">
									<label>음식 섭취 <input type="checkbox" name="food" id="food" value="Y" /></label>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label>짐 수납 <input type="checkbox" name="baggage" id="baggage" value="Y" /></label>
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
									좌석수 <input type="number" class="form-control" name="seatcount" id="seatcount" min="1" max="11" placeholder="최소 1개"/>
								</div>
							</div>
						</div>
					</div>
				 </div>
			</div>
		</div>
		<!-- 검색 결과만큼 출력 -->
		<div class="col-12 col-md-5">
			<!-- 조건만큼 검색 결과 출력 -->
			<c:forEach items="${dList}" var="d" varStatus="n">
				<c:forEach items="${cList}" var="c">
					<form method="post" action="${path}/carpool/oneSearch.do?carpoolnum=1" id="form-onecar">
						<div id="div-pick" class="card border-success mb-3" onclick="onecar()">
						  <div class="card-body text-success">
						    <div class="row">
						    	<div class="col-6">
						    		<span class="badge badge-primary">출발시간</span> <span class="span_city">${c.STARTCITY}${c.STARTDETAIL }</span><br>
						    		<input type="hidden" name="driverStartLat" id="driverStartLat" value="${c.STARTLAT }"  />
						    		<input type="hidden" name="driverStartLon" id="driverStartLon" value="${c.STARTLON }"  />
						    		<input type="hidden" name="driverEndLat" id="driverEndLat" value="${c.STARTLAT }"  />
						    		<input type="hidden" name="driverEndLon" id="driverEndLon" value="${c.STARTLON }"  />
						    		<input type="hidden" name="searchStartLat" id="searchStartLat" value="${startLat }"/>
						    		<input type="hidden" name="searchStartLon" id="searchStartLon" value="${startLong }"/>
						    		<input type="hidden" name="searchEndLat" id="searchEndLat" value="${destLat }"/>
						    		<input type="hidden" name="searchEndLon" id="searchEndLon" value="${destLong }"/>
 						    		<h5 class="fas fa-arrow-down fa-2x h5-icon"></h5><br>
						    		<span class="badge badge-success">도착시간</span><span class="span_city">${c.ENDCITY}${c.ENDDETAIL }</span> <br>
					    		</div>
						    	<div class="col-6">
						    		<div class="row">
						    			<div class="col-12">
						    				<span class="span-option col-text">${c.PAY}</span>
						    			</div>
						    		</div>
						    		<div class="row">
						    			<div class="col-12">
						    				<span class="span-option">
						    					<img class="driver-profile" src="${path }/resources/images/ilhoon2.jpg"/>
						    					<%-- <p class="col-text">${d.MEMBERNUM }</p> --%>
						    				</span>
						    			</div>
						    		</div>
						    	</div>
						    </div>
						  </div>
						  <div class="row">
						  	<div class="col-12">
						  		<span class="span-option">설정옵션</span>
						  	</div>
						  </div>
						</div>
					</form>
				</c:forEach>
			</c:forEach>
		</div>
		<div class="col-12 col-md-2"></div>
	</div>
</section>
<script>
function validate(){
	return true;
}
function onecar(){
	$("#form-onecar").submit();
}

$(function(){
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>



<!-- 여기가 tmap시작  -->
<%-- <p id="result"></p>
<script>	
var map;
// 페이지가 로딩이 된 후 호출하는 함수입니다.
$(document).ready(function(){
	// 3. 직선거리 계산  API 사용요청
	<%for(int i=0;i<cList.size();i++){%>
		console.log(cList.get(i).getStartLong());
		$.ajax({
			method:"GET",
			url:"https://api2.sktelecom.com/tmap/routes/distance?version=1&format=xml",//직선거리 계산 api 요청 url입니다.
			async:false, 
			data:{
				//시작 지점 위경도 좌표입니다. //카풀정보
				"startX" : $('#driverStartLon').val(),
				"startY" : $('#driverStartLat').val(),
				//끝 지점 위경도 좌표입니다. //검색정보
				"endX" : $('#searchStartLon').val(),
				"endY" : $('#searchStartLat').val(),
				//입력하는 좌표계 유형을 지정합니다.
				"reqCoordType" : "WGS84GEO",
				//실행을 위한 키 입니다. 발급받으신 AppKey(서버키)를 입력하세요.
				"appKey" : "8ea84df6-f96e-4f9a-9429-44cee22ab70f"  

			},
			//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
			success:function(response){
				console.log(response);
				
				prtcl = response;
				
				var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
			    xmlDoc = $.parseXML( prtclString ),
			    $xml = $( xmlDoc ),
			    $intRate = $xml.find("distanceInfo");
				var distance = $intRate[0].getElementsByTagName("distance")[0].childNodes[0].nodeValue;
				$("#result").text("두점의 직선거리 : "+distance+"m");
			},
			//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
			error:function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	<%}%>
});
</script>
 --%>