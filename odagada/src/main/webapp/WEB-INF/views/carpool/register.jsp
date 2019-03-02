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
</style>

<section class="container">
	<div class="row">
		<div class="col-12 col-md-6">
			<form action="">
				<div class="row">
					<div class="col-12">
						<input type="text" class="form-control" name="startLocation" id="startLocation" placeholder="출발 위치" readonly/>
					</div>
					<!-- <img src="${path}/resources/images/icons/arrow-thick-bottom-6x.png" class="img-fluid mx-auto"></img> -->
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
				<div class="row div_date">
					<div class="col-12">
						<label for="startDate">출발 일시</label>
						<input type="datetime-local" class="form-control" name="startDate" id="startDate" />
					</div>
					<div class="col-12">
						<label for="endDate">도착 일시</label>
						<input type="datetime-local" class="form-control" name="endDate" id="endDate"/>
					</div>
				</div>
				<div class="row">
				
				</div>
			</form>
		</div>
		<div class="col-12 col-md-6">
			<div id="map" style="width:100%;height:400px;"></div>
		</div>
	</div>
</section>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=xh3uwmsrwb"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=xh3uwmsrwb&submodules=geocoder"></script>
<script>

var mapOptions = {
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
        	position: naver.maps.Position.LEFT_TOP
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
		count++;
		var point = e.coord;
		var path = polyline.getPath();
		path.push(point);
		searchCoordinateToAddress(point);
		
		markers.push(new naver.maps.Marker({
			map: map,
			position: point,
		})); 
		//polyline 초기화 후 다시 보이도록 설정
		polyline.setVisible(true);
	}else{
		alert("출발지와 목적지가 이미 설정되었습니다.");
	}
});

function searchCoordinateToAddress(latlng){
	var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);
	
	naver.maps.Service.reverseGeocode({
		location: latlng,
	}, function(status, response) {
		if(status === naver.maps.Service.Status.ERROR){
			return alert("네이버 주소 검색 에러");
		}
		
		var items = response.result.items;
		var addr;
		
		//도로명 주소가 있을 경우는 도로명 주소 사용
		if(items.length >= 2){
			addr = items[1].address;
		}else if(items.length === 1){
			addr = items[0].address;
		}
		
		//출발지
		if(count==1){
			$("#startLocation").val(addr);
		}else{
			//도착지
			$("#destLocation").val(addr);
		}
				
	});
};

// 지도 위에 현재 위치 버튼 생성
var locationBtnHtml = '<a href="#" class="btn_mylct"><i class="fas fa-map-marker-alt"></i></a>';

var customControl = new naver.maps.CustomControl(locationBtnHtml, {
	position: naver.maps.Position.TOP_RIGHT
});

customControl.setMap(map);

var domEventListener = naver.maps.Event.addDOMListener(customControl.getElement(), 'click', function(){
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
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>