<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@page import="java.util.*,com.spring.odagada.carpool.model.vo.Carpool"%>
<%
	List<Carpool> cList = (List)request.getAttribute("cList");
	Carpool cp=new Carpool();
%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<style>
	input.search-div{
		margin:13px;
	}
	input#start-date{
		display:none;
	}
	button#btn-reset{
	    height: 38px;
    	margin-top: 12px;	
	}
	span.icon-right{
		margin-top:15px;
	}
	span.span-option{
		float:right;
	}
	h5.h5-icon{
		color:darkgray;
	}
	img.driver-profile{
		width:70px;
		height:70px;
		border-radius: 100px;
	}
	.col-text{
		color:black;
	}
	span.span_city{
		font-size:10px;
		color:black;
	}
	div#option_flex{
		position:fixed;
	}
	button.start-search{
		float:right;
	}
</style>
<section id="container">
	<div class="row">
		<div class="col-12 col-md-2"></div>
		<div class="col-12 col-md-8">
			<div class="input-group">
				<input class="form-control search-div" type="text" placeholder="출발지" value="${startSearch }" readonly>
				<span class="fas fa-arrow-right fa-2x icon-right"></span>
				<input class="form-control search-div" type="text" placeholder="도착지" value="${endSearch }" readonly>
				<input class="form-control search-div" type="datetime-local" name="start-date" id="start-date">
				<input type="text" class="form-control search-div" value="${startDate }" readonly>
			</div>
		</div>
		<div class="col-12 col-md-2"></div>
	</div>
	<hr>
	<div class="row">
		<div class="col-12 col-md-2"></div>
		<div class="col-12 col-md-3">
			<div class="row">
				<div class="col-12">
					<div class="card "  id="option_flex">
						<div class="card-body">
	    					<h4 class="card-title">옵션(option)</h4>
	    					<hr>
	    					<div class="row">
								<div class="col-6" >
									<label>애완동물 <input type="checkbox" name="animal" id="animal" value="Y" /></label>
								</div>
								<div class="col-6" >
									<label>흡연 <input type="checkbox" name="smoking" id="smoking" value="Y"/></label>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label>미성년 <input type="checkbox" name="teenage" id="teenage" value="Y" /></label>
								</div>
								<div class="col-6">
									<label>대화 <input type="checkbox" name="talking" id="talking" value="Y" /></label>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label>노래 <input type="checkbox" name="music" id="music" value="Y" /></label>
								</div>
								<div class="col-6">
									<label>음식 섭취 <input type="checkbox" name="food" id="food" value="Y" /></label>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									<label>짐 수납 <input type="checkbox" name="baggage" id="baggage" value="Y" /></label>
								</div>
							</div>
							<div class="row">
								<div class="col-6">
									성별
									<select name="gender" id="gender" class="form-control">
										<option value="A">무관</option>
										<option value="F">여</option>
										<option value="M">남</option>
									</select>
								</div>
								<div class="col-6">
									좌석수 <input type="number" class="form-control" name="seatcount" id="seatcount" min="1" max="11" placeholder="최소 1개"/>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<button class="btn btn-success search-div start-search" id='btn-reset' onclick="start-search">검색</button>
								</div>
							</div>
						</div>
					</div>
				 </div>
			</div>
		</div>
		<!-- 검색 결과만큼 출력 -->
		<div class="col-12 col-md-5" id="result-search">
			<!-- 조건만큼 검색 결과 출력 -->
			<c:forEach items="${cList}" var="c">
				<form method="post" action="${path}/carpool/oneSearch.do?carpoolnum=1" id="form-onecar">
					<div id="div-pick" class="card border-success mb-3" onclick="onecar()">
					  <div class="card-body text-success">
					    <div class="row">
					    	<div class="col-6">
					    	 <span class="span_city">${c.startDate }</span><br>
					    		<span class="badge badge-primary">출발</span><br>
					    		<span class="span_city">${c.startCity}${c.startDetail }</span><br>
						    		<h5 class="fas fa-arrow-down fa-2x h5-icon"></h5><br>
					    		<span class="badge badge-success">도착</span><br>
					    		<span class="span_city">${c.endCity}${c.endDetail }</span> <br>
				    		</div>
					    	<div class="col-6">
					    		<div class="row">
					    			<div class="col-12">
					    				<span class="span-option col-text">${c.pay}</span>
					    			</div>
					    		</div>
					    		<div class="row">
					    			<div class="col-12">
					    				<span class="span-option">
					    					<img class="driver-profile" src="${path }/resources/images/ilhoon2.jpg"/>
					    					<%-- <p class="col-text">${d.MEMBERNUM }</p> --%>
					    				</span>
					    			</div>
					    		</div>
					    	</div>
					    </div>
					  </div>
					  <div class="row">
					  	<div class="col-12">
					  		<span class="span-option">설정옵션</span>
					  	</div>
					  </div>
					</div>
				</form>
			</c:forEach>
		</div>
		<div class="col-12 col-md-2"></div>
	</div>
</section>
<script>
function validate(){
	return true;
}
function onecar(){
	$("#form-onecar").submit();
}

$(function(){
	function start-search(){
		var animal,smoking,teenage,talking,music,gender,food,bagage,seatcount;
		$.ajax({
			url:"${path}/carpool/searchOption",
			data:{"animal":$('#animal').val(),
				"smoking",$('#smoking').val(),
				"teenage":$('#teenage').val(),
				"talking":$('#talking').val(),
				"music":$('#music').val(),
				"gender":$('#gender'),val(),
				"food":$('#food').val(),
				"bagage":$('#bagage').val(),
				"seatcount":$('#seatcount').val()
			},
			dataType:"html",
			success:function(data){
				$('#result-search')
			}
		}); 
	}
	
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
