<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>
<!-- 제이쿼리 --> 	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<style>
/* 섹션 패딩 삭제 */
section.section-st{
font-family:'a시나브로L';
padding:0px;
}
/* 메인 상단부 */
div.main-div{
	/* box-shadow: inset -60px 0 100px #fff;  */
	background:url(${pageContext.request.contextPath}/resources/images/55.jpg);
	background-repeat:no-repeat;
	background-size:cover;
	max-width:100%;
	height: 100vh;
	position:relative;
}
div.search-div{
	position:absolute;
	background: linear-gradient(to bottom, rgba(255,255,255, 0) 30%, #1C1C1C 100%);
	padding-top:22%;
	padding-bottom:50px;
	border:none;
	background-size:cover;
}
img.main-img{
     width:100%;
     height:auto;
     box-shadow: inset -60px 0 100px #fff; 
}
input.div-search:hover{
	box-shadow: 2px 2px 3px rgb(0,175,76),-2px -2px 3px rgb(0,175,76);
} 
input#startDate{
    border-top-right-radius: 0px;
    border-bottom-right-radius: 0px;
}
input#startDate:hover{
	box-shadow: 2px 2px 3px rgb(0,175,76),-2px -2px 3px rgb(0,175,76);
}
.input-group>.form-control:not(:last-child){
	border-top-right-radius: 40px;
    border-bottom-right-radius: 40px;
   	border-top-left-radius: 40px;
    border-bottom-left-radius: 40px;
    width:50px;
    height:55px;
}
div.date-icon{
	border-top-right-radius: 40px;
    border-bottom-right-radius: 40px;
}
div.date-icon:hover{

	box-shadow: 2px 2px 3px rgb(0,175,76),-2px -2px 3px rgb(0,175,76);
}
button.btn-search{
	height:50px;
	border-radius:40px;
}
h1.text-h1{
	font-family:'Segoe UI Black';
	color:white;
	text-shadow: 2px 2px 2px rgb(0,175,76),-2px -2px 2px rgb(0,175,76);
	font-size:70px;
}
h3.text-h3{
	color:white;
	font-size: 40px;
	margin-bottom:20px;
	font-family: 'a시나브로L';
}

/* 같이탈래..? 추천~ */
div#text-div{
	margin:30px;
}
div.pop-div{
	background-color:rgb(240,240,240,0.8);
}
div.pop-toggle{
	padding-left:10%;
	padding-right:10%;
}
div#pop-toggle{
	display: none;
	
}
div.pop-size{
   	margin-left: 50px;
    margin-right: 50px;
}
h3.best-text{
	text-align: center;
}
h3.best-text::before{
    /* p를 쓰기전에 어떤 값을 입력하고 싶을때!! */
    position: absolute;
    left: -300px;
    top: 50%;
    margin-top: -1px;
    height: 2px;
    width: 350px;
    content: "";
    border-top: 2px solid #28A745;
}
h3.best-text::after{
    left: auto;
    right: -300px;
    position: absolute;
    top: 50%;
    margin-top: -1px;
    height: 2px;
    width: 350px;
    content: "";
    border-top: 2px solid #28A745;
}
}
</style>
<section class="container-fluid section-st">
<!-- 배경이미지 -->
	<div class="row">
		<div class="col-12 tt">
			<div class="main-div">
				<%-- <img class="main-img" src="${path }/resources/images/main_img.jpg"> --%>
				<form action="${path }/carpool/searchEnd.do" method="post" id="search-form" onsubmit="return validate()">
				<div class="row card-img-overlay search-div">
					<div class="col-12">
						<h1 class="text-center text-h1">Welcome to Odagada</h1>
						<h3 class="text-center text-h3">Search for your travel</h3>
					</div>
					<br><br>
					<div class="col-sm-12 offset-md-3 col-md-2">
						<div class="input-group">
							<input type="text" class="form-control div-search" name="startSearch" id="startSearch" placeholder="○ 출발지 입력" onclick="sample6_execDaumPostcode1()" readonly/>
							<input type="text" name="startLon" id="startLon" value="" hidden/>
							<input type="text" name="startLat" id="startLat" value="" hidden/>
							<input type="text" name="kmNum" id="kmNum" value="3" hidden/>
							<br>
						</div>
					</div>
					<div class="col-sm-12 col-md-2">
						<div class="input-group">
							<input type="text" class="form-control div-search" name="endSearch" id="endSearch" placeholder="○ 도착지 입력"  onclick="sample6_execDaumPostcode2()"  readonly/>
							<input type="hidden" name="endLon" id="endLon" value=""/>
							<input type="hidden" name="endLat" id="endLat" value=""/>
						</div>
					</div>
			        <div class="col-sm-12 col-md-2">
			            <div class="form-group">
			                <div class="input-group date div-search " id="datetimepicker1" data-target-input="nearest">
			                    <input type="text" class="form-control datetimepicker-input date-div" data-target="#datetimepicker1" name="startDate" id="startDate" placeholder="○ 출발일 입력" />
			                    <div class="input-group-append date " data-target="#datetimepicker1" data-toggle="datetimepicker">
			                        <div class="input-group-text div-icon date-icon" ><i class="fa fa-calendar" ></i></div>
			                    </div>
			                </div>
			            </div>
			        </div>
				 	<div class="col-12 col-md-2">
						<div class="input-group-btn">
							<button class="btn btn-success div-search btn-search" type="button" id="btn_search" onclick="search();">
								&nbsp;&nbsp;<i class="fas fa-search-location"></i>&nbsp;&nbsp;
							</button>
						</div>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
