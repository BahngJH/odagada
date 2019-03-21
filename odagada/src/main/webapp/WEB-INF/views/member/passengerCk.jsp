<<<<<<< HEAD
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
height:100%;
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
div#start{
margin-top:20px;
}
button.credit-btn{
text-decoration: none;
border:none;
width:120px;
height:30px;
border-radius: 25px;
background-color:rgb(0,175,176);
color:white;
float:right;
margin-right:2%;
}
button.credit-btn:hover{
   background-color:rgba(50,50,50,0.7);
}
.profile-img {
  position: relative;
  width: 130px;
  height: 120px;
  border-radius: 50% / 10%;
  color: white;
  text-align: center;
  text-indent: .1em;
}
.profile-img:before {
  content: '';
  position: absolute;
  top: 10%;
  bottom: 10%;
  right: -5%;
  left: -5%;
  background: inherit;
  border-radius: 5% / 50%;
}
div.tag-div{
width: 0;
height: 0;
border-top: 20px solid #FFCD12;
border-right: 20px solid transparent;
}
div.tagN-div{
width: 0;
height: 0;
border-top: 20px solid rgb(100,100,100);
border-right: 20px solid transparent;
}
div.nSub-div{
margin:7%;
}
div.pSub-div{
margin-left:10px;
}
div.check-div{
margin-bottom:10px;
}
/* 테이블 스크롤 */
table.table-responsive tbody tr td div.nsAll-div1{
width:300px;
}
div.rc-div{
background-color:rgb(240,240,240);
}
/* Y-div */
div.yes-div{
border:1px solid rgb(0,175,76);
width:300px;
}
div.rcFloat-div{
float:left;
}
div.in-div{
margin-left:13px;
}
</style>
<section class="container">
   <div class="row">
       <div class="col-12 col-md-3 mem-div">
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
      <!-- 탑승 내역 -->
      <div class="col-12 col-md-9" id="start">
         <div class="row">
            <div class="col-12">
               <div class="card">
                  <div class="card-header">
                  	<c:set value="0" var="t"/>
                  	<fmt:parseNumber value="${t}" type="number" var="tt"/>
                  	<c:set value="0" var="c"/>
                  	<fmt:parseNumber value="${t}" type="number" var="cc"/>
                     <h3><b>탑승 중인 승객</b>(
	                     <c:forEach items='${dList }' var="d" varStatus="count">
	                     	<c:if test='${d.PSTATUS eq  "Y"}'>
	                     		<c:set value="${tt+1 }" var="tt"/>
	                     	</c:if>
	                     	<c:set value="${d.SEATCOUNT }" var="cc"/>
	                     </c:forEach>
	                     <c:out value="${tt}"/>
	                     /<c:out value="${cc}"/>)
	                  </h3>
                  </div>
                  <div class="card-body">
                  	<div class="row">
                  		<div class="col-12 nAll-div"> <!-- 크기 지정해주기 -->
							<table class='table table-responsive'>
								<tr>
				                  	<c:set var='size_Y' value='0'/>
									<fmt:parseNumber value="${size_Y}" type="number" var="si_Y"/>
									<c:if test="${dList != null }">
										<c:forEach items="${dList}" var="d" varStatus="count">
											<c:if test='${d.PSTATUS eq "Y"}'>
											<c:set value="${si_Y + 1 }" var="si_Y"/>
												<td>
													<div> <!-- 세부크기지정해주기 -->
														<div class="card yes-div">
															<div class="row">
																<div class="col-12 text-center">
																   <div class="nSub-div">
																      <img src="${path }/resources/upload/profile/${d.PROFILEIMAGERE}" class="profile-img">
																   </div>
																   <hr>
																</div>
																<div class="col-12 pSub-div">
																	<div class="tag-div"></div>
																	<div class="in-div">
																		<p><b>아이디:&nbsp;</b>${d.MEMBERID }</p>
																		<p><b>이름:&nbsp;</b>${d.MEMBERNAME }</p>
																		<p><b>생년월일:&nbsp;</b>${d.BIRTH }</p>
																		<p><b>성별:&nbsp;</b>
																			<c:choose>
																				<c:when test='${d.GENDER == "M"}'>
																					남
																				</c:when>
																				<c:otherwise>
																					여
																				</c:otherwise>
																			</c:choose>
																		</p>
																		<p><b>전화번호:&nbsp;</b>${d.PHONE}</p>
																		<p><b>Email:&nbsp;</b>${d.EMAIL }</p>
																	</div>
																</div>
																<div class="col-12 text-center check-div">
																	<span>
																		<button class="btn btn-success" onclick="moveChatting(${d.PMEMBERNUM})">채팅하기</button>
																		<c:if test='${d.PAYSTATUS eq "N" }'>
																			<button class="btn btn-warning credit-id" data-toggle="modal" data-target="#credit" value='${d.PMEMBERNUM }'>결제 받기</button>
																		</c:if>
																		<c:if test='${d.PAYSTATUS eq "Y" }'>
																			<button class="btn btn-success">결제 완료</button>
																		</c:if>
															 		</span>
																</div>
															</div>
														</div>
													</div>
												</td>
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${dList[0]==null || si_Y==0}">
										<div class="col-12 text-center">
											<p>탑승 중인 승객이 없습니다.</p>
										</div>
									</c:if>
								</tr>
							</table>
                        </div>
					</div>
                  </div>
               </div>
            </div>
         </div>
         <hr>
         <div class="row">
            <div class="col-12">
               <div class="card">
                  <div class="card-header">
                     <h3><b>탑승 신청한 승객</b></h3>
                  </div>
                  <div class="card-body">
                     <div class="row">
                     	<div class="col-12 nAll-div"> <!-- 크기 지정해주기 -->
							<table class='table table-responsive'>
								<tr>
									<c:set var='size_N' value='0'/>
									<fmt:parseNumber value="${size_N}" type="number" var="si_N"/>
									<c:if test="${dList != null }">
										<c:forEach items="${dList}" var="d" varStatus="count">
											<c:choose>
												<c:when test='${d.PSTATUS eq "N"}'>
												<c:set value="${si_N + 1 }" var="si_N"/>
													<td>
														<div class="nsAll-div1"> <!-- 세부크기지정해주기 -->
															<div class="card">
																<div class="row">
																	<div class="col-12 text-center">
																	   <div class="nSub-div">
																	      <img src="${path }/resources/upload/profile/${d.PROFILEIMAGERE}" class="profile-img">
																	   </div>
																	   <hr>
																	</div>
																	<div class="col-12 pSub-div">
																		<div class="tag-div"></div>
																		<div class="in-div">
																			<p><b>아이디:&nbsp;</b>${d.MEMBERID }</p>
																			<p><b>이름:&nbsp;</b>${d.MEMBERNAME }</p>
																			<p><b>생년월일:&nbsp;</b>${d.BIRTH }</p>
																			<p><b>성별:&nbsp;</b>
																				<c:choose>
																					<c:when test='${d.GENDER == "M"}'>
																						남
																					</c:when>
																					<c:otherwise>
																						여
																					</c:otherwise>
																				</c:choose>
																			</p>
																			<p><b>전화번호:&nbsp;</b>${d.PHONE}</p>
																			<p><b>Email:&nbsp;</b>${d.EMAIL }</p>
																		</div>
																	</div>
																	<div class="col-12 text-center check-div">
																		<span>
																			<button class="btn btn-success" onclick="pasOk('${d.PMEMBERNUM} ${d.MEMBERNAME }');">승락</button>
																	   		<button class="btn btn-warning" onclick="pasNo('${d.PMEMBERNUM} ${d.MEMBERNAME }');">거절</button>
																 		</span>
																	</div>
																</div>
															</div>
														</div>
													</td>
												</c:when>
											</c:choose>
										</c:forEach>
									</c:if>
									<c:if test="${dList[0]==null || si_N==0 }">
										<div class="text-center">
											<p>신청 내역이 없습니다.</p>
										</div>
									</c:if>
								</tr>
							</table>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <hr>
         <!-- 거절 및 취소 승객 -->
         <div class="row">
         	<div class="col-12">
         		<div class="card">
         			<div class="card-header">
         				<h3><b>거절한 승객 / 결제 취소한 승객</b></h3>
         			</div>
         			<div class="card-body">
                     <div class="row">
                     	<div class="col-12 nAll-div"> <!-- 크기 지정해주기 -->
							<table class='table table-responsive'>
								<tr>
		         					<c:set value="0" var="size_RC"/>
		         					<fmt:parseNumber value="${size-RC}" type="number" var="si_RC"/>
		         					<c:if test="${dList !=null }">
		         						<c:forEach items="${dList }" var="d">
			         						<c:choose>
			         							<c:when test="${d.PSTATUS eq 'R' }">
			         								<c:set var="si_RC" value="${si_RC + 1 }"/>
			         								<td>
					         							<div class="nsAll-div1"> <!-- 세부크기지정해주기 -->
															<div class="card">
																<div class="row">
																	<div class="col-12 text-center">
																	   <div class="nSub-div">
																	      <img src="${path }/resources/upload/profile/${d.PROFILEIMAGERE}" class="profile-img">
																	   </div>
																	   <hr>
																	</div>
																	<div class="col-12 pSub-div">
																		<div class="tagN-div"></div>
																		<div class="in-div">
																			<p><b>아이디:&nbsp;</b>${d.MEMBERID }</p>
																			<p><b>이름:&nbsp;</b>${d.MEMBERNAME }</p>
																			<p><b>생년월일:&nbsp;</b>${d.BIRTH }</p>
																			<p><b>성별:&nbsp;</b>
																				<c:choose>
																					<c:when test='${d.GENDER == "M"}'>
																						남
																					</c:when>
																					<c:otherwise>
																						여
																					</c:otherwise>
																				</c:choose>
																			</p>
																			<p><b>전화번호:&nbsp;</b>${d.PHONE}</p>
																			<p><b>Email:&nbsp;</b>${d.EMAIL }</p>
																		</div>
																	</div>
																	<div class="col-12 text-center check-div">
																		<span>
																			<button class="btn btn-danger">승차거절</button>
																 		</span>
																	</div>
																</div>
															</div>
					         							</div>
				         							</td>
				         							</c:when>
				         							<c:when test="${d.PSTATUS eq 'C' }">
				         								<c:set var="si_RC" value="${si_RC + 1 }"/>
				         								<td>
					         								<div class="nsAll-div1"> <!-- 세부크기지정해주기 -->
																<div class="card">
																	<div class="row">
																		<div class="col-12 text-center">
																		   <div class="nSub-div">
																		      <img src="${path }/resources/upload/profile/${d.PROFILEIMAGERE}" class="profile-img">
																		   </div>
																		   <hr>
																		</div>
																		<div class="col-12 pSub-div">
																			<div class="tagN-div"></div>
																				<div class="in-div">
																					<p><b>아이디:&nbsp;</b>${d.MEMBERID }</p>
																					<p><b>이름:&nbsp;</b>${d.MEMBERNAME }</p>
																					<p><b>생년월일:&nbsp;</b>${d.BIRTH }</p>
																					<p><b>성별:&nbsp;</b>
																						<c:choose>
																							<c:when test='${d.GENDER == "M"}'>
																								남
																							</c:when>
																							<c:otherwise>
																								여
																							</c:otherwise>
																						</c:choose>
																					</p>
																					<p><b>전화번호:&nbsp;</b>${d.PHONE}</p>
																					<p><b>Email:&nbsp;</b>${d.EMAIL }</p>
																				</div>
																		</div>
																		<div class="col-12 text-center check-div">
																			<span>
																				<button class="btn btn-danger">결제취소</button>
																	 		</span>
																		</div>
																	</div>
																</div>
						         							</div>
					         							</td>
				         							</c:when>
			         							</c:choose>
		         						</c:forEach>
		         					</c:if>
		       						<c:if test="${dList[0]==null || si_RC==0 }">
										<div class="text-center">
											<p>신청 내역이 없습니다.</p>
										</div>
									</c:if>
								</tr>
							</table>
                        </div>
                     </div>
                  </div>
         		</div>
         	</div>
         </div>
      </div>
   </div>
	<input type="hidden" value="${dList.get(0).CARPOOLNUM }" id="carpoolNum" name="carpoolNum"/>
	<input type="hidden" value="${dList.get(0).CMEMBERNUM }" id="driverNum" name="driverNum"/>
	<input type="hidden" value="${dList.get(0).PAY }" id="pay" name="pay"/>
	<!--번호 받기 -->
	<div class="modal fade" id="credit" tabindex="-1" role="dialog" aria-labelledby="creditModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel"><b>결제 코드 입력</b></h4>                    
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="ttMessage-div">
					<div class="row">
						<div class="col-12 text-center"><p>결제 코드를 입력해주세요.</p></div>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-12">
								<input type="text" class="form-control" id="credit-code" name="credit-code" style="resize: none;">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-info" id="credi-ok" onclick="updateCredit();">결제</button>
					<script>
					function updateCredit(){
						var paycode=$('#credit-code').val().trim();
						var passengerNum = mNum;
						var carpoolNum=$('#carpoolNum').val();
						var driverNum=$('#driverNum').val();
						var pay=$('#pay').val();
						if(paycode.length==0)
						{
							alert('코드를 정확히 입력해 주세요.');
						}
						else{
							$.ajax({
								url:"${path}/driver/updateDriverCredit",
								data:{"carpoolNum":carpoolNum,
									"passengerNum":passengerNum,
									"paycode":paycode,
									"driverNum":driverNum,
									"pay":pay
								},
								type:"post",
								success:function(data){
									console.log(data);
									if(data==='Y'){
										alert('결제를 완료하였습니다.');
										location.href="${path}/driver/selectDriverPas?driverNum="+driverNum+"&carpoolNum="+carpoolNum+"&sta=Y";
									}
									else{
										alert('결제에 실패하였습니다. 다시 시도해주세요.');
										return;
									}
								}
							});
						}
						
					}
					</script>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
