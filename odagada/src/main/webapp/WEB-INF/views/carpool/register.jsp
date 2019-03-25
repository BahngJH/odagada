<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>

<!-- 제이쿼리 --> 	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
 
<style>
	a.btn_mylct{
		color: #00AF4C;
	}
	a.btn_mylct > i{
		font-size: 30px;
		padding-right: 5px;
		padding-top: 5px;
	}
	button.btn_clear{
		margin: 5px 0px;
	}
	div.div_date{
		margin-top:10px;
	}
	span.pin{
		color: #00AF4C;
	}
	div.btn_submit{
		margin-top: 10px;
		margin-left: 0px;
	}
	form div.row > div, div.loc>div{
		padding: 0px;
	}
	div.row.inputOpt{
		margin: 0px;
	}
	div.options > label{
		padding-right: 3px;
		border-right: #d0cdcd solid 1px ;
	}
	span#loc{
	    position: absolute;
	    z-index: 1000;
	    top: 40px;
	    text-align: right;
	    right: 5%;
	    color: rgb(0,175,76);
	}
	button.btn_clear{
		float:right;
	}
	input.btn_submit{
		float:right;
	}
</style>

<section class="container">
	<div class="row schedule">
		<div class="col-12 col-md-6">
				<div class="row loc">
					<div class="col-12">
						<input type="text" class="form-control" name="startLocation" id="startLocation" placeholder="출발 위치" readonly/>
					</div>
					<div class="col-1 offset-5">
						<span class="fas fa-arrow-down fa-3x"></span>
					</div>
					<div class="col-3 ml-auto">
						<button type="button" class="btn btn-outline-info btn_clear " onclick="clearLoc();">초기화</button>
					</div>
					<div class="col-12">
						<input type="text" class="form-control" name="destLocation" id="destLocation" placeholder="도착 위치" readonly/>
					</div>
				</div>
			<form action="${path }/carpool/registerEnd" method="post" onsubmit="return carpoolValidate();">
				<div class="row div_date">
					<div class="col-12">
						<div class="form-group">
			                <div class="input-group date div-search" id="datetimepicker1" data-target-input="nearest">
			                    <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" name="startDate" id="startDate" />
			                    <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
			                        <div class="input-group-text div-icon"><i class="fa fa-calendar"></i></div>
			                    </div>
			                </div>
			            </div>
					</div>
				</div>
				<div class="row div_option">
					<div class="col-12">
						<h4>탑승객 옵션 (체크시 허락)</h4>
					</div>
					<div class="col-12">
						<div class="col-12 options ml-auto">
							<label>애완동물 <input type="checkbox" name="animal" id="animal" value="Y" /></label>
							<label>흡연 <input type="checkbox" name="smoking" id="smoking" value="Y"/></label>
							<label>미성년 <input type="checkbox" name="teenage" id="teenage" value="Y" /></label>
							<label>대화 <input type="checkbox" name="talking" id="talking" value="Y" /></label>
							<label>노래 <input type="checkbox" name="music" id="music" value="Y" /></label>
							<label>음식 섭취 <input type="checkbox" name="food" id="food" value="Y" /></label>
							<label>짐 수납 <input type="checkbox" name="baggage" id="baggage" value="Y" /></label>
						</div>
						<div class="row inputOpt">
							<div class="col-6 col-sm-3 ml-auto">
								성별<select name="gender" id="gender" class="form-control">
										<option value="A">무관</option>
										<option value="F">여</option>
										<option value="M">남</option>
									</select>
							</div>
							<div class="col-6 col-sm-3 ml-auto">
								좌석수 <input type="number" class="form-control" name="seatcount" id="seatcount" min="1" max="11" placeHolder="최소 1개" required/>
							</div>
							<div class="col-6 col-sm-3 ml-auto">
								가격 <input type="number" placeholder="최소 단위 1000원" class="form-control" name="pay" id="pay" min="0" step="1000" max="1000000" required/>
							</div>
						</div>
								
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<p id="distance" class="routeInfo"></p>
						<p id="time" class="routeInfo"></p>
						<p id="fare" class="routeInfo"></p>
						<p id="taxi" class="routeInfo"></p>
					</div>
				</div>
				<div class="row btn_submit">
					<div class="col-12">
						<input type="submit" value="일정 등록" class="btn btn-outline-success btn_submit"/>
					</div>
				</div>
				<input type="number" class="form-control" name="startLong" id="startLong" readonly hidden/>
				<input type="number" class="form-control" name="startLat" id="startLat" readonly hidden/>
				<input type="number" class="form-control" name="destLong" id="destLong" readonly hidden/>
				<input type="number" class="form-control" name="destLat" id="destLat" readonly hidden/>
				<input type="text" class="form-control" name="startCity" id="startCity" readonly hidden/>
				<input type="text" class="form-control" name="endCity" id="endCity" readonly hidden/>
				<input type="text" class="form-control" name="startDetail" id="startDetail" readonly hidden/>
				<input type="text" class="form-control" name="endDetail" id="endDetail" readonly hidden/>
			</form>
		</div>
		
		<div class="col-12 col-md-6">
			<div class="input-group">
				<input type="text" class="form-control" id="addrSearch" placeholder="주소 검색"/>
				<span class="input-group-btn">
					<button class="btn btn-secondary" id="btn_addr" type="button" onclick="addrSearch();">검색</button>
				</span>
			</div>
			<div id="map" style="width:100%;height:400px;"></div>
			<span id="loc" class="fas fa-map-marker-alt fa-2x"></span>
		</div>
	</div>
