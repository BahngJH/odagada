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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>

<style>
	.div-search{
		margin:20px;
	}
	button.btn-search{
		width:100px;
		margin-left:45%;
	}
	input.road-btn{
		margin-top:20px;
	}
	div#date-div{
		margin-right:0px;
	}
	input#startDate{
		margin-right:0px;
	}
	div.empty-div{
		height:300px;
	}
	div.div-cal{
		margin-top:20px;
		margin-left:20px;
	}
	div.div-icon{
		margin-right:20px;
	}
</style>
<section class="container">
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">
			<form action="${path }/carpool/searchEnd.do" method="post" id="search-form" onsubmit="return validate()">
				<div class="row">
					<div class="col-12">
						<div class="input-group">
							<input type="text" class="form-control div-search" name="startSearch" id="startSearch" placeholder="출발지" readonly/>
							<input type="text" name="startLon" id="startLon" value="" hidden/>
							<input type="text" name="startLat" id="startLat" value="" hidden/>
							<input type="button" class="btn btn-outline-success road-btn" onclick="sample6_execDaumPostcode1()" value="출발지 검색"><br>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="input-group">
							<input type="text" class="form-control div-search" name="endSearch" id="endSearch" placeholder="도착지" readonly/>
							<input type="hidden" name="endLon" id="endLon" value=""/>
							<input type="hidden" name="endLat" id="endLat" value=""/>
							<input type="button" class="btn btn-outline-success road-btn" onclick="sample6_execDaumPostcode2()" value="도착지 검색"><br>
						</div>
					</div>
				</div>
				<div class="row">
			        <div class="col-sm-12">
			            <div class="form-group">
			                <div class="input-group date div-search" id="datetimepicker1" data-target-input="nearest">
			                    <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" name="startDate" id="startDate"/>
			                    <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
			                        <div class="input-group-text div-icon"><i class="fa fa-calendar"></i></div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
				<div class="row">
				 	<div class="col-sm-12">
						<div class="input-group-btn">
							<button class="btn btn-success div-search btn-search" type="button" id="btn_search" onclick="search();">검색</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-3">
			<div class="empty-div">
				
			</div>
		</div>
	</div>
	<!-- 공간검색으로 반경구하기  -->
<!-- 	<div class="row">
		<div class="col-12">
			<div style="height:400px; float:left; overflow-y:scroll; " id="searchResult" name="searchResult">검색결과</div>
				<div id="map_div" style="width:100%;height:400px;"></div>				
<script>	
// map 생성
// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.	
var map;
var markers = [];
var markerLayer;
var points = [];
var routeLayer;
map = new Tmap.Map({
	div : 'map_div', // map을 표시해줄 div
});
map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15);//설정한 좌표를 "EPSG:3857"로 좌표변환한 좌표값으로 중심점으로 설정합니다.


