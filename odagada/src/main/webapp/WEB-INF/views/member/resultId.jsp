<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.spring.odagada.member.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
String resultId=(String)request.getAttribute("memberId");
%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>


<style>
/* div#enroll-container{width:400px; margin:0 auto; text-align:center;} */
/* div#enroll-container input, div#enroll-container select {margin-bottom:10px;} */
/* #title{margin-top:30px; margin-bottom:20px;} */
/* .info{margin:20%; margin-top:10%;}*/
.btn-g{margin:3px;} 
.out-div{text-align:center; margin:5%;}
#findId-h{margin-bottom:5%;}

</style>


<div class="row out-div">
	<div class="col-12">
     	<div class="row">
     		<div class="col-12">
     			<h3>ID 찾기 결과</h3>
   				<h5 id="findId-h">아이디: <%=resultId %></h5>
				<span>
					<button class="btn btn-success btn-sm btn-g" onclick="location.href='${path}/member/login.do'">로그인</button>
					<button class="btn btn-success btn-sm btn-g">비밀번호 찾기</button>
					<input type="reset" class="btn btn-outline-success btn-sm btn-g" value="취소">
				</span>
			</div> 
		</div>
 	 </div>    
</div>
         
         






<script></script>














<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>