var mNum;
$('.credit-id').on('click',function(){
	mNum=this.value;
	console.log(mNum);
});
<!-- 채팅방 -->
   function moveChatting(chatUser)
   {
	   console.log(chatUser);
       location.href="${path}/community/createRoomClick.do?chatUser="+chatUser;
   }
/* 승차 수락  */
function pasOk(e){
	var tt=e.split(' ');
	var driverNum=$('#driverNum').val();
	var memberNum=tt[0];
	var memberName=tt[1];
	var carpoolNum=$('#carpoolNum').val();
	console.log("memberNum="+memberNum+" memberName="+memberName+" carpoolNum="+carpoolNum+" driverNum="+driverNum);
	if(${tt}==${cc}){
		alert('빈 좌석이 없습니다.');
		return;
	}
	if(!confirm("승차 수락하시겠습니까?")){
		 return;
	}
	else{
		location.href="${path}/driver/updatePasOk?memberNum="+memberNum+"&memberName="+memberName+"&carpoolNum="+carpoolNum+"&driverNum="+driverNum;	
	}
}
/* 승차 거부 */
function pasNo(e){
	var tt=e.split(' ');
	var driverNum=$('#driverNum').val();
	var memberNum=tt[0];
	var memberName=tt[1];
	var carpoolNum=$('#carpoolNum').val();
	console.log("memberNum="+memberNum+" memberName="+memberName+" carpoolNum="+carpoolNum+" driverNum="+driverNum);
	if(!confirm("승차 거부하시겠습니까?")){
		 return;
	}
	else{
		location.href="${path}/driver/updatePasNo?memberNum="+memberNum+"&memberName="+memberName+"&carpoolNum="+carpoolNum+"&driverNum="+driverNum;	
	}
}
</script>
  
