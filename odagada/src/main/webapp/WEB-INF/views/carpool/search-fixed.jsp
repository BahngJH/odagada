<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@page import="java.util.*,com.spring.odagada.carpool.model.vo.Carpool"%>
			<!-- 조건만큼 검색 결과 출력 -->
			<c:forEach items="${coList}" var="c">
				<form method="post" action="${path}/carpool/oneSearch.do?carpoolnum=1" id="form-onecar">
					<div id="div-pick" class="card border-success mb-3" onclick="onecar()">
					  <div class="card-body text-success">
					    <div class="row">
					    	<div class="col-6">
					    	 <span class="span_city">${c.STARTDATE }</span><br>
					    		<span class="badge badge-primary">출발</span><br>
					    		<span class="span_city">${c.STARTCITY}${c.STARTDETAIL }</span><br>
						    		<h5 class="fas fa-arrow-down fa-2x h5-icon"></h5><br>
					    		<span class="badge badge-success">도착</span><br>
					    		<span class="span_city">${c.ENDCITY}${c.ENDDETAIL }</span> <br>
				    		</div>
					    	<div class="col-6">
					    		<div class="row">
					    			<div class="col-12">
					    				<span class="span-option col-text">${c.PAY}</span>
					    			</div>
					    		</div>
					    		<div class="row">
					    			<div class="col-12">
					    				<span class="span-option">
					    					<%-- <img class="driver-profile" src="${path }/resources/images/ilhoon2.jpg"/> --%>
					    					<p class="col-text">${c.MEMBERNAME }</p>
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