$.ajax({
		method:"GET",
		url:"https://api2.sktelecom.com/tmap/geofencing/regions?version=1&format=xml&callback=result",//조회하고자 하는 공간을 검색하며 해당 영역의 영역정보를 조회 할 수 있는 API 
		async:false,
		data:{
			"count" : "20",// 페이지당 조회된 공간검색 수
			"categories" : "legalDong",//검색하고자 하는 카테고리를 지정합니다. 
			"searchType" : "KEYWORD",//검색 타입을 지정합니다.
			"searchKeyword" : "종로3가",//검색 키워드 입니다. 
			"appKey" : "8ea84df6-f96e-4f9a-9429-44cee22ab70f",//실행을 위한 키 입니다. 발급받으신 AppKey(서버키)를 입력하세요.
		},
		//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
		success:function(response){
			prtcl = response;
			
			var innerHtml ="";
			var prtclString = new XMLSerializer().serializeToString(prtcl);
			xmlDoc = $.parseXML( prtclString ),
			$xml = $( xmlDoc ),
			$intRate = $xml.find("regionInfo");
			$intRate.each(function(index, element) {
		    	var description = element.getElementsByTagName("description")[0].childNodes[0].nodeValue;
		    	var regionId = element.getElementsByTagName("regionId")[0].childNodes[0].nodeValue;
		    	innerHtml+="<div>"+description+"<button type='button' name='sendBtn' onClick='geofencingRegions("+regionId+");'>상세보기</button><\div>";
		    });
			$("#searchResult").html(innerHtml);//결과를 html에 넣어 보여줍니다.
		},
		//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	

//벡터레이어를 생성합니다.
var vector_layer = new Tmap.Layer.Vector('Tmap Vector Layer');;
function geofencingRegions(regionId){
   	$.ajax({
		method:"GET",
		url:"https://api2.sktelecom.com/tmap/geofencing/regions/"+regionId+"?version=1&format=xml&callback=result",//조회하고자 하는 공간을 검색하며 해당 영역의 영역정보를 조회 할 수 있는 API입니다.
		async:false,
		data:{
			"resCoordType" : "EPSG3857",//받고자 하는 응답 좌표계 유형을 지정합니다
			"appKey" : "8ea84df6-f96e-4f9a-9429-44cee22ab70f",//실행을 위한 키 입니다. 발급받으신 AppKey(서버키)를 입력하세요.
		},
		//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
		success:function(response){
			prtcl = response;
			
		   	prtcl=new Tmap.Format.KML({extractStyles:true, extractAttributes:true}).read(prtcl);//데이터(prtcl)를 읽고, 벡터 도형(feature) 목록을 리턴합니다.
		   	
			vector_layer.removeAllFeatures();//기존에 클릭된 벡터 도형 제거 합니다.
			map.addLayers([vector_layer]); //맵에 레이어 추가
			vector_layer.addFeatures(prtcl);//레이어에 도형을 등록합니다.
			map.zoomToExtent(vector_layer.getDataExtent());	//map의 zoom을 routeLayer의 영역에 맞게 변경합니다.
		},
		//요청 실패시 콘솔창에서 에러 내용을 확인할 수 있습니다.
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	}
</script>
		</div>
	</div> -->
</section>

<!-- t-map 지도 key -->
<script src="https://api2.sktelecom.com/tmap/js?version=1&format=javascript&appKey=8ea84df6-f96e-4f9a-9429-44cee22ab70f"></script>
<script type="text/javascript">

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



function validate(){
	return true;
}

// form submit
var lon, lat;
function search(){
	if($("#startSearch").val()===""){
		alert("출발지를 설정해주세요.");
		return false;
	}
	if($("#endSearch").val()===""){
		alert("도착지를 설정해주세요.");
		return false;
	}	
	if($("#startDate").val()===""){
		alert("날짜를 설정해주세요.");
		return false;
	}
	// 검색된 주소의 lat,lon 값 넣기
	fullAddressSearch($("#startSearch").val());
	document.getElementById("startLon").value=lon;
	document.getElementById("startLat").value=lat;
	console.log("start:"+lon+"/"+lat);
	
	fullAddressSearch($("#endSearch").val());
	document.getElementById("endLon").value=lon;
	document.getElementById("endLat").value=lat;
	console.log("end:"+lon+"/"+lat);
	/* $('#search-form').submit();  */
}
//검색한 주소를 좌표로 변경하기 
function fullAddressSearch(fullAddress){
	$.ajax({
		method:"GET",
		url:"https://api2.sktelecom.com/tmap/geo/fullAddrGeo?version=1&format=xml&callback=result", //FullTextGeocoding api 요청 url입니다.
		async:false,
		data:{
			"coordType" : "WGS84GEO",
			"fullAddr" : fullAddress,  
			"page" : "1",
			"count" : "20",
			"appKey" : "8ea84df6-f96e-4f9a-9429-44cee22ab70f"
		},
		success:function(response){
			console.log(response);
			
			var resToStr = new XMLSerializer().serializeToString(response);
			resDoc = $.parseXML( resToStr ),
			$res = $( resDoc ),
			$resResult = $res.find("coordinate");
			console.log($resResult);
			//검색 결과 정보가 없을 때 처리
			if($resResult.length==0){
				//예외처리를 위한 파싱 데이터
				$intError = $res.find("error");
						
				// 주소가 올바르지 않을 경우 예외처리
				if($intError.context.all[0].nodeName == "error"){
					$("#result").text("요청 데이터가 올바르지 않습니다.");
				}
			}	
				  		    
			if($resResult[0].getElementsByTagName("lon").length>0){//구주소
				lon = $resResult[0].getElementsByTagName("lon")[0].childNodes[0].textContent;
			   	lat = $resResult[0].getElementsByTagName("lat")[0].childNodes[0].textContent;
			}else{//신주소
				lon = $resResult[0].getElementsByTagName("newLon")[0].childNodes[0].textContent;
				lat = $resResult[0].getElementsByTagName("newLat")[0].childNodes[0].textContent;
			}
		}
	});
	
}

</script>

<!-- 다음 주소 검색 -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
var check;
//출발지 검색
function sample6_execDaumPostcode1() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }
            check=addr+extraAddr;
            document.getElementById("startSearch").value = check;
        }
    }).open();
}
//도착지 검색
function sample6_execDaumPostcode2() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }
            document.getElementById("endSearch").value = addr+extraAddr;
        }
    }).open();
}
</script> 


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>