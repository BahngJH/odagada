<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,com.spring.odagada.member.model.vo.*,com.spring.odagada.driver.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	Member m = (Member) request.getAttribute("logined");
	System.out.println(m);

%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
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

  div#enroll-container{width:400px; margin:0 auto;}
  div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
  .menu{text-align:center; font-weight:bold;}
  .info{margin-top:50px; margin-bottom: 50px;}
  #answer{height:50%;}
  section.container{
  	font-family: S-CoreDream-3Light;
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
            <a class="list-group-item list-group-item-action active" class="list-group-item list-group-item-action">드라이버 정보 관리</a>
            <a href="${path }/driver/driverCarpool" id="driverCarpool" class="list-group-item list-group-item-action">드라이버 카풀 등록 내역</a>
         </div>
      </div>
      
      <div class="col-12 col-md-9" id="enroll-container">   
         <div class="info col-12 col-sm-12 col-md-9">
         <c:set value="${driver}" var="d"/>         
         <div id ="row">
         	<div id="col">
         	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			  <div class="carousel-inner">
				  <c:forEach items="${carImg}" var="c" varStatus="t">					    
					  <div class="carousel-item ${c.active}">
						  	<img class="d-block w-100" style="width: 500px;height: 350px;" src="${path }/resources/upload/car/${c.CARIMAGERE}" >
					  </div>
				  </c:forEach>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">이전</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">다음</span>
			  </a>
			</div>
			</div>
		</div>
         
         
           <%-- <img class="img-thumbnail mx-auto d-block" src="${path }/resources/upload/profile/${logined.profileImageRe}" alt="Card image cap"> --%>
            <div class="card-group">
               <div class="card">
               <c:if test="${d.DRIVERSTATUS eq 'Y'}">
               	<table class="table table-hover">
               		<tr>
                      <th scope="row">운전 면허 번호</th>
				      <td colspan="2"><c:out value="${licenseNum}"></c:out></td>  
				    </tr>
				    <tr> 
					   <th scope="row">자동차 모델</th>
				       <td colspan="2"><c:out value="${d.CARMODEL}"></c:out></td>
				    </tr>
				    <tr>
				       <th scope="row">자동차 번호</th>
			     	   <td colspan="2"><c:out value="${d.CARNUM }"/></td>
				    </tr>
				    <tr>
				    	<th scope="row">내 드라이버 머니</th>
				    	<th colspan="2"><c:out value="${d.MONEY}"/></th>
				    </tr>
				    <tr>
				       <th scope="row">내게 달린 리뷰</th>
			     	   <td colspan="2"><input type="button" value="리뷰보기" id='btn-reviewView' class='btn btn-success re-btn' onclick="location.href='${path}/community/reviewView.do?memberNum=${logined.memberNum}&writerName=${list.MEMBERNAME }&writerId=${logined.memberId }';"/></td>
				    </tr>		
				</table>
				<div class="row">
					<div class="col-md-6 offset-md-3 text-center">
						<button type="button" class="btn btn-outline-success" onclick="location.href='${path}/member/myDriverModify'">정보 변경</button>
				 		<button type="button" class="btn btn-outline-success" onclick="javascript:location.href='${path}/driver/driverWithdrawal?memberNum=${driver.MEMBERNUM}';">드라이버 탈퇴</button>
					</div>
				</div>
					
				</c:if>
				<c:if test="${driver.DRIVERSTATUS eq 'N'}">
					<div class="card-body">
						<h4 class="card-title">승인 대기중</h4>
						<p class="card-text">관리자가 아직 승인을 하지않았습니다, 기다려주세요.</p>
					</div>
				</c:if>
				<c:if test="${driver.DRIVERSTATUS == null}">
					<div class="card-body">
						<h4 class="card-title">드라이버 미등록</h4>
						<p class="card-text">드라이버 이용하려면, 드라이버 가입해주세요.</p>
					</div>
				</c:if>
					</div>
				</div>		
			</div>
		</div>
	</div>
	
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>