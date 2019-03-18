<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@page import="java.util.*,com.spring.odagada.carpool.model.vo.Carpool"%>
<!-- 조건만큼 검색 결과 출력 -->
<c:forEach items="${coList}" var="c">
	<form method="post" action="${path}/carpool/oneSearch.do" id="form-onecar" onsubmit="return validate()">
		<div id="div-pick" class="card border-success mb-3 div-pick" onclick="return oneck();">
		  <div class="card-body text-success click">
			<input type="hidden" value="${c.CARPOOLNUM }" id="carpoolNum" name="carpoolNum"/>
			<input type="hidden" value="${c.SEATCOUNT }" id="seat" name="seat"/>
			<input type="hidden" value="${c.MEMBERNUM }" id="mem" name="mem"/>
    		<div class="row">
		    	<div class="col-6">
		    	 <span class="span_city">${c.STARTDATE }</span><br>
		    		<span class="badge badge-primary">출발</span><br>
		    		<span class="span_city">${c.STARTCITY}${c.STARTDETAIL }</span><br>
		    		<h5 class="fas fa-arrow-down fa-2x h5-icon"></h5><br>
		    		<span class="badge badge-success">도착</span><br>
		    		<span class="span_city">${c.ENDCITY}${c.ENDDETAIL }</span> <br>
		    		<input type="hidden" value="${search.startCity }" id="startCity" name="startCity"/>
		    		<input type="hidden" value="${search.endCity }" id="endCity" name="endCity"/>
		    		<input type="hidden" value="${search.startDate }" id="startDate" name="startDate"/>
	    		</div>
		    	<div class="col-6">
		    		<div class="row">
		    			<div class="col-12">
		    				<span class="span-option col-text">￦${c.PAY}</span>
		    			</div>
		    		</div>
		    		<div class="row">
		    			<div class="col-12">
		    				<span class="span-option">
		    					<img class="driver-profile" src="${path }/resources/upload/profile/${c.PROFILEIMAGERE}"/><br>
		    					<span class="driver-name">${c.MEMBERNAME }</span>
		    				</span>
		    			</div>
		    		</div>
		    	</div>
		    </div>
		  </div>
		  <hr style="margin:0px;">
		  <div class="row">
		  	<div class="col-12">
	  			<span class="span-option">
		  			<c:if test='${c.ANIMAL eq "Y"}'>
		  				<span><img src="${path }/resources/images/option-icon/animal.png" class="option-icon"></span>
		  			</c:if>
  					<c:if test='${c.SMOKING eq "Y"}'>
  						<span><img src="${path }/resources/images/option-icon/smoking.png" class="option-icon"></span>
					</c:if>
					<c:if test='${c.TEENAGE eq "Y"}'>
						<span><img src="${path }/resources/images/option-icon/teenage.png" class="option-icon"></span>
					</c:if>
					<c:if test='${c.TALKING eq "Y"}'>
						<span><img src="${path }/resources/images/option-icon/talking.png" class="option-icon"></span>
					</c:if>
					<c:if test='${c.MUSIC eq "Y"}'>
						<span><img src="${path }/resources/images/option-icon/music.png" class="option-icon"></span>
					</c:if>
					<c:if test='${c.FOOD eq "Y"}'>
						<span><img src="${path }/resources/images/option-icon/food.png" class="option-icon"></span>
					</c:if>
					<c:if test='${c.BAGGAGE eq "Y"}'>
						<span><img src="${path }/resources/images/option-icon/baggage.png" class="option-icon"></span>
					</c:if>
					<c:choose>
						<c:when test='${c.GENDER eq "A"}'>
						</c:when>
						<c:when test='${c.GENDER eq "F"}'>
							<span><img src="${path }/resources/images/option-icon/genderF.png" class="option-icon"></span>
						</c:when>
						<c:when test='${ c.GENDER eq "M"}'>
							<span><img src="${path }/resources/images/option-icon/genderM.png" class="option-icon"></span>
						</c:when>
					</c:choose>
		  		</span>
		  	</div>
		  </div>
		</div>
	</form>
</c:forEach>
<c:if test="${empty coList }">
	<div class="row">
		<div class="col-12 text-center">
			<div>
				<h2>검색결과가 없습니다.</h2>
			</div>
		</div>
	</div>
</c:if>
<script>
function validate(){
	return true;
};
function oneck(){
	$('#form-onecar').submit();	
}
$(function () {
 	$('.click').on("click",function(e){
		var carpoolNum=$(this).find('#carpoolNum').val();
		var seat=$(this).find('#seat').val();
		var mem=$(this).find('#mem').val();
		console.log(carpoolNum+" : "+seat+" : "+mem);
		document.getElementById("carpoolNum").value=carpoolNum;
		document.getElementById("seat").value=seat;
		document.getElementById("mem").value=mem;
	});

}); 

</script>