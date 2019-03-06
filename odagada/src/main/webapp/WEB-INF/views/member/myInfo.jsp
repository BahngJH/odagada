<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,com.spring.odagada.member.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	Member m = (Member) request.getAttribute("logined");
    String eDate []=m.getEnrollDate().split(" ");
%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<style>

  div#enroll-container{width:400px; margin:0 auto;}
  div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
</style>

<div id="enroll-container">	
	<div class="info col-12">
		<table class="table table-hover">		 
			    <tr>
			      <th scope="row">이름</th>
			      <td><c:out value="${logined.memberName }"></c:out></td>
			      <td><img src="${path }/resources/upload/profile/${logined.profileImageRe}"></td>		 
			    </tr>			 
			    <tr>
			      <th scope="row">아이디</th>
			      <td><c:out value="${logined.memberId }"></c:out></td>
			      <td></td>		    
			    </tr>
			    <tr>
			      <th scope="row">가입날짜</th>
			      <td><%=eDate[0] %></td>
			      <td></td>
			     	   
			    </tr>
			    <tr>
			      <th scope="row">E-mail</th>
			       <td><c:out value="${logined.email }"></c:out></td>
			       <td><c:out value="${logined.isEmailAuth }"></c:out></td>			
			    </tr>
			    <tr>
			      <th scope="row">Phone</th>
			      <td><c:out value="${logined.phone }"></c:out></td> 
			      <td><c:out value="${logined.isPhoneAuth }"></c:out></td>	    
			    </tr>			
		</table>
	</div>
</div>













<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>