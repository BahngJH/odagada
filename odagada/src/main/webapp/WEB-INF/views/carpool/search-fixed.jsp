<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					    					<%-- <img class="driver-profile" src="${path }/resources/images/ilhoon2.jpg"/> --%>
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