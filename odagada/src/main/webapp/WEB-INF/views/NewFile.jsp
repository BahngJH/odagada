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
/* 섹션 패딩 삭제 */
section.section-st{
font-family: 'TmonMonsori';
 margin: 0px;
 padding:0px;
 clear: both;
}
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
  height: 90vh;
}
.row,.col-12{
padding:0px;
margin:0px;
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
padding:5%;
}
.dot-L{
float:left;
}
.dot-R{
float:right;
}
.text-div{
padding:20%;
padding-bottom:0px;
}
.text-h4{
font-size:35px;
float:left;
}
.text-h3{
font-size:55px;
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
/* .rr{
float:right;
background-color: rgb(240,240,240);
} */
</style>
<section class="container-fluid section-st">
<!-- 배경이미지 -->
<div class="row r1">
	<div class="col-12 c1">
		<div class="wrapper">
			<div class="parallax-img">
				<div class="row text-div">
					<div class="col-12">
<!-- 						<div class="row" >
							<div class="offset-2 col-8"style="width:100%;border-bottom:2px solid white;" >
							</div>
						</div> -->
						<div class="row">
							<div class="col-2 dot-R">●</div>
							<div class="col-8">
								<div class="row">
									<div class="col-sm-12 t1 text-h4">
										<h4 class="text-h4">SEARCH FOR YOUR TRIP FROM</h4>
									</div>
									<div class="col-sm-12 t1 text-h3">
										<h3 class="text-h3">오다, 가다-</h3>
									</div>
								</div>
							</div>
							<div class="col-2 dot-L">●</div>
						</div>
						<div class="row t1" style="width:100%;border-top:2px solid white;">
							<div class="offset-2 col-8" >
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
<div class="wrapper">
	<div class="row">
		<div class="col-12 c4">
		</div>
		<div class="col-12" style="margin-top:10%;">
			
		</div>
		<div class="col-12">
			<div class="row">
				<div class="offset-5 col-4 c2">
					                  <c:if test="${logined==null || dList[0].DRIVERSTATUS eq 'N'}"> <!-- 드라이버가 아니면 status N -->
                     <button class="btn btn-success" onclick='location.href="${path}/driver/driverEnroll"'>드라이버 신청</button>
                  </c:if>
                  <c:if test="${ logined!=null && dList[0].DRIVERSTATUS eq 'Y'}"> <!-- 드라이버가 맞을 경우 Y -->
                     <button class="btn btn-success" onclick="location.href='${path }/carpool/register'">카풀 등록</button>
                  </c:if>
				</div>
				<div class="offset-3 col-5 c3">
					<img src="${path }/resources/images/main/menu_01.png" class="driver-img"/>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
<style>
	.c2{
		border:5px solid rgb(50,50,50);
		width:100%;
		height:250px;
		position:absolute;
		padding-right:5%;
	}
	.c3{
		margin-top:6%;
		margin-left:20%;
	}
	.c4{
		width:100%;
		height:300px;
		background-color:rgb(200,200,200);
		z-index:-1;
		margin-top:17%;
		position: absolute;
	}
	.driver-img{
		width:100%;
		height:360px;
		position:absolute;
		border:8px solid white;
	}
</style>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>