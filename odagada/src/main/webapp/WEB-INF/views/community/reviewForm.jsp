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
   div#review-container
   {
      text-align:center;
      width: 500px;
      margin: 0 auto;
   }
   div#review-container input
   {
      margin-bottom:10px;
   }
   div#review-container textarea
   {
   	  height: 300px;
   }
</style>
<script>
   function validate()
   {
      var content = $("[name=reviewContent]").val();
      if(content.trim().length==0)
      {
          alert("내용을 입력하세요");
          return false;
      }
      return true;
   }
</script>
<div id="review-container">
	<h1>리뷰</h1>
	<input type="text" class="form-control" placeholder="아이디" name="reviewWriter" id="reviewWriter" readonly required>
	<input type="text" class="form-control" placeholder="제목" name="reviewTitle" id="reviewTitle" required>
	<textarea class="form-control" name="reviewContent" placeholder="내용" required></textarea>
	<br/>
	<input type="submit" class="btn btn-outline-success" value="입력" >
	<input type="reset" class="btn btn-outline-success" value="취소" >
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>