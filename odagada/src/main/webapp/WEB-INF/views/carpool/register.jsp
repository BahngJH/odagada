<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<section class="container">
	<div class="row">
		<div class="col-12 col-md-6">
			<form action="">
				<div class="row">
					<label>출발 위치<input type="text" class="form-control" name="startLocation" /></label>
					<label>도착 위치<input type="text" class="form-control" name="destLoaction" /></label>
				</div>
				<div class="row">
					<label>출발 일시<input type="datetime-local" class="form-control" name="startDate"  /></label>
				</div>
				<div class="row">
					<label>도착 일시<input type="datetime-local" class="form-control" name="endDate" /></label>
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
<script>

var map = new naver.maps.Map('map');

//현재 위치 가져오기
getLocation();

function getLocation(){
	if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(setPosition);
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
	var point = e.coord;
	var path = polyline.getPath();
	path.push(point);
	
	new naver.maps.Marker({
		map: map,
		position: point,
	}); 
});


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>