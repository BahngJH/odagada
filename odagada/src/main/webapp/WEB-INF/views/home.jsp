<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="pageTitle"/>
</jsp:include>
<style>
section.container-fluid div{
	border:1px solid rgb(230,230,230);
	margin:2px;
}
img.img-size{
	width:100px;
	height:100px;
	margin:100px;
}
</style>
<section class="container-fluid">
<!-- 배경이미지 -->
	<div class="row">
		<div class="col-12 ">
			<div class="main-div">
				<form action="${path }/carpool/searchEnd.do" method="post" id="search-form" onsubmit="return validate()">
				<div class="row">
					<div class="col-12">
						<div class="input-group">
							<input type="text" class="form-control div-search" name="startSearch" id="startSearch" placeholder="출발지" readonly/>
							<input type="text" name="startLon" id="startLon" value="" hidden/>
							<input type="text" name="startLat" id="startLat" value="" hidden/>
							<input type="text" name="kmNum" id="kmNum" value="3" hidden/>
							<input type="button" class="btn btn-outline-success road-btn" onclick="sample6_execDaumPostcode1()" value="출발지 검색">
							<br>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="input-group">
							<input type="text" class="form-control div-search" name="endSearch" id="endSearch" placeholder="도착지" readonly/>
							<input type="hidden" name="endLon" id="endLon" value=""/>
							<input type="hidden" name="endLat" id="endLat" value=""/>
							<input type="button" class="btn btn-outline-success road-btn" onclick="sample6_execDaumPostcode2()" value="도착지 검색"><br>
						</div>
					</div>
				</div>
				<div class="row">
			        <div class="col-sm-12">
			            <div class="form-group">
			                <div class="input-group date div-search" id="datetimepicker1" data-target-input="nearest">
			                    <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" name="startDate" id="startDate"/>
			                    <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
			                        <div class="input-group-text div-icon" ><i class="fa fa-calendar" ></i></div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
				<div class="row">
				 	<div class="col-sm-12">
						<div class="input-group-btn">
							<button class="btn btn-success div-search btn-search" type="button" id="btn_search" onclick="search();">검색</button>
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
						<%-- <c:if test="${ }"> --%> <!-- 드라이버가 아니면 status N -->
							<button class="btn btn-success">드라이버 신청</button>
						<%-- </c:if> --%>
						<%-- <c:if test="${ }"> --%> <!-- 드라이버가 맞을 경우 Y -->
							<button class="btn btn-success">카풀 등록</button>
						<%-- </c:if> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 자주가는 경로 -->
	<div class="row">
		<div class="col-12">
			<div class="row">
				<div class="col-10 offset-2">
					<h3>같이탈래....?</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-12 col-md-3 offset-md-1">
					<div class="card text-white bg-success mb-3 text-center">
						<span>
							출발지
							<i class="far fa-arrow-alt-circle-right"></i>
							도착지
						</span>
					</div>
				</div>
				<div class="col-12 col-md-3 offset-md-1">
					<div class="card text-white bg-success mb-3 text-center">
						<span>
							출발지
							<i class="far fa-arrow-alt-circle-right"></i>
							도착지
						</span>
					</div>					
				</div>
				<div class="col-12 col-md-3 offset-md-1">
					<div class="card text-white bg-success mb-3 text-center">
						<span>
							출발지
							<i class="far fa-arrow-alt-circle-right"></i>
							도착지
						</span>
					</div>				
				</div>
			</div>
		</div>
	</div>
<!-- 우리 카풀 장점 -->
	<div class="row">
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
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>