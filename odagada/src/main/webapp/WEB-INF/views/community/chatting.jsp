<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="채팅하기" name="pageTitle"/>
</jsp:include>
    <style>
        #chattingRoom, #profile{
            display: inline-block;
            width:23%;
        }
        #container{
            margin-top: 30px;
        }
        #chatRooms, #chatContent,#myInfo{
            overflow: auto;
            height: 600px;
        }

        #chattingView{
            display: inline-block;
            width: 50%;
        }
        #roomTitle{
            text-align: center;
            margin-bottom: 50px;
        }
        #chatRoom{
            border-top: 1px solid black;
        }
        #chatRoom:hover{
            background-color: gray;
        }
        #time{
            margin-top: 5px; 
            float: right;
            margin-right: 10px;
        }
        #userName{
            margin-bottom: 10px;
            font-size: 120%;
        }
        #userInfoBottom{
            margin-top: 10px;
            margin-bottom: 15px;
        }
        #selectUserInfo{
            border-bottom: 1px solid black;
        }
        #selectName{
        	font-size: 180%;
        }
        #chatContent{
            margin-top: 20px;
        }
        #message{
            width: 99%;
        }
        #myName{
            font-size: 200%;
        }
        #myInfo{
            text-align: center;
        }
        img{
            border-radius: 100%;
        }
    </style>
<div id="container" class="container-fluid">
            <div class="row">

           
        <div id="chattingRoom" class="col col-xs-12 " >
            <div id="roomTitle">
                <h3>채팅방 목록</h3>
            </div>
            <div id="chatRooms">
                <div id="chatRoom" onclick="hi('하잉');">
                    <div id="userInfoTop">
                        <span id="userName"><b>홍길동</b></span>
                        <span id="time">19.3.2 14:20</span>
                    </div>
                    <div id="userInfoBottom">
                        <span id="recentMsg">안녕하세요</span>
                    </div>
                </div>
                <div id="chatRoom">
                    <div id="userInfoTop">
                        <span id="userName"><b>정조</b></span>
                        <span id="time">19.3.2 14:20</span>
                    </div>
                    <div id="userInfoBottom">
                        <span id="recentMsg">하이</span>
                    </div>
                </div>
                <div id="chatRoom">
                    <div id="userInfoTop">
                        <span id="userName"><b>이순신</b></span>
                        <span id="time">19.3.2 14:20</span>
                    </div>
                    <div id="userInfoBottom">
                        <span id="recentMsg">안녕?</span>
                    </div>
                </div>
             <div id="chatRoom">
                    <div id="userInfoTop">
                        <span id="userName"><b>나연</b></span>
                        <span id="time">19.3.2 14:20</span>
                    </div>
                    <div id="userInfoBottom">
                        <span id="recentMsg">아령하세요</span>
                    </div>
                </div>
                <!-- <div id="chatRoom">
                        <div id="userInfoTop">
                            <span id="userName"><b>이순신</b></span>
                            <span id="time">19.3.2 14:20</span>
                        </div>
                        <div id="userInfoBottom">
                            <span id="recentMsg">안녕?</span>
                        </div>
                    </div>
                    <div id="chatRoom">
                            <div id="userInfoTop">
                                <span id="userName"><b>이순신</b></span>
                                <span id="time">19.3.2 14:20</span>
                            </div>
                            <div id="userInfoBottom">
                                <span id="recentMsg">안녕?</span>
                            </div>
                        </div>
                        <div id="chatRoom">
                                <div id="userInfoTop">
                                    <span id="userName"><b>이순신</b></span>
                                    <span id="time">19.3.2 14:20</span>
                                </div>
                                <div id="userInfoBottom">
                                    <span id="recentMsg">안녕?</span>
                                </div>
                            </div>
                            <div id="chatRoom">
                                    <div id="userInfoTop">
                                        <span id="userName"><b>이순신</b></span>
                                        <span id="time">19.3.2 14:20</span>
                                    </div>
                                    <div id="userInfoBottom">
                                        <span id="recentMsg">안녕?</span>
                                    </div>
                                </div>
                                <div id="chatRoom">
                                        <div id="userInfoTop">
                                            <span id="userName"><b>이순신</b></span>
                                            <span id="time">19.3.2 14:20</span>
                                        </div>
                                        <div id="userInfoBottom">
                                            <span id="recentMsg">안녕?</span>
                                        </div>
                                    </div>
                                    <div id="chatRoom">
                                            <div id="userInfoTop">
                                                <span id="userName"><b>이순신</b></span>
                                                <span id="time">19.3.2 14:20</span>
                                            </div>
                                            <div id="userInfoBottom">
                                                <span id="recentMsg">안녕?</span>
                                            </div>
                                        </div>
                                        <div id="chatRoom">
                                                <div id="userInfoTop">
                                                    <span id="userName"><b>이순신</b></span>
                                                    <span id="time">19.3.2 14:20</span>
                                                </div>
                                                <div id="userInfoBottom">
                                                    <span id="recentMsg">안녕?</span>
                                                </div>
                                            </div>
                                            <div id="chatRoom">
                                                    <div id="userInfoTop">
                                                        <span id="userName"><b>이순신</b></span>
                                                        <span id="time">19.3.2 14:20</span>
                                                    </div>
                                                    <div id="userInfoBottom">
                                                        <span id="recentMsg">안녕?</span>
                                                    </div>
                                                </div>
                                                <div id="chatRoom">
                                                        <div id="userInfoTop">
                                                            <span id="userName"><b>이순신</b></span>
                                                            <span id="time">19.3.2 14:20</span>
                                                        </div>
                                                        <div id="userInfoBottom">
                                                            <span id="recentMsg">안녕?</span>
                                                        </div>
                                                    </div>
                                                    <div id="chatRoom">
                                                            <div id="userInfoTop">
                                                                <span id="userName"><b>이순신</b></span>
                                                                <span id="time">19.3.2 14:20</span>
                                                            </div>
                                                            <div id="userInfoBottom">
                                                                <span id="recentMsg">안녕?</span>
                                                            </div>
                                                        </div>
                                                        <div id="chatRoom">
                                                                <div id="userInfoTop">
                                                                    <span id="userName"><b>이순신</b></span>
                                                                    <span id="time">19.3.2 14:20</span>
                                                                </div>
                                                                <div id="userInfoBottom">
                                                                    <span id="recentMsg">안녕?</span>
                                                                </div>
                                                            </div>  -->
            </div>                                                
        </div>

        <div id="chattingView" class="col-6 col-xs-12 " >
            <div id="selectUserInfo">
                <span id="image"><img width="80px" height="80px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqxxKiKaDBtz-L7KGPFFhMxUpQ6XjWrws0jIqfZYn3NY76zAspLQ" alt="회원사진"></span>
                <span id="selectName">나연</span>
            </div>
            <div id="chatContent">
                아령하세요
            </div>
            <div id="sendForm">
                <input type="text" id="message" placeholder="메시지를 입력해주세요.">
            </div>
        </div>
        <div id="profile" class="col col-xs-12 ">
            <div id="myInfo">
                <img width="120px" height="120px" src="http://img.etnews.com/news/article/2017/08/16/cms_temp_article_16215301717720.jpg" alt="내 사진"><br>
                <span id="myName">류준열</span>
            </div>
        </div>
    </div>
    </div>
    
    <script>
    function hi(msg){
    	alert(msg);
    }
    
    </script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>