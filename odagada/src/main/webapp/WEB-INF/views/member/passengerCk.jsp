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
img.profile-img{
border-radius: 30px;
width:70px;
height:70px;
}
div.img-div{
margin-left:3%;
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
      <div class="col-12 col-md-9">
         <div class="row">
            <div class="col-12">
               <div class="card">
                  <div class="card-header">
                     <h3>탑승 중인 승객</h3>
                  </div>
                  <div class="card-body">
					<c:if test="${dList != null }">
						<c:forEach items="${dList}" var="d" varStatus="count">
							<c:if test='${d.STATUS eq "Y"}'>
								<div class="img-div">
									<img src="${path }/resources/upload/profile/${dList.get(count.index).PROFILEIMAGERE}" class="profile-img">
									<p>${dList.get(0).MEMBERNAME }</p>
								</div>
							</c:if>
						</c:forEach>
					</c:if>
<!-- 					<div class="card-body text-center">
					   <p>탑승중인 승객이 없습니다.</p>
					</div> -->
                  </div>
               </div>
            </div>
         </div>
         <hr>
         <div class="row">
            <div class="col-12">
               <div class="card">
                  <div class="card-header">
                     <h3>탑승 신청한 승객</h3>
                  </div>
                  <div class="card-body">
                     <div class="row">
                        <c:if test="${dList != null }">
                           <c:forEach items="${dList}" var="d" varStatus="count">
                              <c:choose>
                                 <c:when test='${d.STATUS eq "N"}'>
                                    <div class="col-12 col-md-4">
                                       <div class="card text-center">
                                          <div class="row">
                                             <div class="col-12">
                                                <div class="img-div">
                                                   <img src="${path }/resources/upload/profile/${d.PROFILEIMAGERE}" class="profile-img">
                                                   <p>${d.MEMBERNAME }</p>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </c:when>
                                 <c:otherwise>
<!--                                     <div class="card-body text-center">
                                       <p>탑승신청한 승객이 없습니다.</p>
                                    </div> -->
                                 </c:otherwise>
                              </c:choose>
                           </c:forEach>
                        </c:if>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   
   
   
   <!-- <button class="credit-btn"  data-toggle="modal" data-target="#credit">결제 코드 입력</button> -->
   <!--번호 받기 -->
   <div class="modal fade" id="credit" tabindex="-1" role="dialog" aria-labelledby="creditModalLabel" aria-hidden="true">
     <div class="modal-dialog" role="document">
       <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="exampleModalLabel">결제 코드 입력</h5>                    
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </button>
         </div>
         <div class="modal-body" id="ttMessage-div">
             <div class="form-group">
               <label for="answer" class="form-control-label">결제 코드를 입력해주세요.</label>
             </div>
              <div class="modal-body">
                <div class="form-group">
                  <input type="text" class="form-control" id="credit-code" name="credit-code" style="resize: none;">
                </div>
            </div>
         </div>
         <div class="modal-footer">
           <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
           <button type="button" class="btn btn-primary" id="credi-ok" onclick="updateCredit();">코드 입력</button>                       
         </div>
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