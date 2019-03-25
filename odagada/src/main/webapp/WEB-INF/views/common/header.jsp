<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<!-- 부트스트랩관련 라이브러리 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<!-- font awesome 아이콘 -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- 웹소켓 연결에 필요한 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<title>ODA-GADA</title>

<style>
@font-face { font-family: 'Binggrae-Bold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'YanoljaYacheR'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/YanoljaYacheR.woff') format('woff'); font-weight: normal; font-style: normal; }	
@font-face { font-family: 'S-CoreDream-8Heavy'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-8Heavy.woff') format('woff'); font-weight: normal; font-style: normal; }	
@font-face { font-family: 'SDKukdetopokki'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SDKukdetopokki.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'BMHANNAPro'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.0/BMHANNAPro.woff') format('woff'); font-weight: normal; font-style: normal; }	
@font-face { font-family: 'BMJUA'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff'); font-weight: normal; font-style: normal; }	
@font-face { font-family: 'netmarbleB'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.1/netmarbleB.woff') format('woff'); font-weight: normal; font-style: normal; }	
	
	body{
		min-width: 350px;
		font-family: 'MyLotteLight';
	} 

	footer>div.row{
		margin-right: 0px;
	}

    header button.btn.btn-success{
      background-color: rgb(0, 175, 76);
      float: right;
      margin-bottom: 5px;
    }
    
    div.menu_list>a.active{
	  	background-color: #70A9A1AA;
	  	color: #FFFFFF;
  	    border-color: #FFFFFF;
	}
	
	div.menu_list>a:not(.active):hover{
		background-color: #70A9A1;
		color: #FFFFFF;
	}
	/* 채팅에 사용될 css */
   .msgCount{
  		margin-top:5px;
     	float:left;
     	border:1px solid red;
     	background-color:red;
     	border-radius: 100%;
     	width: 30px;
       text-align: center;
       color:white;
     }
     .navbar{
     	font-family : BMJUA;
     	font-size: 25px;
     }
     
    
</style>
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-between">
            <a class="navbar-brand" href="${path}/"><img src="https://cdn.icon-icons.com/icons2/740/PNG/512/car_icon-icons.com_63325.png" style="width: 50px; height: 50px;">ODA GADA</a>
           <%--  <a class="navbar-brand" href="${path}/"><img src="${path }/resources/images/t-logo.png" style="width: 200px; height: 70px;"></a> --%>
           <%--  <a class="navbar-brand" href="#"><img src="${path}/resources/images/oda_logo.png" style='height:40px;'></a> --%>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="${pageContext.request.contextPath}/carpool/search.do">검색</a>
                </li>
                <c:set var="isAdmin" value="${logined.isAdmin}"/>
                <c:if test="${sessionScope.driver.LICENSENUM eq null}">
                	<c:if test="${isAdmin eq '0'}">
	                	<li class="nav-item">
	                 		<a class="nav-link" href="${path}/driver/driverEnroll">드라이버등록</a>
		               	</li>
	               	</c:if>
               	</c:if>       
                <li class="nav-item">
                  <a class="nav-link" href="${path }/carpool/register">카풀 등록</a>
                </li>
<%--                 <li class="nav-item">
                  <a class="nav-link" href="${path }/community/notifyForm.do">신고</a>
                </li> --%>
            	<c:if test="${sessionScope.logined==null }">   
	                 <li class="nav-item">
	                	  <a class="nav-link" href="${path }/member/loginForm2.do">로그인</a>
	                </li>
	                  <li class="nav-item">
	                 	 <a class="nav-link" href="${path }/member/signUp.do">회원가입</a>
	               	</li> 
                </c:if>
               	<c:if test="${sessionScope.logined!=null }">   
	                 <li class="nav-item">
	                  <a class="nav-link" href="${path }/member/logout.do">로그아웃</a>
	                </li> 
	                <li class="nav-item">
	                  <a class="nav-link" href="${path }/member/myInfo.do">마이페이지</a>
	                </li>          
                </c:if> 
               <c:set var="isAdmin" value="${logined.isAdmin}"/>
               <c:if test="${isAdmin eq '1'}">
                	<li class="nav-item dropdown">
	                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                 		  관리자메뉴
	                  </a>
	                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	                    <a class="dropdown-item" href="${pageContext.request.contextPath}/board/boardList">공지사항</a>
	                    <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/memberList.do">회원 관리</a>
	                    <a class="dropdown-item" href="${path}/driver/driverList">드라이버 관리</a>
	                    <a class="dropdown-item" href="${path}/board/qnaList">Q&A</a>
	                    <a class="dropdown-item" href="${path}/admin/notifyList.do">신고내역</a>
	                    <a class="dropdown-item" href="${path}/admin/blackList.do">블랙리스트</a>
	                  </div>
	                </li>
               </c:if>
               <!-- 채팅 부분 추가함  -->
               <c:if test="${sessionScope.logined!=null }">   
	                <li class="nav-item" id="communityDiv">
	                  <a class="nav-link" href="${path }/community/chatting.do">소통해요</a>
	            	</li>
	            	<li><div id="msgDiv"></div></li>          
                </c:if>       
   

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
					var unCheckMsg="<a href='${path }/community/chatting.do'><span class='msgCount'>"+data.unIsReadMsg+"</span></a>";
					$("#msgDiv").html(unCheckMsg);
				}
			}		
		});		
	}
</script>
