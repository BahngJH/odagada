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
@font-face { font-family: 'TmonMonsori'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'silgothic'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/silgothic.woff') format('woff'); font-weight: normal; font-style: normal; }
	
/* 섹션 패딩 삭제 */
section.section-st{
font-family: 'TmonMonsori';
padding:0px;
}
/* 섹션 패딩 삭제 */
.r1,.c1{
padding:0px;
margin:0px;
}
/* 이미지 패딩 삭제 */
.parallax-img {
  background-image:url(${pageContext.request.contextPath}/resources/images/main/14.jpg);
}
.parallax-img {
  height: 100%;
/*   background-attachment: fixed; */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position:relative;
}
.wrapper {
  height: 100vh;
}
.row{
margin-left:0px;
margin-right:0px;
}
.row,.col-12{
padding:0px;
/* margin:0px; */
}
.t1{
position:relative;
color:white;
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
button.btn-search{
   height:50px;
   border-radius:40px;
}
input#startDate{
    border-top-right-radius: 0px;
    border-bottom-right-radius: 0px;
}
.dot-L,.dot-R{
color:white;
font-size:12px;
padding:3%;
}
.dot-L{
float:left;
}
.dot-R{
float:right;
}
.text-div{
padding:10%;
padding-bottom:0px;
padding-top:26%;
}
.text-h4{
font-size:50px;
text-shadow:2px 2px 8px rgb(30,30,30);
text-align: center;
}
.text-h3{
font-size:70px;
text-shadow:2px 2px 8px rgb(30,30,30);
float:right;
}
.search-row{
padding-top:3%;
}
.s1{
float:left;
}
.search-form{
margin-left:10%;
}

<!-- 중앙 드라이버 등록/카풀 등록 부분 -->
	.c4{
		width: 100%;
	    background-color: rgba(223,255,220,0.2);
	    height: 60vh;
	    position: absolute;
	}
	a:not([href]):not([tabindex]) {
		color:white;
	}
	a:hover{
		text-decoration: none;
		color:white;
		text-shadow: 1px 1px 2px white;
	}
	.oda-text{
		padding-top:10%;
	}
	.oda-div{
		border-bottom-left-radius: 30px;
		border-bottom-right-radius: 30px;
		border-top-left-radius: 30px;
		border-top-right-radius: 30px;
		width:120px;
	}
	.text-d{
		font-size:30px;
		position:absolute;
		z-index:1;
		padding-top:75%;
		padding-left:16%;
		max-width:100%;
		color:white;
		text-decoration: none;
	}
	.c3{
		padding-right:10px;
		display: block;
	    position: relative;
	    width: 100%;
	    overflow: hidden;
	    height: 60vh;
	    margin-top:10%;
	}
/* 	.car-div{
		margin-left:30px;
	} */
	.driver-img{
		overflow:hidden;
		max-width:90%;
		/* height:100%; */
		position:absolute;
		border:4px solid white;
		margin-left:5px;
		border-radius:2px;
	    display: block;
	}
	.driver-img:hover{
		transform: scale(1.02,1.02);
	}
    .transition{
     	transition: .1s ;
    }
    /* 드라이버 등록/카풀 등록 */
    @media all and (min-width: 1100px){
		.text-d{
			font-size:30px;
			position:absolute;
			z-index:1;
			padding-top:75%;
			padding-left:16%;
			max-width:100%;
			color:white;
			text-decoration: none;
		}
		.c4{
			width: 100%;
		    background-color: rgba(223,255,220,0.2);
		    height: 60vh;
		    position: absolute;
		}
    }
    @media all and (max-width: 1100px){
	    .text-d{
			font-size:25px;
			position:absolute;
			z-index:1;
			padding-top:85%;
			padding-left:18%;
			max-width:100%;
			color:white;
			text-decoration: none;
		}
		.c4{
			width: 100%;
		    background-color: rgba(223,255,220,0.2);
		    height: 45vh;
		    position: absolute;
		}
    }
    @media all and (max-width: 840px){
   	    .text-d{
			font-size:20px;
			position:absolute;
			z-index:1;
			padding-top:75%;
			padding-left:17%;
			max-width:100%;
			color:white;
			text-decoration: none;
		}
		.gada-h{
			font-size:25px;
		}
		.gada-p{
			font-size:15px;
			font-family: 'silgothic';
		}
		.oda-div{
		border-bottom-left-radius: 30px;
		border-bottom-right-radius: 30px;
		border-top-left-radius: 30px;
		border-top-right-radius: 30px;
		width:100px;
		font-size:15px;
		clear:right;
		}
		.c4{
			width: 100%;
		    background-color: rgba(223,255,220,0.2);
		    height: 35vh;
		    position: absolute;
		}
    }
    @media all and (max-width: 768px){
   		.oda-text{
			padding-top:0;
		}
		.oda-div{
			float:right;
		}
		.c3{
			display: block;
		    position: relative;
		    width: 100%;
		    overflow: hidden; 
		    height:auto;
		    text-align: center;
		}
		.car-div{
			height: 60vh;
		}
		.text-d{
			padding: 0;
		    margin: 0;
		    font-size:18px;
		    padding-top: 90%;
		    float: left;
		    margin-left: -65px;
		}
    }
    /* 검색하기 버튼들 */
    @media all and (max-width: 810px){
	    .input-group>.form-control:not(:last-child){
		   border-top-right-radius: 40px;
		    border-bottom-right-radius: 40px;
		    border-top-left-radius: 40px;
		    border-bottom-left-radius: 40px;
		    width:40px;
		    height:50px;
		}
    }
    /* 메인 이미지 안에 요소들 */
    @media all and (max-width: 1500px){
    	.text-div{
		padding:10%;
		padding-bottom:0px;
		padding-top:30%;
		}
		.dot-L,.dot-R{
		color:white;
		font-size:12px;
		padding:3%;
		}
    }
	@media all and (max-width: 900px){
		.text-div{
		padding:10%;
		padding-bottom:0px;
		padding-top:40%;
		}
	}
    @media all and (max-width: 768px){
       	.text-div{
		padding:10%;
		padding-bottom:0px;
		padding-top:40%;
		height:auto;
		}
    	.text-h4{
    	margin-top:10%;
		font-size:35px;
		text-shadow:2px 2px 8px rgb(30,30,30);
		text-align: center;
		}
		.text-h3{
		font-size:45px;	
		text-shadow:2px 2px 8px rgb(30,30,30);
		float:right;
		}
		.dot-L,.dot-R{
		margin-top:25%;
		color:white;
		font-size:8px;
		padding:3%;
		}
    }
    @media all and (max-width: 550px){
    	.text-h4{
    	margin-top:30%;
		font-size:30px;
		text-shadow:2px 2px 8px rgb(30,30,30);
		text-align: center;
		}
		.text-h3{
		font-size:35px;
		text-shadow:2px 2px 8px rgb(30,30,30);
		float:right;
		}
		.dot-L,.dot-R{
		margin-top:50%;
		color:white;
		font-size:6px;
		padding:3%;
		}
    }
</style>
<section class="container-fluid section-st">
<!-- 배경이미지 -->
<div class="row r1">
	<div class="col-12 c1">
		<div class="wrapper">
			<div class="parallax-img">
				<div class="row text-div">
					<div class="col-12">
						<div class="row">
							<div class="col-1 dot-R">●</div>
							<div class="col-10">
								<div class="row">
									<div class="col-sm-12 t1 text-h4">
										<h4 class="text-h4">SEARCH FOR YOUR TRIP FROM</h4>
									</div>
									<div class="col-sm-12 t1 text-h3">
										<h3 class="text-h3">오다, 가다-</h3>
									</div>
								</div>
							</div>
							<div class="col-1 dot-L">●</div>
						</div>
						<div class="row t1" style="width:100%;border-top:2px solid white;">
							<div class="offset-1 col-10" >
							</div>
						</div>
					</div>
				</div>
				<div class="row search-row">
					<div class="col-12">
						<form action="${path }/carpool/searchEnd.do" method="post" id="search-form" class="search-form" onsubmit="return validate()">
			               <div class="col-sm-12 offset-md-2 col-md-2 t1 s1">
			                  <div class="input-group">
			                     <input type="text" class="form-control div-search" name="startSearch" id="startSearch" placeholder="○ 출발지 입력" onclick="sample6_execDaumPostcode1()" readonly/>
			                     <input type="text" name="startLon" id="startLon" value="" hidden/>
			                     <input type="text" name="startLat" id="startLat" value="" hidden/>
			                     <input type="text" name="kmNum" id="kmNum" value="3" hidden/>
			                     <br>
			                  </div>
			               </div>
			               <div class="col-sm-12 col-md-2 t1 s1">
			                  <div class="input-group">
			                     <input type="text" class="form-control div-search" name="endSearch" id="endSearch" placeholder="○ 도착지 입력"  onclick="sample6_execDaumPostcode2()"  readonly/>
			                     <input type="hidden" name="endLon" id="endLon" value=""/>
			                     <input type="hidden" name="endLat" id="endLat" value=""/>
			                  </div>
			               </div>
			                 <div class="col-sm-12 col-md-2 t1 s1">
			                     <div class="form-group">
			                         <div class="input-group date div-search " id="datetimepicker1" data-target-input="nearest">
			                             <input type="text" class="form-control datetimepicker-input date-div" data-target="#datetimepicker1" name="startDate" id="startDate" placeholder="○ 출발일 입력" />
			                             <div class="input-group-append date " data-target="#datetimepicker1" data-toggle="datetimepicker">
			                                 <div class="input-group-text div-icon date-icon" ><i class="fa fa-calendar" ></i></div>
			                             </div>
			                         </div>
			                     </div>
			                 </div>
			                <div class="col-12 col-md-2 t1 s1">
			                  <div class="input-group-btn">
			                     <button class="btn btn-success div-search btn-search" type="button" id="btn_search" onclick="search();">
			                        &nbsp;&nbsp;<i class="fas fa-search-location"></i>&nbsp;&nbsp;
			                     </button>
			                  </div>
			               </div>
			         </form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 드라이버 등록/카풀등록 -->
<div class="row">
	<div class="col-12 text-center c4" >
		<h1 class="letter-h">ODAGADA</h1>
	</div>
	<div class="col-12">
		<div class="row">
			<div class="col-12 offset-md-2 col-md-2 c3 oda-text">
				<div class="col-12">
					<h3 class="gada-h"><b>오다, 가다</b></h3>
				</div>
				<div class="col-12">
					<p class="gada-p">오다가다의 베스트 드라이버가 되어보세요.</p>
				</div>
				<div class="col-8 col-sm-7">
					<div class="form-control div-search text-center oda-div">이용하기 <b>></b></div>
				</div>
			</div>
			<div class="col-6 offset-md-1 col-md-3 c3 car-div">
				<a href="${path}/driver/driverEnroll" class="text-d">드라이버 등록</a>
				<img src="${path }/resources/images/main/driver-2.png" class="driver-img transition" />
			</div>
			<div class="col-6 col-md-3 c3 car-div">
				<a class="text-d" href="${path }/carpool/register">카풀 등록하기</a>
				<img src="${path }/resources/images/main/carpool-2.png" class="driver-img transition"/>
			</div>
		</div>
	</div>
</div>
<!-- 자주가는 경로 -->
<%--    <div class="row">
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
   </div> --%>
<!-- 우리 카풀 장점 -->
<hr>
	<div class="row">
		<div class="offset-md-1 col-md-3">
			<div class="row">
				<div class="col-12 text-center">
					<%-- <img src="${path }/resources/images/"/> --%>
				</div>
			</div>
			<div class="row">
				<div class="col-12 text-center">
					<h5>더 다양하게 만나다!</h5>
					<p>다양한 사람들과 함께 소통할 수 있는 기회가 생기고, 함께 드라이빙하며 나누는 행복!</p>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="row">
				<div class="col-12 text-center">
					<%-- <img src="${path }/resources/images/"/> --%>
				</div>
			</div>
			<div class="row">
				<div class="col-12 text-center">
					<h5>중/장거리 이동의 편리함</h5>
					<p></p>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="row">
				<div class="col-12 text-center">
					<%-- <img src="${path }/resources/images/"/> --%>
				</div>
			</div>
			<div class="row">
				<div class="col-12 text-center">
					<h5></h5>
					<p></p>
				</div>
			</div>
		</div>
	</div>
<!-- 	<div class="row">
		<div class="col-12">
			<ul>
				<li>
					<a href="/homepage/docs/kor6/jsp/ethics/newEthics_main.jsp" target="_blank" title="윤리경영 바로가기">
						<div class="image"><img src="/docs/kor6/jsp/_images/main/link_image1.jpg" width="100%" alt=""><p></p><span>view more</span></div>
						<p class="title">윤리경영</p>
						<p class="text">올바른 일을 올바르게 하는 것, 바로 포스코가하는 것입니다.</p>
					</a>
				</li>
				<li>
					<a href="/homepage/docs/kor6/jsp/ethics/newEthics_main.jsp" target="_blank" title="윤리경영 바로가기">
						<div class="image"><img src="/docs/kor6/jsp/_images/main/link_image1.jpg" width="100%" alt=""><p></p><span>view more</span></div>
						<p class="title">윤리경영</p>
						<p class="text">올바른 일을 올바르게 하는 것, 바로 포스코가하는 것입니다.</p>
					</a>
				</li>
				<li>
					<a href="/homepage/docs/kor6/jsp/ethics/newEthics_main.jsp" target="_blank" title="윤리경영 바로가기">
						<div class="image"><img src="/docs/kor6/jsp/_images/main/link_image1.jpg" width="100%" alt=""><p></p><span>view more</span></div>
						<p class="title">윤리경영</p>
						<p class="text">올바른 일을 올바르게 하는 것, 바로 포스코가하는 것입니다.</p>
					</a>
				</li>
				<li>
					<a href="/homepage/docs/kor6/jsp/ethics/newEthics_main.jsp" target="_blank" title="윤리경영 바로가기">
						<div class="image"><img src="/docs/kor6/jsp/_images/main/link_image1.jpg" width="100%" alt=""><p></p><span>view more</span></div>
						<p class="title">윤리경영</p>
						<p class="text">올바른 일을 올바르게 하는 것, 바로 포스코가하는 것입니다.</p>
					</a>
				</li>
			</ul>
		</div>
	</div> -->
</section>
<style>
.letter-h{
color:gray;
font-size:130px;
margin-top:50%;
position: fixed;
}
</style>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>