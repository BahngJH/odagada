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
	form div.row > div{
		padding: 0px;
	}
	div.row.gender{
		margin: 0px;
	}
	div.options > label{
		padding-right: 3px;
		border-right: #d0cdcd solid 1px ;
	}
</style>

<section class="container">
	<div class="row schedule">
		<div class="col-12 col-md-6">
				<div class="row">
					<div class="col-12">
						<input type="text" class="form-control" name="startLocation" id="startLocation" placeholder="출발 위치" readonly/>
					</div>
					<div class="col-1 offset-5">
						<span class="fas fa-arrow-down fa-3x"></span>
					</div>
					<div class="col-3 ml-auto">
						<button type="button" class="btn btn-outline-info btn_clear" onclick="clearLoc();">초기화</button>
					</div>
					<div class="col-12">
						<input type="text" class="form-control" name="destLocation" id="destLocation" placeholder="도착 위치" readonly/>
					</div>
				</div>
			<form action="${path }/carpool/registerEnd" method="post" onsubmit="return carpoolValidate();">
				<div class="row div_date">
					<div class="col-12">
						<label for="startDate">출발 일시</label>
						<input type="datetime-local" class="form-control" name="startDate" id="startDate" />
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
						<div class="row gender">
							<div class="col-6 col-sm-3">
								성별<select name="gender" id="gender" class="form-control">
										<option value="A">무관</option>
										<option value="F">여</option>
										<option value="M">남</option>
									</select>
							</div>
						<div class="col-6 col-sm-3">
							좌석수 <input type="number" class="form-control" name="seatcount" id="seatcount" min="1" max="11"/>
						</div>
						</div>
								
					</div>
				</div>
				<div class="row btn_submit">
					<input type="submit" value="일정 등록" class="btn btn-outline-success"/>
				</div>
				<input type="text" class="form-control" name="startLong" id="startLong" readonly hidden/>
				<input type="text" class="form-control" name="startLat" id="startLat" readonly hidden/>
				<input type="text" class="form-control" name="destLong" id="destLong" readonly hidden/>
				<input type="text" class="form-control" name="destLat" id="destLat" readonly hidden/>
				<input type="text" class="form-control" name="startCity" id="startCity" readonly hidden/>
				<input type="text" class="form-control" name="endCity" id="endCity" readonly hidden/>
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
		</div>
	</div>
</section>

<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=8ea84df6-f96e-4f9a-9429-44cee22ab70f"></script>
<script>

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
	return true;
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
			console.log(prtcl);
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


function clearLoc(){
	$("#startLocation").val("");
	$("#destLocation").val("");
		
	markerLayer.clearMarkers();
	markers = [];
	routeLayer.removeAllFeatures();
	points = [];
	
};

/* var mapOptions = {
		zoomControl: true,
		zoomControlOptions:{
			style: naver.maps.ZoomControlStyle.SMALL,
			position: naver.maps.Position.RIGHT_BOTTOM
		},
		scaleControl: true,
        scaleControlOptions: {
            position: naver.maps.Position.BOTTOM_LEFT
        },
        logoControl: true,
        logoControlOptions: {
        	position: naver.maps.Position.BOTTOM_RIGHT
        },
       	mapDataControl: false
};

var map = new naver.maps.Map('map', mapOptions);
var markers = [];

var count = 0;

//현재 위치 가져오기
getLocation();

function getLocation(){
	if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(setPosition, function(){
			alert("현재 위치를 불러올 수 없습니다.");
		});
	}
}

//가져온 현재 위치로 네이버 지도에 위치 설정
function setPosition(position){	
	var cPosition = new naver.maps.LatLng(position.coords.latitude, position.coords.longitude);
	map.setCenter(cPosition);
	map.setZoom(10);
}

// 네이버 지도 폴리라인 설정
var polyline = new naver.maps.Polyline({
	map: map,
	path: [],
	strokeColor: '#00AF4C',
	strokeWeight: 4
});

naver.maps.Event.addListener(map, 'click', function(e){
	if(count < 2){
		var point = e.coord;
		
		//주소 검색 호출
		searchCoordinateToAddress(point);
		
	}else{
		alert("출발지와 목적지가 이미 설정되었습니다.");
	}
});

//좌표로 주소 검색
function searchCoordinateToAddress(latlng){
	
	naver.maps.Service.reverseGeocode({
		location: latlng,
	}, function(status, response) {
		if(status === naver.maps.Service.Status.ERROR){
			return alert("네이버 주소 검색 에러");
		}
		
		setInput(response, latlng);
		
		//해당 좌표에 핀 설정
		setPin(latlng);
	});
};

function setInput(response, latlng){
	var items = response.result.items;
	var addr;
	var addrDetail; 
	
	
	//도로명 주소가 있을 경우는 도로명 주소 사용
	if(items.length >= 2){
		addr = items[1].address;
		addrDetail = items[1].addrdetail.sidogun;
	}else if(items.length === 1){
		addr = items[0].address;
		addrDetail = items[0].addrdetail.sidogun;
	}
	
	//출발지
	if(count==0){
		$("#startCity").val(addrDetail);
		$("#startLocation").val(addr);
		$("#startLong").val(latlng._lat);
		$("#startLat").val(latlng._lng);
	}else{
		//도착지
		$("#endCity").val(addrDetail);
		$("#destLocation").val(addr);
		$("#destLong").val(latlng._lat);
		$("#destLat").val(latlng._lng);
	}
}

//지도에 핀 설정
function setPin(point){
	count++;
	var path = polyline.getPath();
	path.push(point);

	//커스텀 마커
	markers.push(new naver.maps.Marker({
		map: map,
		position: point,
		icon:{
			content: [
						'<div class="cs_mapbridge">',
							'<div class="map_group _map_group">',
								'<div class="map_marker _marker">',
									'<span class="fas fa-map-marker-alt fa-3x pin"></span>',
								'</div>',
							'</div>',
						'</div>'
			].join(''),
			size: new naver.maps.Size(38, 58),
			anchor: new naver.maps.Point(18, 48),
		}
	})); 
	//polyline 초기화 후 다시 보이도록 설정
	polyline.setVisible(true);
}



// 지도 위에 현재 위치 버튼 생성
var locationBtnHtml = '<a href="#" class="btn_mylct"><i class="fas fa-map-marked"></i></a>';

var customLocationControl = new naver.maps.CustomControl(locationBtnHtml, {
	position: naver.maps.Position.TOP_RIGHT
});

customLocationControl.setMap(map);

var domEventListener = naver.maps.Event.addDOMListener(customLocationControl.getElement(), 'click', function(){
	getLocation();
});

// 위치 설정 초기화
function clearLoc(){
	$("#startLocation").val("");
	$("#destLocation").val("");
	
	count = 0;
	
	markers.forEach(function(item){
		item.setMap(null);
	});
	
	polyline.setPath([]);
	// path는 초기화 됐지만 다음 마커를 꼽기 전까지 선이 그어져 있기 때문에 안보이게 처리함
	polyline.setVisible(false);
	
	
};

// 주소 검색창
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
	naver.maps.Service.geocode({
		address: address
	}, function(status, response){
		if(status === naver.maps.Service.Status.ERROR){
			return alert("주소 검색 실패, 주소를 확인해주세요.");
		}
		
		var item = response.result.items[0];
		var point = new naver.maps.Point(item.point.x, item.point.y);
		map.setCenter(point);
		map.setZoom(10);
	});
}; */

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>