=======
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
height:100%;
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
div#start{
margin-top:20px;
}
button.credit-btn{
text-decoration: none;
border:none;
width:120px;
height:30px;
border-radius: 25px;
background-color:rgb(0,175,176);
color:white;
float:right;
margin-right:2%;
}
button.credit-btn:hover{
   background-color:rgba(50,50,50,0.7);
}
.profile-img {
  position: relative;
  width: 130px;
  height: 120px;
  border-radius: 50% / 10%;
  color: white;
  text-align: center;
  text-indent: .1em;
}
.profile-img:before {
  content: '';
  position: absolute;
  top: 10%;
  bottom: 10%;
  right: -5%;
  left: -5%;
  background: inherit;
  border-radius: 5% / 50%;
}
div.tag-div{
width: 0;
height: 0;
border-top: 20px solid #FFCD12;
border-right: 20px solid transparent;
}
div.tagN-div{
width: 0;
height: 0;
border-top: 20px solid rgb(100,100,100);
border-right: 20px solid transparent;
}
div.nSub-div{
margin:7%;
}
div.pSub-div{
margin-left:10px;
}
div.check-div{
margin-bottom:10px;
}
/* 테이블 스크롤 */
table.table-responsive tbody tr td div.nsAll-div1{
width:300px;
}
div.rc-div{
background-color:rgb(240,240,240);
}
/* Y-div */
div.yes-div{
border:1px solid rgb(0,175,76);
width:300px;
}
div.rcFloat-div{
float:left;
}
div.in-div{
margin-left:13px;
}
</style>
<section class="container">
   <div class="row">
       <div class="col-12 col-md-3 mem-div">
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
      <!-- 탑승 내역 -->
      <div class="col-12 col-md-9" id="start">
         <div class="row">
            <div class="col-12">
               <div class="card">
                  <div class="card-header">
                     <c:set value="0" var="t"/>
                     <fmt:parseNumber value="${t}" type="number" var="tt"/>
                     <c:set value="0" var="c"/>
                     <fmt:parseNumber value="${t}" type="number" var="cc"/>
                     <h3><b>탑승 중인 승객</b>(
                        <c:forEach items='${dList }' var="d" varStatus="count">
                           <c:if test='${d.PSTATUS eq  "Y"}'>
                              <c:set value="${tt+1 }" var="tt"/>
                           </c:if>
                           <c:set value="${d.SEATCOUNT }" var="cc"/>
                        </c:forEach>
                        <c:out value="${tt}"/>
                        /<c:out value="${cc}"/>)
                     </h3>
                  </div>
                  <div class="card-body">
                     <div class="row">
                        <div class="col-12 nAll-div"> <!-- 크기 지정해주기 -->
                     <table class='table table-responsive'>
                        <tr>
                                 <c:set var='size_Y' value='0'/>
                           <fmt:parseNumber value="${size_Y}" type="number" var="si_Y"/>
                           <c:if test="${dList != null }">
                              <c:forEach items="${dList}" var="d" varStatus="count">
                                 <c:if test='${d.PSTATUS eq "Y"}'>
                                 <c:set value="${si_Y + 1 }" var="si_Y"/>
                                    <td>
                                       <div> <!-- 세부크기지정해주기 -->
                                          <div class="card yes-div">
                                             <div class="row">
                                                <div class="col-12 text-center">
                                                   <div class="nSub-div">
                                                      <img src="${path }/resources/upload/profile/${d.PROFILEIMAGERE}" class="profile-img">
                                                   </div>
                                                   <hr>
                                                </div>
                                                <div class="col-12 pSub-div">
                                                   <div class="tag-div"></div>
                                                   <div class="in-div">
                                                      <p><b>아이디:&nbsp;</b>${d.MEMBERID }</p>
                                                      <p><b>이름:&nbsp;</b>${d.MEMBERNAME }</p>
                                                      <p><b>생년월일:&nbsp;</b>${d.BIRTH }</p>
                                                      <p><b>성별:&nbsp;</b>
                                                         <c:choose>
                                                            <c:when test='${d.GENDER == "M"}'>
                                                               남
                                                            </c:when>
                                                            <c:otherwise>
                                                               여
                                                            </c:otherwise>
                                                         </c:choose>
                                                      </p>
                                                      <p><b>전화번호:&nbsp;</b>${d.PHONE}</p>
                                                      <p><b>Email:&nbsp;</b>${d.EMAIL }</p>
                                                   </div>
                                                </div>
                                                <div class="col-12 text-center check-div">
                                                   <span>
                                                      <button class="btn btn-success" onclick="moveChatting(${d.PMEMBERNUM})">채팅하기</button>
                                                      <c:if test='${d.PAYSTATUS eq "N" }'>
                                                         <button class="btn btn-warning credit-id" data-toggle="modal" data-target="#credit" value='${d.PMEMBERNUM }'>결제 받기</button>
                                                      </c:if>
                                                      <c:if test='${d.PAYSTATUS eq "Y" }'>
                                                         <button class="btn btn-success">결제 완료</button>
                                                      </c:if>
                                                    </span>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </td>
                                 </c:if>
                              </c:forEach>
                           </c:if>
                           <c:if test="${dList[0]==null || si_Y==0}">
                              <div class="col-12 text-center">
                                 <p>탑승 중인 승객이 없습니다.</p>
                              </div>
                           </c:if>
                        </tr>
                     </table>
                        </div>
               </div>
                  </div>
               </div>
            </div>
         </div>
         <hr>
         <div class="row">
            <div class="col-12">
               <div class="card">
                  <div class="card-header">
                     <h3><b>탑승 신청한 승객</b></h3>
                  </div>
                  <div class="card-body">
                     <div class="row">
                        <div class="col-12 nAll-div"> <!-- 크기 지정해주기 -->
                     <table class='table table-responsive'>
                        <tr>
                           <c:set var='size_N' value='0'/>
                           <fmt:parseNumber value="${size_N}" type="number" var="si_N"/>
                           <c:if test="${dList != null }">
                              <c:forEach items="${dList}" var="d" varStatus="count">
                                 <c:choose>
                                    <c:when test='${d.PSTATUS eq "N"}'>
                                    <c:set value="${si_N + 1 }" var="si_N"/>
                                       <td>
                                          <div class="nsAll-div1"> <!-- 세부크기지정해주기 -->
                                             <div class="card">
                                                <div class="row">
                                                   <div class="col-12 text-center">
                                                      <div class="nSub-div">
                                                         <img src="${path }/resources/upload/profile/${d.PROFILEIMAGERE}" class="profile-img">
                                                      </div>
                                                      <hr>
                                                   </div>
                                                   <div class="col-12 pSub-div">
                                                      <div class="tag-div"></div>
                                                      <div class="in-div">
                                                         <p><b>아이디:&nbsp;</b>${d.MEMBERID }</p>
                                                         <p><b>이름:&nbsp;</b>${d.MEMBERNAME }</p>
                                                         <p><b>생년월일:&nbsp;</b>${d.BIRTH }</p>
                                                         <p><b>성별:&nbsp;</b>
                                                            <c:choose>
                                                               <c:when test='${d.GENDER == "M"}'>
                                                                  남
                                                               </c:when>
                                                               <c:otherwise>
                                                                  여
                                                               </c:otherwise>
                                                            </c:choose>
                                                         </p>
                                                         <p><b>전화번호:&nbsp;</b>${d.PHONE}</p>
                                                         <p><b>Email:&nbsp;</b>${d.EMAIL }</p>
                                                      </div>
                                                   </div>
                                                   <div class="col-12 text-center check-div">
                                                      <span>
                                                         <button class="btn btn-success" onclick="pasOk('${d.PMEMBERNUM} ${d.MEMBERNAME }');">승락</button>
                                                            <button class="btn btn-warning" onclick="pasNo('${d.PMEMBERNUM} ${d.MEMBERNAME }');">거절</button>
                                                       </span>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                       </td>
                                    </c:when>
                                 </c:choose>
                              </c:forEach>
                           </c:if>
                           <c:if test="${dList[0]==null || si_N==0 }">
                              <div class="text-center">
                                 <p>신청 내역이 없습니다.</p>
                              </div>
                           </c:if>
                        </tr>
                     </table>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <hr>
         <!-- 거절 및 취소 승객 -->
         <div class="row">
            <div class="col-12">
               <div class="card">
                  <div class="card-header">
                     <h3><b>거절한 승객 / 결제 취소한 승객</b></h3>
                  </div>
                  <div class="card-body">
                     <div class="row">
                        <div class="col-12 nAll-div"> <!-- 크기 지정해주기 -->
                     <table class='table table-responsive'>
                        <tr>
                              <c:set value="0" var="size_RC"/>
                              <fmt:parseNumber value="${size-RC}" type="number" var="si_RC"/>
                              <c:if test="${dList !=null }">
                                 <c:forEach items="${dList }" var="d">
                                    <c:choose>
                                       <c:when test="${d.PSTATUS eq 'R' }">
                                          <c:set var="si_RC" value="${si_RC + 1 }"/>
                                          <td>
                                             <div class="nsAll-div1"> <!-- 세부크기지정해주기 -->
                                             <div class="card">
                                                <div class="row">
                                                   <div class="col-12 text-center">
                                                      <div class="nSub-div">
                                                         <img src="${path }/resources/upload/profile/${d.PROFILEIMAGERE}" class="profile-img">
                                                      </div>
                                                      <hr>
                                                   </div>
                                                   <div class="col-12 pSub-div">
                                                      <div class="tagN-div"></div>
                                                      <div class="in-div">
                                                         <p><b>아이디:&nbsp;</b>${d.MEMBERID }</p>
                                                         <p><b>이름:&nbsp;</b>${d.MEMBERNAME }</p>
                                                         <p><b>생년월일:&nbsp;</b>${d.BIRTH }</p>
                                                         <p><b>성별:&nbsp;</b>
                                                            <c:choose>
                                                               <c:when test='${d.GENDER == "M"}'>
                                                                  남
                                                               </c:when>
                                                               <c:otherwise>
                                                                  여
                                                               </c:otherwise>
                                                            </c:choose>
                                                         </p>
                                                         <p><b>전화번호:&nbsp;</b>${d.PHONE}</p>
                                                         <p><b>Email:&nbsp;</b>${d.EMAIL }</p>
                                                      </div>
                                                   </div>
                                                   <div class="col-12 text-center check-div">
                                                      <span>
                                                         <button class="btn btn-danger">승차거절</button>
                                                       </span>
                                                   </div>
                                                </div>
                                             </div>
                                             </div>
                                          </td>
                                          </c:when>
                                          <c:when test="${d.PSTATUS eq 'C' }">
                                             <c:set var="si_RC" value="${si_RC + 1 }"/>
                                             <td>
                                                <div class="nsAll-div1"> <!-- 세부크기지정해주기 -->
                                                <div class="card">
                                                   <div class="row">
                                                      <div class="col-12 text-center">
                                                         <div class="nSub-div">
                                                            <img src="${path }/resources/upload/profile/${d.PROFILEIMAGERE}" class="profile-img">
                                                         </div>
                                                         <hr>
                                                      </div>
                                                      <div class="col-12 pSub-div">
                                                         <div class="tagN-div"></div>
                                                            <div class="in-div">
                                                               <p><b>아이디:&nbsp;</b>${d.MEMBERID }</p>
                                                               <p><b>이름:&nbsp;</b>${d.MEMBERNAME }</p>
                                                               <p><b>생년월일:&nbsp;</b>${d.BIRTH }</p>
                                                               <p><b>성별:&nbsp;</b>
                                                                  <c:choose>
                                                                     <c:when test='${d.GENDER == "M"}'>
                                                                        남
                                                                     </c:when>
                                                                     <c:otherwise>
                                                                        여
                                                                     </c:otherwise>
                                                                  </c:choose>
                                                               </p>
                                                               <p><b>전화번호:&nbsp;</b>${d.PHONE}</p>
                                                               <p><b>Email:&nbsp;</b>${d.EMAIL }</p>
                                                            </div>
                                                      </div>
                                                      <div class="col-12 text-center check-div">
                                                         <span>
                                                            <button class="btn btn-danger">결제취소</button>
                                                          </span>
                                                      </div>
                                                   </div>
                                                </div>
                                                </div>
                                             </td>
                                          </c:when>
                                       </c:choose>
                                 </c:forEach>
                              </c:if>
                               <c:if test="${dList[0]==null || si_RC==0 }">
                              <div class="text-center">
                                 <p>신청 내역이 없습니다.</p>
                              </div>
                           </c:if>
                        </tr>
                     </table>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <input type="hidden" value="${dList.get(0).CARPOOLNUM }" id="carpoolNum" name="carpoolNum"/>
   <input type="hidden" value="${dList.get(0).CMEMBERNUM }" id="driverNum" name="driverNum"/>
   <input type="hidden" value="${dList.get(0).PAY }" id="pay" name="pay"/>
   <!--번호 받기 -->
   <div class="modal fade" id="credit" tabindex="-1" role="dialog" aria-labelledby="creditModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title" id="exampleModalLabel"><b>결제 코드 입력</b></h4>                    
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body" id="ttMessage-div">
               <div class="row">
                  <div class="col-12 text-center"><p>결제 코드를 입력해주세요.</p></div>
               </div>
               <div class="modal-body">
                  <div class="row">
                     <div class="col-12">
                        <input type="text" class="form-control" id="credit-code" name="credit-code" style="resize: none;">
                     </div>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
               <button type="button" class="btn btn-info" id="credi-ok" onclick="updateCredit();">결제</button>
               <script>
               function updateCredit(){
                  var paycode=$('#credit-code').val().trim();
                  var passengerNum = mNum;
                  var carpoolNum=$('#carpoolNum').val();
                  var driverNum=$('#driverNum').val();
                  var pay=$('#pay').val();
                  if(paycode.length==0)
                  {
                     alert('코드를 정확히 입력해 주세요.');
                  }
                  else{
                     $.ajax({
                        url:"${path}/driver/updateDriverCredit",
                        data:{"carpoolNum":carpoolNum,
                           "passengerNum":passengerNum,
                           "paycode":paycode,
                           "driverNum":driverNum,
                           "pay":pay
                        },
                        type:"post",
                        success:function(data){
                           console.log(data);
                           if(data==='Y'){
                              alert('결제를 완료하였습니다.');
                              location.href="${path}/driver/selectDriverPas?driverNum="+driverNum+"&carpoolNum="+carpoolNum+"&sta=Y";
                           }
                           else{
                              alert('결제에 실패하였습니다. 다시 시도해주세요.');
                              return;
                           }
                        }
                     });
                  }
                  
               }
               </script>
            </div>
         </div>
      </div>
   </div>
