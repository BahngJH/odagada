<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,com.spring.odagada.member.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	Member m = (Member) request.getAttribute("logined");
	System.out.println(m);
    String eDate []=m.getEnrollDate().split(" ");
%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>

<style>
div#enroll-container {
	width: 400px;
	margin: 0 auto;
}

div#enroll-container input, div#enroll-container select {
	margin-bottom: 10px;
}

.menu {
	text-align: center;
	font-weight: bold;
}

.info {
	margin-top: 50px;
	margin-bottom: 50px;
}

span.span-option {
	float: right;
}

.col-text {
	color: black;
}

span.span_city {
	font-size: 13px;
	color: black;
}

button.start-search {
	float: right;
}

div.status_option>span {
	float: right;
}

div.driver>span{
	float: left;
}

a#pay{
	color: #FFFFFF;
}
</style>

<section class="container">
	<div class="row">

		<div class="col-12 col-md-2">
			<div class="menu_list info list-group">
				<a href="${path }/member/myInfo.do" class="list-group-item list-group-item-action">회원 정보 관리</a>
				<a href="${path}/member/myDriver" class="list-group-item list-group-item-action">드라이버 정보 관리</a>
				<a class="list-group-item list-group-item-action active">카풀 내역</a>
			</div>
		</div>
		
		<div class="col-12 col-md-10" id="enroll-container">	
			<div class="info col-12 col-sm-12 col-md-10">
				<!-- 조건만큼 검색 결과 출력 -->
				<c:if test="${carpoolList.isEmpty() }">
					<h3>조회 결과가 없습니다.</h3>
				</c:if>
				<c:if test="${carpoolList.size()>0 }">
					<c:forEach items="${carpoolList }" var="list">
				      <div id="div-pick" class="card border-success mb-3">
				        <div class="card-body text-success">
				          <div class="row">
				             <div class="col-12">
					             <span class="span_city">${list.STARTDATE }</span>
								 <span class="span-option col-text">${list.PAY }원</span><br/>
					             <span class="badge badge-primary">출발</span>
					             <span class="span_city">${list.STARTCITY} ${list.STARTDETAIL }</span> <br/>
					             <span class="badge badge-success">도착</span>
					             <span class="span_city">${list.ENDCITY} ${list.ENDDETAIL }</span> <br>
				             </div>
				             <div class="col-12">
				                <div class="row">
				                	<div class="col driver">
				                        <span class="span-option col-text">운전자 : ${list.MEMBERNAME }</span><br/>
				                   </div>
				                   <div class="col status_option">
				                   		<c:if test='${list.PAYSTATUS == "N" }'>
					                        <span class="badge badge-danger"><a id="pay" data-toggle="modal" href="#payModal">결제 코드</a></span>
					                        <!-- Modal -->
											<div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="payModalLabel" aria-hidden="true">
											  <div class="modal-dialog" role="document">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h5 class="modal-title" id="payModalLabel">결제 코드</h5>
											        <button type="button" class="close" data-dismiss="payModal" aria-label="Close">
											          <span aria-hidden="true">&times;</span>
											        </button>
											      </div>
											      <div class="modal-body">
											        ${list.PAYCODE }
											        
											      </div>
											      <div class="modal-footer">
											      	<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="payCancel(${list.CARPOOLNUM });">결제 취소</button>
											        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
											      </div>
											    </div>
											  </div>
											</div>
											<script>
												function payCancel(carpoolNum){
													var isCancel = confirm("정말 취소하시겠습니까?");
													if(isCancel){
														console.log("취소 시작");
														console.log(carpoolNum);
														$.ajax({
															url:"${path}/carpool/paymentCancel",
															type:"post",
															data:{
																"carpoolNum" : carpoolNum,																	
															},
															success:function(response){
																if(response === "ok"){
																	alert("결제 취소 성공");
																}else{
																	alert("결제 취소 실패");
																}
																location.reload();
															}
														});
													}
												}
											</script>
				                   		</c:if>
				                   		<c:if test='${list.PAYSTATUS == "Y"}'>
											<span class="badge badge-success">결제 완료</span>
										</c:if>
										<span>
										&nbsp;&nbsp;
										</span>
				                   		<c:if test='${list.PSTATUS == "N" }'>
					                        <span class="badge badge-danger">미승인</span>
				                   		</c:if>
				                   		<c:if test='${list.PSTATUS == "Y"}'>
											<span class="badge badge-success">승인</span>
										</c:if>
										<c:if test='${list.PSTATUS == "C" }'>
											<span class="badge badge-warning">결제 취소</span>
										</c:if>
				                   </div>
				                </div>
				             </div>
				          </div>
				        </div>
				      </div>
					</c:forEach>
				</c:if>
		     </div>

		</div>
	</div>
	<nav aria-label="Page navigation">
		${pageBar }
	</nav>
      

</section>






<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>