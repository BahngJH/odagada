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

  div#enroll-container{width:400px; margin:0 auto;}
  div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
  .menu{text-align:center; font-weight:bold;}
  .info{margin-top:50px; margin-bottom: 50px;}
  #answer{height:50%;}
  
</style>

<section class="container">
   <div class="row">

      <div class="col-12 col-md-4">
         <div class="menu_list info list-group">
            <a href="${path }/member/myInfo.do" class="list-group-item list-group-item-action">회원 정보 관리</a>
            <a class="list-group-item list-group-item-action active" class="list-group-item list-group-item-action">드라이버 정보 관리</a>
            <a href="${path }/member/myCarpool" class="list-group-item list-group-item-action">카풀 내역</a>
         </div>
      </div>
      
      <div class="col-12 col-md-8" id="enroll-container">   
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
				</table>
				<div class="row">
					<div class="col-md-6 offset-md-3 text-center">
						<button type="button" class="btn btn-outline-success" onclick="location.href='${path}/member/myDriverModify'">정보 변경</button>
				 		<button type="button" class="btn btn-outline-success">회원 탈퇴</button>
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