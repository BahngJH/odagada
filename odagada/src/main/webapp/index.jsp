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
	.div-search{
		margin:20px;
	}
	button.btn-search{
		background-color:rgb(0, 175, 76);
	}
	img.main-img{
		width:100%;
		height:600px;
	}
	div.main-div{
		opacity:0.8;
	}
</style>
	<div class="row">
		<div class="col-12">
			<div class="card bg-dark text-white main-div">
			  <img class="card-img main-img" src="${path }/resources/images/main_img.jpg">
			  <div class="card-img-overlay">
			    <div class="row">
					<div class="col-12">
						<form action="${path }/carpool/searchEnd.do" method="post" id="search-form" onsubmit="return validate()">
							<div class="row">
								<div class="col-12">
									<div class="input-group">
										<input type="text" class="form-control div-search" name="startSearch" id="startSearch" placeholder="출발지"/>
										<input type="text" class="form-control div-search" name="endSearch" id="endSearch" placeholder="도착지"/>
										<input type="datetime-local" class="form-control div-search" name="startDate" id="startDate"/>
										<span class="input-group-btn">
											<button class="btn btn-secondary div-search btn-search" type="button" id="btn_search" onclick="search();">검색</button>
										</span>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			  </div>
			</div>
		</div>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>