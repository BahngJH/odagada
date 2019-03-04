<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<style>
	div.search-div{
		margin:10px;
	}
	
</style>
<section id="container">
	<div class="row">
		<div class="col-12 col-md-2"></div>
		<div class="col-12 col-md-6">
			<div class="input-group search-div">
				<input class="form-control" type="text" placeholder="출발지 들어와">
				<div class="col-1">
					<span class="fas fa-arrow-right fa-3x"></span>
				</div>
				<input class="form-control" type="text" placeholder="도착지 들어와">
				<input class="form-control" type="datetime-local" placeholder="날짜 들어와">
			</div>
		</div>
		<div class="col-12 col-md-4"></div>
	</div>
	<hr>
	<div class="row">
		<div class="col-12 col-md-2"></div>
		<div class="col-12 col-md-3">
			<div class="row">
				<div class="col-12">
					<div class="card " style="width: 20rem;">
						<div class="card-body">
	    					<h4 class="card-title">옵션(option)</h4>
							<div class="form-check form-check-inline">
								동물:&nbsp;
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal1" value="Y"> 가능&nbsp;
							  	</label>
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal2" value="N"> 불가능
							  	</label>
							</div>
							<div class="form-check form-check-inline">
								흡연:&nbsp;
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal1" value="Y"> 가능&nbsp;
							  	</label>
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal2" value="N"> 불가능
							  	</label>
							</div>
							<div class="form-check form-check-inline">
								미성년자:&nbsp;
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal1" value="Y"> 가능&nbsp;
							  	</label>
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal2" value="N"> 불가능
							  	</label>
							</div>
							<div class="form-check form-check-inline">
								대화:&nbsp;
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal1" value="Y"> 가능&nbsp;
							  	</label>
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal2" value="N"> 불가능
							  	</label>
							</div>
							<div class="form-check form-check-inline">
								음악:&nbsp;
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal1" value="Y"> 가능&nbsp;
							  	</label>
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal2" value="N"> 불가능
							  	</label>
							</div>
							<div class="form-check form-check-inline">
								성별:&nbsp;
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal1" value="Y"> 남&nbsp;
							  	</label>
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal2" value="N"> 여&nbsp;
							  	</label>
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal1" value=""> 상관없음&nbsp;
							  	</label>
							</div>
							<div class="form-check form-check-inline">
								음식물 섭취:&nbsp;
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal1" value="Y"> 가능&nbsp;
							  	</label>
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal2" value="N"> 불가능
							  	</label>
							</div>
							<div class="form-check form-check-inline">
								수화물:&nbsp;
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal1" value="Y"> 가능&nbsp;
							  	</label>
							  	<label class="form-check-label">
							    	<input class="form-check-input" type="radio" name="animal" id="animal2" value="N"> 불가능
							  	</label>
							</div>
							<div class="form-check form-check-inline">
								좌석 수:&nbsp;
							</div>
						</div>
					</div>
				 </div>
			</div>
		</div>
		<!-- 검색 결과만큼 출력 -->
		<div class="col-12 col-md-5">
			<div class="card border-success mb-3" style="max-width: 40rem;">
			  <div class="card-body text-success">
			    
			  </div>
			  <div class="card-footer bg-transparent border-success">Footer</div>
			</div>
		</div>
		<div class="col-12 col-md-2"></div>
	</div>
</section>
<script>

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>