<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<!-- 부트스트랩관련 라이브러리 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<!-- font awesome 아이콘 -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>ODA-GADA</title>
<style>
    header button.btn.btn-success{
      background-color: rgb(0, 175, 76);
      float: right;
      margin-bottom: 5px;
    }
</style>
</head>

<body>
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#"><img src="https://cdn.icon-icons.com/icons2/740/PNG/512/car_icon-icons.com_63325.png" style="width: 50px; height: 50px;">ODA GADA</a>
           <%--  <a class="navbar-brand" href="#"><img src="${path}/resources/images/oda_logo.png" style='height:40px;'></a> --%>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
              <ul class="navbar-nav">
                <li class="nav-item active">
                  <a class="nav-link" href="${pageContext.request.contextPath}/carpool/search.do">검색</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="${path }/member/signUp.do">회원가입</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">드라이버등록</a>
                </li>
            	<c:if test="${sessionScope.logined==null }">   
	                 <li class="nav-item">
	                  <a class="nav-link" href="${path }/member/loginForm.do">로그인</a>
	                </li> 
                </c:if>
               	<c:if test="${sessionScope.logined!=null }">   
	                 <li class="nav-item">
	                  <a class="nav-link" href="${path }/member/logout.do">로그아웃</a>
	                </li> 
                </c:if>
              
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   관리자메뉴
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/board/boardList">공지사항</a>
                    <a class="dropdown-item" href="#">회원 관리</a>
                    <a class="dropdown-item" href="#">드라이버 관리</a>
                    <a class="dropdown-item" href="#">질의응답</a>
                  </div>
                </li>
              
              </ul>
            </div>
          </nav>







