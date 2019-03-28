<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>

<style>
@font-face { font-family: 'NIXGONM-Vb'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONM-Vb.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'S-CoreDream-3Light'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff'); font-weight: normal; font-style: normal; }	
@font-face { font-family: 'silgothic'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/silgothic.woff') format('woff'); font-weight: normal; font-style: normal; }	
	h1{
		/* font-family : S-CoreDream-3Light; */
		font-family : silgothic;
		text-align: left;
		margin: 20px 0 20px 0;
	}
	.photo-backround{
		background-image: url(${pageContext.request.contextPath}/resources/images/driver1.png);
		background-position: center center;
		background-repeat: no-repeat;
		background-size: cover;
		height: 300px;
		margin-bottom: 30px;
		margin-top: 10px;
	}
	#tbl-board{
		margin-bottom: 30px;
	}
	a{
		color: black;
		text-decoration: none;
	}


.info {
	margin-top: 50px;
	margin-bottom: 50px;
}
div.mem-div{
/* background:url(${pageContext.request.contextPath}/resources/images/mypage/my2.png); */
max-width:100%;
height:auto;
background-repeat:repeat-y;
overflow: hidden;
background-color:rgba(200,200,200,0.8);
border-right: 2px solid rgba(200,200,200,0.6);
border-left: 7px solid rgba(180,180,180,0);
}
/* .transition{
    transition-property: all;
    transition-duration: 1s;
    transition-timing-function: linear;
    transition-delay:0.2;
} */
img.logo-img{
   padding-left:18%;
   padding-top:20%;
   padding-bottom:18%;
   color:white;
}
div.my-div{
   border-bottom:1px solid rgb(200,200,200);
}
p.my-p{
   color: rgb(255,255,255);
   font-size: 22px;
   font-family: "a어린왕자B";
}
img.my-img{
   width:20px;
   heigth:20px;
   float:left;
}
div.subMy-div{
padding-top:8%;
padding-bottom:8%;
padding-left:10%;
padding-right:10%;
/* border-bottom:1px solid rgb(240,240,240); */
}
div.subMy-div:hover{
/* background-color:rgba(150,150,150,); */
color:white;
box-shadow: 0px 2px 1px white,0px -2px 1px white;
border-radius: 3px;
transform: perspective(250px) translateZ(7px);
}   
.active-s{
background-color:rgba(180,180,180,1);
color:white;
box-shadow: 0px 2px 1px white,0px -2px 1px white;
border-radius: 3px;
}   
a.subMy-a{
   text-decoration:none;
   font-size: 15px;
   font-family: "a이끌림M";
   color:white;
}
button.checkPass-btn{
   text-decoration: none;
   border: none;
   border-radius: 25px;
   width:100px;
   height:30px;
   background-color:#FFCD12;
   font-size: 16px;
   float:right;
}
button.checkPass-btn:hover{
   background-color:rgba(50,50,50,0.7);
   color:white;
}
div.N-div{
   border:2px solid rgb(0,175,76);
}
div.a-card:hover{
box-shadow: 1px 1px 1px rgb(0,175,76),-1px -1px 1px rgb(0,175,76);
}
div.Y-div{
   border:2px solid darkgray;
   background-color:rgb(200,200,200);
}
div.head-div{
background-color:rgb(0,175,76);
}
div.headN-div{
background-color:rgb(100,100,100);
}
.mark-p{
      width: 0;
      height: 0;
      border-top: 20px solid #FFCD12;
      border-right: 20px solid transparent;
      float:left;
}
.markN-p{
      width: 0;
      height: 0;
      border-top: 20px solid rgb(100,100,100);
      border-right: 20px solid transparent;
      float:left;
}
div.list-div{
margin-bottom:20px;
height:380px;
}
span.start-span{
color: rgb(0,175,76);
}
.card{
height:370px;
}
.container{
font-family:silgothic;
}
</style>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1 id="miniTitle">나의 오다, 가다</h1>
	</div>
</section>
<section class="photo-backround" data-image="${path}/resources/images/driver1.png">
</section>
<section class="container" style="margin-top: 0px;">
   <div class="row">
		<div class="col-12 col-md-3">
			<div class="menu_list info list-group">
				<a href="${path }/member/myInfo.do" class="list-group-item list-group-item-action">회원 정보 관리</a>
				<a href="${path }/member/myCarpool" class="list-group-item list-group-item-action">카풀 내역</a>
				<c:if test="${driver ne null}">
				<a href="${path}/member/myDriver" class="list-group-item list-group-item-action">드라이버 정보 관리</a>
				</c:if>
        <a href="${path }/driver/driverCarpool" id="driverCarpool" class="list-group-item list-group-item-action active">드라이버 카풀 등록 내역</a>
			</div>
		</div>
      <!-- 리스트 -->
      <div class="col-12 col-md-9">
         <div class="row info">
	         <c:choose>
	         	<c:when test="${dcarList[0] !=null }">
	         		<c:forEach items="${dcarList }" var="dc">
		               <c:if test='${dc.STATUS eq "N" }'>
		                  <div class="col-md-6 list-div">
		                     <div class="card a-card">
		                     	<div class="card-header head-div">
		                     	</div>
		                        <div class="card-body N-div">
		                        <div class="row">
			                        <div class="col-6">
			                        	 <div class="mark-p"></div><span class="start-span"><b>출발일</b></span><br> <p>&nbsp;&nbsp;&nbsp;&nbsp;${fn:substring(dc.STARTDATE,0,10)}</p><hr>
			                        </div>
			                        <div class="col-6">
			                        	 <div class="mark-p"></div><span class="start-span"><b>출발시간</b></span><br> <p>&nbsp;&nbsp;&nbsp;&nbsp;${fn:substring(dc.STARTDATE,11,20)}</p><hr>
			                        </div>
		                        </div>
		                        	<div class="mark-p"></div><span class="start-span"><b>출발지</b></span><br> <p>&nbsp;&nbsp;&nbsp;&nbsp;${dc.STARTCITY } ${dc.STARTDETAIL }</p><hr>
		                        	<div class="mark-p"></div><span class="start-span"><b>도착지</b></span><br> <p>&nbsp;&nbsp;&nbsp;&nbsp;${dc.ENDCITY } ${dc.ENDDETAIL }</p>
		                           <span> 
		                              <button onclick="location.href='${path}/driver/selectDriverPas?driverNum=${logined.memberNum}&carpoolNum=${dc.CARPOOLNUM }&sta=Y'" class="checkPass-btn">동승자 확인</button>
		                           </span>
		                        </div>
		                     </div>
		                  </div>
		               </c:if>
		               <c:if test='${dc.STATUS eq "Y" }'>
		                  <div class="col-md-6" style="margin-top:30px">
		                     <div class="card">
		                     	<div class="card-header headN-div">
		                     	</div>
		                        <div class="card-body Y-div">
		                           <div class="markN-p"></div><span><b>출발일</b></span><br> <p>${dc.STARTDATE }</p><hr>
		                           <div class="markN-p"></div><span><b>출발지</b></span><br> <p>${dc.STARTCITY } ${dc.STARTDETAIL }</p><hr>
		                           <div class="markN-p"></div><span><b>도착지</b></span><br> <p>${dc.ENDCITY } ${dc.ENDDETAIL }</p>
		                           <span>
		                              <button onclick="location.href='${path}/driver/selectDriverPas?driverNum=${logined.memberNum}&carpoolNum=${dc.CARPOOLNUM }&sta=N'" class="checkPass-btn">동승자 결제</button>
		                           </span>
		                        </div>
		                     </div> 
		                  </div>
		               </c:if>
		            </c:forEach>
	         	</c:when>
	        	<c:otherwise>
	        		<div class="col-12 info">
	        			<div class="card" >
	        				<div class="card-header">
	        					<h4><b>등록 된 카풀 내역이 없습니다.</b></h4>
	        				</div>
	        				<div class="card-body  text-center">
      							<p><b>카풀 등록</b>을 이용해서 카풀서비스를 등록해보세요!</p>
      						</div>
      					</div>
       				</div>
	       		</c:otherwise>
	         </c:choose>
         </div>
      </div>
   </div>
   ${pageBar }
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>