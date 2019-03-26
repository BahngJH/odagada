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
	.div-search{
		margin:20px;
		height:50px;
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
	input.date-div{
	height:50px;
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
	div.date-btn{
		padding-right:20px; 
	}
	a{
	text-decoration: none;
	}
	a.info-a{
		text-decoration: none;
		color:rgb(100,100,100);
		font-size:15px;
		float:right;
	}
	.info-img{
	width:100%;
	height:100%;
	}
	.modal-dialog{
		max-width:780px;
	}
	@font-face { font-family: 'silgothic'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/silgothic.woff') format('woff'); font-weight: normal; font-style: normal; }	
	h1{
		/* font-family : S-CoreDream-3Light; */
		font-family : silgothic;
		text-align: left;
		margin: 20px 0 20px 0;
	}
	.photo-backround{
		background-image: url(${pageContext.request.contextPath}/resources/images/search.png);
		background-position: center center;
		background-repeat: no-repeat;
		background-size: cover;
		height: 300px;
		margin-bottom: 30px;
		margin-top: 10px;
	}

</style>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1> 원하는 장소를 검색해보세요.</h1>
	</div>
</section>

<section class="photo-backround" data-image="${path}/resources/images/search.png">
</section>

<section class="container">
	<div class="row">
		 <div class="col-9">
		 	<a class="info-a" style="text-decoration: none;color: rgb(140,140,140);"href="" data-toggle="modal" data-target="#info">◎ 검색 방법 알아보기</a>
		 </div>
	</div>
	<div class="row">
		<div class="offset-3 col-6">
			<form action="${path }/carpool/searchEnd.do" method="post" id="search-form" onsubmit="return validate()">
				<div class="row">
					<div class="col-12">
						<div class="input-group">
							<input type="text" class="form-control div-search" name="startSearch" id="startSearch" placeholder="○ 출발지 입력" onclick="sample6_execDaumPostcode1()" readonly/>
							<input type="text" name="startLon" id="startLon" value="" hidden/>
							<input type="text" name="startLat" id="startLat" value="" hidden/>
							<input type="text" name="kmNum" id="kmNum" value="3" hidden/>
							<br>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="input-group">
							 <input type="text" class="form-control div-search" name="endSearch" id="endSearch" placeholder="○ 도착지 입력"  onclick="sample6_execDaumPostcode2()"  readonly/>
		                     <input type="hidden" name="endLon" id="endLon" value=""/>
		                     <input type="hidden" name="endLat" id="endLat" value=""/>
						</div>
					</div>
				</div>
				<div class="row">
			        <div class="col-sm-12">
						<div class="form-group">
						    <div class="input-group date div-search " id="datetimepicker1" data-target-input="nearest">
						        <input type="text" class="form-control datetimepicker-input date-div" data-target="#datetimepicker1" name="startDate" id="startDate" placeholder="○ 출발일 입력" />
						        <div class="input-group-append date date-btn" data-target="#datetimepicker1" data-toggle="datetimepicker">
						            <div class="input-group-text div-icon date-icon" ><i class="fa fa-calendar" ></i></div>
						        </div>
						    </div>
						</div>
			        </div>
			    </div>
				<div class="row">
				 	<div class="col-sm-12">
						<div class="input-group-btn">
							<button class="btn btn-success div-search btn-search" type="button" id="btn_search" onclick="search();">
							&nbsp;&nbsp;<i class="fas fa-search-location"></i>&nbsp;&nbsp;
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-3">
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

	var exp = /^20\d{2}.(0[1-9]|1[012]).(0[1-9]|[12][0-9]|3[0-1]). 오[전|후] ([0-9]|1[0-2]):([0-5][0-9])$/; 
	
	if(!exp.test($("#startDate").val())){
		alert("날짜를 확인해주세요.");
		return false;
	}

	var nowDate = moment().format('YYYY.MM.DD. hh:mm');
    var setDate = $("#startDate").val();
    var setDates = setDate.split(" ");
    var nowDates = nowDate.toString().split(" ");
      
    var time = setDates[2].split(":");
   
    if(setDates[1] === "오후"){
	    time[0] = Number(time[0]) + 12;
    }
   
    var setDate = moment(setDates[0] + " " + time[0] + ":" + time[1], 'YYYY.MM.DD. HH:mm');
  
    if(moment.duration(setDate.diff(nowDate)).asMinutes() < 1){
       alert("날짜를 확인해주세요.");
       return false;
    }
	
	
	// 검색된 주소의 lat,lon 값 넣기
	fullAddressSearch($("#startSearch").val());
	document.getElementById("startLon").value=lon;
	document.getElementById("startLat").value=lat;
	
	fullAddressSearch($("#endSearch").val());
	document.getElementById("endLon").value=lon;
	document.getElementById("endLat").value=lat;
	console.log("  dfdf"+$('#today').val());
	$('#search-form').submit();
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