<!-- 드라이버 이미지 -->
	<div class="row">
		<div class="col-12">
			<div class="row">
				<div class="col-12 col-md-7"> 
					드라이버 이미지	
				</div>
				<div class="col-12 col-md-4">
					<div class="drive-div">
						<c:if test="${logined==null || dList[0].DRIVERSTATUS eq 'N'}"> <!-- 드라이버가 아니면 status N -->
							<button class="btn btn-success">드라이버 신청</button>
						</c:if>
						<c:if test="${ logined!=null && dList[0].DRIVERSTATUS eq 'Y'}"> <!-- 드라이버가 맞을 경우 Y -->
							<button class="btn btn-success">카풀 등록</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 자주가는 경로 -->
	<div class="row">
		<div class="col-12 pop-div">
			<div class="row" id="text-div">
				<div class="offset-4 col-4">
					<h3 class="best-text">Best way to drive</h3>
				</div>
			</div>
			<div class="row">
				<div class="offset-10 col-2">
					<p id="pop-more"><i>show more</i></p>
				</div>
			</div>
			<div class="row pop-toggle" >
				<c:forEach items="${chList }" var="ch" varStatus="count">
					<c:if test="${count.index <3 }">
						<div class="col-12 col-md-4 ">
							<div class="card text-white bg-success mb-5 text-center pop-size">
								<span>${ch.STARTCITY}</span>
								<i class="far fa-arrow-alt-circle-down"></i>
								<span>${ch.ENDCITY }</span>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<div class="row pop-toggle" id="pop-toggle">
				<div class="row">
					<c:forEach items="${chList }" var="ch" varStatus="count">
						<c:if test="${count.index >=3 && count.index <12 }">
							<div class="col-12 col-md-4 ">
								<div class="card text-white bg-success mb-5 text-center pop-size">
									<span>${ch.STARTCITY}</span>
									<i class="far fa-arrow-alt-circle-down"></i>
									<span>${ch.ENDCITY }</span>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
<!-- 우리 카풀 장점 -->
	<%-- <div class="row".>
		<div class="col-md-12 card-group">
			<div class="card">
				<img class="card-img-top img-size" src="${path}/resources/images/map.png" alt="Card image cap">
				<div class="card-body">
				  <h4 class="card-title">Card title</h4>
				  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
				  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top img-size" src="${path}/resources/images/people.png" alt="Card image cap">
				<div class="card-body">
				  <h4 class="card-title">Card title</h4>
				  <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
				  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top img-size" src="${path}/resources/images/car.png" alt="Card image cap">
				<div class="card-body">
				  <h4 class="card-title">Card title</h4>
				  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
				  <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
				</div>
			</div>
		</div>
	</div> --%>
</section>
<!-- 추천 경로 더보기 -->
    <script>
        $(function()
		{
            var flag=true;
            $('#pop-more').click(function(){
                if(flag)
                {
                    $('#pop-toggle').slideDown();
                    flag=false;
                }
                else{
                    $('#pop-toggle').slideUp();
                    flag=true;
                }
                //$(this).next().toggle();
            });
            
        })
    </script>
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

	var nowDate = moment().format('YYYY.MM.DD. a hh:mm');
	console.log($("#startDate").val());
	
	if(!($("#startDate").val() > nowDate)){
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>