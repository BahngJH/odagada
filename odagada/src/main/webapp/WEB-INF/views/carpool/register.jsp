<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<section class="container-fluid">
	<div class="row">
		<div class="col-12 col-sm-6">
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
		<div class="col-12 col-sm-6">
			<div id="map" style="width:100%;height:400px;"></div>
		</div>
	</div>
</section>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=vc3JlDx8OrM42I7Dhas4"></script>
<script>
var mapOptions = {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
};

var map = new naver.maps.Map('map', mapOptions);
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>