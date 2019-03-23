<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@page import="java.util.*,com.spring.odagada.carpool.model.vo.Carpool"%>
<!-- 조건만큼 검색 결과 출력 -->
<c:forEach items="${coList}" var="c" varStatus="count">
	<c:if test="${c.BLACKID ==null}">
		<form method="post" action="${path}/carpool/oneSearch.do" class='form-onecar'>
			<c:set value='${listSize+1 }' var="listSize"/>
			<div id="div-pick" class="card border-success mb-3 div-pick">
			  <div class="card-body text-success click">
				<input type="hidden" value="${c.CARPOOLNUM }" id="carpoolNum" name="carpoolNum"/>
				<input type="hidden" value="${c.SEATCOUNT }" id="seat" name="seat"/>
				<input type="hidden" value="${c.MEMBERNUM }" id="mem" name="mem"/>
	    		<div class="row">
			    	<div class="col-9">
				    	<div class="row">
	                       <div class="col-6">
	                        	<div class="mark-p"></div><span class="start-span"><b>출발일</b></span><br> <p>${fn:substring(c.STARTDATE,0,10)}</p><hr>
	                       </div>
	                       <div class="col-6">
	                        	<div class="mark-p"></div><span class="start-span"><b>출발시간</b></span><br> <p>${fn:substring(c.STARTDATE,11,20)}</p><hr>
	                       </div>
                        </div>
			    		<span class="badge badge-primary">출발</span><br>
			    		<span class="span_city">${c.STARTCITY}&nbsp;${c.STARTDETAIL }</span><br>
			    		<h5 class="fas fa-arrow-down fa-2x h5-icon"></h5><br>
			    		<span class="badge badge-success">도착</span><br>
			    		<span class="span_city">${c.ENDCITY}&nbsp;${c.ENDDETAIL }</span> <br>
			    		<input type="hidden" value="${search.startCity }" id="startCity" name="startCity"/>
			    		<input type="hidden" value="${search.endCity }" id="endCity" name="endCity"/>
			    		<input type="hidden" value="${search.startDate }" id="startDate" name="startDate"/>
		    		</div>
			    	<div class="col-3">
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
	</c:if>
</c:forEach>
<input type="hidden" value="${search.cPage }" id="cPage" name='cPage'/>