</section>
<script>
var mNum;
$('.credit-id').on('click',function(){
   mNum=this.value;
   console.log(mNum);
});
<!-- 채팅방 -->
   function moveChatting(chatUser)
   {
      console.log(chatUser);
       location.href="${path}/community/createRoomClick.do?chatUser="+chatUser;
   }
/* 승차 수락  */
function pasOk(e){
   var tt=e.split(' ');
   var driverNum=$('#driverNum').val();
   var memberNum=tt[0];
   var memberName=tt[1];
   var carpoolNum=$('#carpoolNum').val();
   console.log("memberNum="+memberNum+" memberName="+memberName+" carpoolNum="+carpoolNum+" driverNum="+driverNum);
   if(${tt}==${cc}){
      alert('빈 좌석이 없습니다.');
      return;
   }
   if(!confirm("승차 수락하시겠습니까?")){
       return;
   }
   else{
      location.href="${path}/driver/updatePasOk?memberNum="+memberNum+"&memberName="+memberName+"&carpoolNum="+carpoolNum+"&driverNum="+driverNum;   
   }
}
/* 승차 거부 */
function pasNo(e){
   var tt=e.split(' ');
   var driverNum=$('#driverNum').val();
   var memberNum=tt[0];
   var memberName=tt[1];
   var carpoolNum=$('#carpoolNum').val();
   console.log("memberNum="+memberNum+" memberName="+memberName+" carpoolNum="+carpoolNum+" driverNum="+driverNum);
   if(!confirm("승차 거부하시겠습니까?")){
       return;
   }
   else{
      location.href="${path}/driver/updatePasNo?memberNum="+memberNum+"&memberName="+memberName+"&carpoolNum="+carpoolNum+"&driverNum="+driverNum;   
   }
}
</script>
  
>>>>>>> branch 'master' of https://github.com/BahngJH/odagada
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>