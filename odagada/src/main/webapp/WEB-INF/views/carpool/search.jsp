<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
 <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bke78s7eut"></script>
 <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bke78s7eut&submodules=geocoder"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<style>
	.div-search{
		margin:20px;
	}
	button.btn-search{
		background-color:rgb(0, 175, 76);
		align-items: center;
	}
</style>
<section class="container">
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">
			<form action="${path }/carpool/searchEnd.do" method="post" id="search-form" onsubmit="return validate()">
				<div class="row">
					<div class="col-12">
						<div class="input-group">
							<input type="text" class="form-control div-search" name="startSearch" id="startSearch" placeholder="출발지"/>
						</div>
						<div class="input-group">
							<input type="text" class="form-control div-search" name="endSearch" id="endSearch" placeholder="도착지"/>
						</div>
						<div class="input-group">
							<input type="datetime-local" class="form-control div-search" name="startDate" id="startDate"/>
						</div>
						<div class="input-group-btn">
							<button class="btn btn-secondary div-search btn-search" type="button" id="btn_search" onclick="search();">검색</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-3"></div>
	</div>
</section>

<script>
function validate(){
	return true;
}
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
	$('#search-form').submit();
}

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>