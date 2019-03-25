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
</style>
<section class="container">
	<div class="col-md-8 offset-md-2">
		<h1> 오다가다 회원 관리</h1>
	</div>
</section>

<section class="photo-backround" data-image="${path}/resources/images/miniHeader1.png">
</section>
​<section id="container">
	<div>
		<!-- <h2>회원관리</h2> -->
		<div id="searchMember">
			<form method='get' action='${path }/admin/searchMember.do' onsubmit="return checkSearch();">
			<select name="searchType" id='select'>
				<option value="none" disabled selected>검색타입</option>
				<option value="memberid" <c:if test="${searchType eq 'memberid'}">selected</c:if>>아이디</option>
				<option value="membername"<c:if test="${searchType eq 'membername'}">selected</c:if>>이름</option>
			</select>
			<input type="text" id="keyword" name="keyword" value="${keyword!=null?keyword:''}"/>
			<input type="submit" value="검색">
			</form>
		</div>
	</div>
	<table class="table table-hover">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>생년월일</td>
			<td>휴대폰</td>
			<td>이메일</td>
			<td>성별</td>
			<td>이메일 인증</td>
			<td>휴대폰 인증</td>
		</tr>
		<c:forEach var="list" items="${memberList }">
			<tr>
				<td>${list.MEMBERID }</td>
				<td>${list.MEMBERNAME }</td>
				<td>${list.BIRTH }</td>
				<td>${list.PHONE }</td>
				<td>${list.EMAIL }</td>
				<td>${list.GENDER }</td>
				<td>${list.ISPHONEAUTH }</td>
				<td>${list.ISEMAILAUTH }</td>
			</tr>
		</c:forEach>
	</table>
	${pageBar }
</section>
<script>
	function checkSearch()
	{
		if($('#select').val()==null){
			alert("옵션을 선택하세요");
			return false;
		}
		if($('#keyword').val().length==0){
			alert("검색할 키워드를 입력하세요");
			return false;
		}	
	}
</script>

​
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>​