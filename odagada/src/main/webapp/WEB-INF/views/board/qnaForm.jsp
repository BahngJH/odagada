<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
​<style>
	
</style>
<script>
$(function(){
	   $('[name=upFile]').on('change',function(){
	      var filename=this.files[0].name;
	      $(this).next('.custom-file-label').html(filename);
	   });
	 });	
	function validate(){
		var content = $("[name=boardContent]").val();
		if(content.trim().length==0)
			{
				alert("내용을 입력하세요.");
				return false;
			}
		return true;
	}
</script>
<section id="qna-container" class="container">
	<form name="boardFrm" action="${path}/board/qnaFormEnd" method="post" onsubmit="return validate();">
		<div class="col-6 col-md-6 offset-md-3" style="padding-left: 0px;padding-right: 0px;">
			<input type="text" class="form-control" placeholder="제목" name="qTitle" id="qTitle" required/>		
		</div>
		<br/>
		<div class="col-6 col-md-6 offset-md-3" style="padding-left: 0px;padding-right: 0px;">
			<textarea class="form-control" name="qContent" placeholder="내용" required></textarea>
		<br/>
		</div>		
		<div class="col-6 col-md-6 offset-md-3" style="text-align: center;">
			<input type="submit" class="btn btn-outline-success" value="저장">
			<input type="button" class="btn btn-outline-success" onclick="javascript:location.href='${path}/board/qnaList';" value="취소">
		</div>
	</form>
</section>
​
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>​