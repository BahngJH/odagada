<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>;
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>;
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>;
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
​<style>
	section div h2 {
		text-align: center;
		font-weight: bold;
	}
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
<section id="board-container" class="container">
	<form name="boardFrm" action="${path}/board/boardModifyEnd?boardNo=${board.BOARDNO}" method="post" onsubmit="return validate();" enctype="multipart/form-data">
	<div class="col-6 col-md-6 offset-md-3" style="padding-left: 0px;padding-right: 0px;">
		<h2>공지사항</h2>
		<hr/>		
	</div>
	<div class="col-6 col-md-6 offset-md-3" style="padding-left: 0px;padding-right: 0px;">
		<input type="text" class="form-control" placeholder="제목" name="bTitle" id="bTitle" value="${board.BTITLE}" required/>		
	</div>
		<div class="col-md-6 offset-md-3" style="padding:0px;">
			<div class="input-group mb-3">
				<div class="custom-file">
					<div class="input-group-prepend" style="padding:0px;">
						<span class="input-group-text">첨부파일</span>
					</div>
					<div class="custom-file">
                 	   <input type="file" class="custom-file-input" name="upFile" id="upFile1">
                 	   <label class="custom-file-label" for="upFile1"><c:out value="${board.BORIFILENAME}"/></label>
                 	</div>
             	</div>
			</div>
		</div>
		<br/>
		<div class="col-6 col-md-6 offset-md-3" style="padding-left: 0px;padding-right: 0px;">
			<textarea class="form-control" name="bContent" placeholder="내용" required>${board.BCONTENT}</textarea><br/>
		</div>		
		<div class="col-6 col-md-6 offset-md-3" style="text-align: center;">
			<input type="hidden" name="boardNo" value="${board.BOARDNO}"/>
			<input type="submit" class="btn btn-outline-success" value="수정">
			<input type="button" class="btn btn-outline-success" onclick="javascript:location.href='${path}/board/boardList';" value="취소">
		</div>
	</form>
</section>
​
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>​