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
	div#notify-container
	{
	   text-align:center;
	   width: 500px;
	   margin: 0 auto;
	}
	div#notify-container textarea
	{
		  height: 300px;
	}
</style>
<script>
	function validate(){
		return true;	
	}
   function notify()
   {
       var content = $("[name=nContent]").val();
       if(content.trim().length==0)
       {
           alert("내용을 입력하세요");
           return false;
       }
       else{
    	   $('#notifyFrm').submit();
       }
   }
   function backBtn(){
		history.back(); 	
	}
</script>
<section class="container">
	<div id="notify-container">
		<form id="notifyFrm" name="notifyFrm" action="${path}/community/notifyFormEnd.do" method="post" onsubmit="return validate();"> 
		<h1>신고</h1>
			<%-- <input type="text" class="form-control" name="notifyNum" id="notifyNum" value="${logined.memberId}" readonly required> --%>
			<h4>${driverName }님 신고하기</h4>
			<textarea class="form-control" name="nContent" placeholder="신고사유" required></textarea>
			<br/>
			<input type="hidden" name="driverId" id="driverId" value="${driverId }"/>
			<input type="button" class="btn btn-outline-success" value="등록" onclick="notify();">
			<button class='btn btn-success back-btn'  onclick='backBtn()'>취소</button>
		</form>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>