</section>

<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=8ea84df6-f96e-4f9a-9429-44cee22ab70f"></script>
<script>

/* 날짜/시간 입력 달력 */
$(function () {	
	$.fn.datetimepicker.Constructor.Default = $.extend({}, $.fn.datetimepicker.Constructor.Default, {
		icons: {
            time: 'far fa-clock',
            date: 'far fa-calendar',
            up: 'fas fa-angle-up',
            down: 'fas fa-angle-down',
            previous: 'fas fa-angle-left',
            next: 'fas fa-angle-right',
            today: 'far fa-calendar-check-o',
            clear: 'far fa-trash',
            close: 'far fa-times'
        } });
	
		
    $('#datetimepicker1').datetimepicker(); 
	
});

// 클릭 이벤트 > 주소 가져오기 > 마커 생성 > 경로 생성

$().ready(function(){
	initTmap();
});

function carpoolValidate(){
	if($("#startLocation").val() === ""){
		alert("시작 위치를 지정해주세요.");
		return false;
	}
	if($("#destLocation").val() === ""){
		alert("도착 위치를 지정해주세요.");
		return false;
	}
	 
	if($("#startDate").val() === ""){
		alert("시작 날짜를 지정해주세요.");
		return false;
	}
	
	var exp = /^20\d{2}.(0[1-9]|1[012]).(0[1-9]|[12][0-9]|3[0-1]). 오[전|후] ([0-9]|1[0-2]):([0-5][0-9])$/; 
	
	if(!exp.test($("#startDate").val())){
		alert("날짜를 확인해주세요.");
		return false;
	}

	var nowDate = moment().format('YYYY.MM.DD. a hh:mm');
	
	if(($("#startDate").val() < nowDate)){
		alert("날짜를 확인해주세요.");
		return false;
	}
	
	return false;
};

var map;
var markers = [];
var markerLayer;
var points = [];
var routeLayer;

function initTmap(){	
	map = new Tmap.Map({
		div:'map',
	});
	
	getLocation();
	
	//클릭으로 마커 생성
	map.events.register('click', map, onClick);
	markerLayer = new Tmap.Layer.Markers();
	map.addLayer(markerLayer);
}

//지도 클릭시 이벤트 함수
function onClick(e){
	var lonlat = map.getLonLatFromViewPortPx(e.xy).transform("EPSG:3857", "EPSG:4326");
		
	//주소 가져오기
	reverseGeo(lonlat);
}

//현재 위치 가져오기

function getLocation(){
	if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(setPosition, function(){
			alert("현재 위치를 불러올 수 없습니다.");
		});
	}
}

//가져온 현재 위치로 지도에 위치 설정
function setPosition(position){	
	var cPosition = new Tmap.LonLat(position.coords.longitude, position.coords.latitude).transform("EPSG:4326", "EPSG:3857");
	map.setCenter(cPosition, 15);
}

