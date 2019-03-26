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
<div class="row">
	<div class="col-12 c4" >
		
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
				<img src="${path }/resources/images/main/driver-1.png" class="driver-img transition" />
			</div>
			<div class="col-6 col-md-3 c3 car-div">
				<a class="text-d" href="${path }/carpool/register">카풀 등록하기</a>
				<img src="${path }/resources/images/main/carpool-1.png" class="driver-img transition"/>
			</div>
		</div>
	</div>
</div>
</section>
<style>
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
		padding-top:90%;
		padding-left:20%;
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
    @media all and (max-width: 1100px){
	    .text-d{
			font-size:25px;
			position:absolute;
			z-index:1;
			padding-top:90%;
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
			padding-top:90%;
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
    @media all and (max-width: 768px){
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>