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
@font-face { font-family: 'NIXGONM-Vb'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONM-Vb.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'S-CoreDream-3Light'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff'); font-weight: normal; font-style: normal; }	
@font-face { font-family: 'silgothic'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/silgothic.woff') format('woff'); font-weight: normal; font-style: normal; }	
	h1{
		/* font-family : S-CoreDream-3Light; */
		font-family : silgothic;
		text-align: left;
		margin: 20px 0 20px 0;
	}
	.photo-backround{
		background-image: url(${pageContext.request.contextPath}/resources/images/miniHeader1.png);
		background-position: center center;
		background-repeat: no-repeat;
		background-size: cover;
		height: 300px;
		margin-bottom: 30px;
		margin-top: 10px;
	}
	#tbl-board{
		margin-bottom: 30px;
	}
	a{
		color: black;
		text-decoration: none;
	}
	#container{
		text-align: center;
	}
	table td input#enrollResult{
		border: 1px solid rgba(0,0,0,0);
	}
	section{
		font-family: S-CoreDream-3Light;
	}
</style>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1> 오다가다 드라이버 관리</h1>
	</div>
</section>

<section class="photo-backround" data-image="${path}/resources/images/miniHeader1.png">
</section>
​<section id="driverControll-container" class="container">
<c:set var="isAdmin" value="${logined.isAdmin}"/>
	<div class="col-6 col-md-6 offset-md-3" style="text-align: center; font-weight: bold;">
   <br>    
   </div>      
	<table id="driver-board" class="table table-hover">
	    <tr>
	        <th>아이디</th>
	        <th>이름</th>
	        <th>신청일</th>
	        <th>드라이버 심사</th>
	        <th>드라이버 심사결과</th>
	    </tr>
	    <c:forEach var="d" items="${list}">
	    <tr>
			<td>${d.MEMBERID }</td>
			<td>${d.MEMBERNAME}</td>
			<td>${d.ENROLLDATE}</td>
			<td>
				<form id='submit-frm' method='post' action='${path}/driver/driverForm' onsubmit='return validate()'>
					<button class="btn btn-outline-success" onclick="submitck();">신청서 확인</button>
					<input type='hidden' value='${d.MEMBERNUM }' id='memberNum' name='memberNum'/>
					<input type='hidden' value='${d.CARNUM }' id='carNum' name='carNum'/>
				</form>
			</td>
			<td>
				<c:if test="${d.DRIVERSTATUS == 'N'}">
					<p style="color: red;">승인대기</p>
					<!-- <input type="text" id= "enrollResult" value="승인대기"/> -->
				</c:if>
				<c:if test="${d.DRIVERSTATUS == 'Y'}">
					<p>승인완료</p>
					<!-- <input type="text" id= "enrollResult" value="승인완료"/> -->
				</c:if>
			</td>
        </tr>   
	    </c:forEach>
	</table>
	${pageBar}   
</section>
<script>
	function validate(){
		return true;
	}
	function submitck(){
		$('#submit-frm').submit();
	}
</script>
​
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>​