//경로 탐색 API 요청
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
			startX: points[0].lon,
			startY: points[0].lat,
			endX: points[1].lon,
			endY: points[1].lat,
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
						
			var tDistance = "총 거리 : " + ($xmlData[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue/1000).toFixed(1)+"km";
			var tTime = " 총 시간 : "+($xmlData[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue/60).toFixed(0)+"분";	
			var tFare = " 총 요금 : "+$xmlData[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue+"원";	
			var taxiFare = " 예상 택시 요금 : "+$xmlData[0].getElementsByTagName("tmap:taxiFare")[0].childNodes[0].nodeValue+"원";	
			
			$("#distance").text(tDistance);
			$("#time").text(tTime);
			$("#fare").text(tFare);
			$("#taxi").text(taxiFare);
			
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

//좌표로 주소 가져오기
function reverseGeo(lonlat){
	$.ajax({
		methos: "GET",
		url: "https://api2.sktelecom.com/tmap/geo/reversegeocoding?version=1&format=json&callback=result",
		async:false,
		data:{
			"coordType": "WGS84GEO",
			"addressType": "A04",
			"lon": lonlat.lon,
			"lat": lonlat.lat,
			"appKey" : "8ea84df6-f96e-4f9a-9429-44cee22ab70f",
		},success:function(response){
			var arrResult = response.addressInfo;
			
			if(markers.length === 0){
				$("#startLocation").val(arrResult.fullAddress);
				$("#startCity").val(arrResult.city_do + " " + arrResult.gu_gun);
				$("#startDetail").val((arrResult.eup_myun != "" ? arrResult.eup_myun + " " : "") + arrResult.roadName + " " + arrResult.buildingIndex + " " + arrResult.buildingName);
				$("#startLong").val(lonlat.lon);
				$("#startLat").val(lonlat.lat);
			}else if(markers.length === 1){
				$("#destLocation").val(arrResult.fullAddress);
				$("#endCity").val(arrResult.city_do + " " + arrResult.gu_gun);
				$("#endDetail").val((arrResult.eup_myun != "" ? arrResult.eup_myun + " " : "") + arrResult.roadName + " " + arrResult.buildingIndex + " " + arrResult.buildingName);
				$("#destLong").val(lonlat.lon);
				$("#destLat").val(lonlat.lat);
			}
			
			setMarker(lonlat);
		}, error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			return alert("제공되지 않는 범위입니다.");
		}
	});
}

//마커 생성
function setMarker(lonlat){
	var size = new Tmap.Size(24,38);
	var offset = new Tmap.Pixel(-(size.w/2), -(size.h));
	
	//출발지와 목적지 마커 분류
	if(markers.length === 0){
		var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png',size, offset);		
	}else if(markers.length === 1){
		var icon = new Tmap.Icon('http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png',size, offset);
	}else{
		return alert("출발지와 목적지가 이미 설정되었습니다.");
	}
	
	points.push({lon: lonlat.lon, lat: lonlat.lat});
	
	var m = new Tmap.Marker(lonlat.transform("EPSG:4326", "EPSG:3857"), icon);
	
	markers.push(m);
	markerLayer.addMarker(m);
	
	
	if(markers.length === 2){
		apiRequest();
	}
}

// 마커, 경로 초기화
function clearLoc(){
	$("#startLocation").val("");
	$("#destLocation").val("");
		
	markerLayer.clearMarkers();
	markers = [];
	routeLayer.removeAllFeatures();
	points = [];
	$(".routeInfo").text("");
};

//주소 검색창
$("#addrSearch").on("keydown", function(e){
	var keyCode = e.which;
	if(keyCode === 13){
		searchAddressToCoordinate($("#addrSearch").val());
	}
});

function addrSearch(){
	searchAddressToCoordinate($("#addrSearch").val());
};

// 주소 검색 내용으로 지도 이동
function searchAddressToCoordinate(address){
	console.log(address);
	$.ajax({
		method:"GET",
		url:"https://api2.sktelecom.com/tmap/geo/fullAddrGeo?version=1&format=xml&callback=result",
		async:false,
		data:{
			"coordType" : "WGS84GEO",
			"fullAddr" : address,
			"page" : "1",
			"count" : "20",
			"appKey" : "8ea84df6-f96e-4f9a-9429-44cee22ab70f",
		}, success:function(response){
			
			var xmlData = $.parseXML(new XMLSerializer().serializeToString(response));
			var $coordinate = $(xmlData).find("coordinate");
			
			if($coordinate.length === 0){
				return alert("검색 결과가 없습니다.");
			}
			
			var lon, lat;
			
			if($coordinate[0].getElementsByTagName("lon").length>0){//구주소
				lon = $coordinate[0].getElementsByTagName("lon")[0].childNodes[0].nodeValue;
			   	lat = $coordinate[0].getElementsByTagName("lat")[0].childNodes[0].nodeValue;
			}else{//신주소
				lon = $coordinate[0].getElementsByTagName("newLon")[0].childNodes[0].nodeValue;
				lat = $coordinate[0].getElementsByTagName("newLat")[0].childNodes[0].nodeValue;
			}
			console.log(lon+":"+lat);
			var position = new Tmap.LonLat(lon, lat).transform("EPSG:4326", "EPSG:3857");
			map.setCenter(position, 15);
		}, error:function(request, status, error){
			alert("검색이 실패했습니다.");
		}
	});
};

$("#loc").click(function(){
	getLocation();
});

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>