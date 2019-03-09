<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.spring.odagada.member.model.vo.Member"%>
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
    <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<meta charset="UTF-8">
<title>ODA-GADA</title>
<style>
    header button.btn.btn-success{
      background-color: rgb(0, 175, 76);
      float: right;
      margin-bottom: 5px;
    }
   .msgCount{
   		margin-top:5px;
      	float:right;
      	border:1px solid red;
      	background-color:red;
      	border-radius: 100%;
      	width: 30px;
        text-align: center;
        color:white;
      }
     
</style>

</head>

<body>
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#"><img src="https://cdn.icon-icons.com/icons2/740/PNG/512/car_icon-icons.com_63325.png" style="width: 50px; height: 50px;">ODA GADA</a>
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
                <li class="nav-item">
                  <a class="nav-link" href="${path }/community/notifyForm.do">신고</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="${path }/community/reviewForm.do">리뷰</a>
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
                    <a class="dropdown-item" href="#">공지사항</a>
                    <a class="dropdown-item" href="#">회원 관리</a>
                    <a class="dropdown-item" href="#">드라이버 관리</a>
                    <a class="dropdown-item" href="#">질의응답</a>
                  </div>
                </li>
                <li class="nav-item" id="communityDiv">
	                  <a class="nav-link" href="${path }/community/chatting.do">소통해요</a>
	            </li>
	            <li><div id="msgDiv"></div></li> 
              </ul>
            </div>
          </nav>

<script>
	$(function(){
		if(<%=request.getSession().getAttribute("logined")!=null && !request.getSession().getAttribute("logined").equals("")%>){
			//로그인 되어 있을 때만 실행
			var url="http://localhost:9090/odagada/echo";
			ws = new SockJS(url);
			
			//메세지를 받았을 때
			ws.onmessage = function(event)
			{
				var myId='${logined.memberId}';
				checkMsg(myId);
			};
			
			ws.onopen = function(event)
			{
				var myid = {"myId" : "${logined.memberId}"};
				ws.send(JSON.stringify(myid));
				
				var myId='${logined.memberId}';
				checkMsg(myId);
				
			};
			
			//소켓이 닫히고 실행되는 함수, 즉 이 메소드가 실행될 땐 이미 소켓이 닫힌 상태
			ws.onclose = function()
			{
				console.log("Connection Closed");
			};

			ws.error=function(event)
			{
				console.log(event);
			}
		}
	});
	
	function checkMsg(myId)
	{
		$.ajax({
			url:"${path}/community/checkMsg.do",
			data:{"myId":myId},
			success:function(data)
			{
				console.log(data.unIsReadMsg);
				if(data.unIsReadMsg>0)
				{
					
					var unCheckMsg="<span class='msgCount'>"+data.unIsReadMsg+"</span>";
					$("#msgDiv").html(unCheckMsg);
				}
			}		
		});		
	}
</script>





