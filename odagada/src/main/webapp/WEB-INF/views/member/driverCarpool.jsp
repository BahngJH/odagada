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
	background-color:rgb(0,175,76);
	color:white;
	font-size: 16px;
	float:right;
}
button.checkPass-btn:hover{
   background-color:rgba(50,50,50,0.7);
   color:white;
}
div.N-div{

	border:2px solid rgb(0,175,76);
	background-color:rgba(0,175,76,0.1);
}
div.N-div:hover{
	box-shadow: 2px 2px 1px rgb(0,175,76),-2px -2px 1px rgb(0,175,76);
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
</style>
<section class="container">
   <div class="row">
       <div class="col-sm-12 col-md-3 mem-div">
          <div class="col-12">
             <img alt="logo" src="${path }/resources/images/mypage/logo2.png" class="img-fluid logo-img">
          </div>
          <div class="offset-1  col-10 my-div">
             <p class="text-center my-p">ALL MY PAGE</p>
          </div>
          <div class="col-12 text-center subMy-div">
             <span>
                <img src="${path }/resources/images/mypage/my1.png" class="my-img">
                <span>
                   <a href="#" class="subMy-a">내 정보 관리</a>
                </span>
             </span>
          </div>
          <div class="col-12 text-center subMy-div">
             <span>
                <img src="${path }/resources/images/mypage/my5.png" class="my-img">
                <span>
                   <a href="${path }/member/myCarpool" class="subMy-a">내 카풀 내역</a>
                </span>
             </span>
          </div>
          <div class="col-12 text-center subMy-div">
             <span>
                <img src="${path }/resources/images/mypage/my3.png" class="my-img">
                <span>
                   <a href="#" class="subMy-a">드라이버 정보 관리</a>
                </span>
             </span>
          </div>
          <div class="col-12 text-center subMy-div  active-s">
             <span>
                <img src="${path }/resources/images/mypage/my4.png" class="my-img ">
                <span>
                   <a href="${path }/driver/driverCarpool" class="subMy-a">&nbsp;&nbsp;드라이버 카풀 등록 내역&nbsp;&nbsp;</a>
                </span>
             </span>
          </div>
      </div> 
      
      <!-- 리스트 -->
      <div class="col-12 offset-md-1 col-md-7">
         <div class="row">
            <c:forEach items="${dcarList }" var="dc">
               <c:if test='${dc.STATUS eq "N" }'>
                  <div class="col-md-6" style="margin-top:30px">
                     <div class="card a-card">
                     	<div class="card-header head-div">
                     	</div>
                        <div class="card-body N-div">
                           <div class="mark-p"></div><span><b>출발일</b></span><br> <p>${dc.STARTDATE }</p><hr>
                           <div class="mark-p"></div><span><b>출발지</b></span><br> <p>${dc.STARTCITY } ${dc.STARTDETAIL }</p><hr>
                           <div class="mark-p"></div><span><b>도착지</b></span><br> <p>${dc.ENDCITY } ${dc.ENDDETAIL }</p>
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
         </div>
      </div>
   </div>
</section>
<script>
   function updateCredit(){
      var code = $('#credit-code').val().trim();
      var driverNum = ${logined.memberNum};
      if(code.length==0)
      {
         alert('코드를 정확히 입력해주세요.');
         return;
      }
      location.href="${path}/driver/updateDriverCredit?"
   }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>