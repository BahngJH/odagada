<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="채팅하기" name="pageTitle"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

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
        .left{
        	float:left;
        	word-break: break-all;
        }
        .right{
        	float:right;
        	word-break: break-all;
        }
        .msgDiv{
        	width:400px;
        }
    </style>
<div id="container" class="container-fluid">
      <div class="row">
        <div id="chattingRoom" class="col col-xs-12 " >
            <div id="roomTitle">
                <h3>채팅방 목록</h3>
            </div>
            <div id="chatRooms">
                <div id="chatRoom" >
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
             <div id="chatRoom" onclick="bringMessage('test1,test2');">
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
                <span id="selectImage"><img width="80px" height="80px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqxxKiKaDBtz-L7KGPFFhMxUpQ6XjWrws0jIqfZYn3NY76zAspLQ" alt="회원사진"></span>
                <span id="selectName">나연</span>
            </div>
            <div id="chatContent">
                
            </div>
            <div id="sendForm">
                <input type="text" id="messageInput" placeholder="메시지를 입력해주세요.">
                <input type="button" value="전송" onclick="MessageSend();"/>
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
    //웹소켓 객체 사용할 변수
    var ws;
    //데이터 보낼 json객체
    var jsonData ={};
    
    
    //처음 창에 들어오면 웹소켓 자동 연결
    $(function(){
    	var url="http://localhost:9090/odagada/echo";
		ws = new SockJS(url);
		
		ws.onmessage = function(event){
			//writeResponse(event.data);
			jsonTextParse(event.data);
		};
		
		ws.onopen = function(event){
			var myid = {"myId" : "${logined.memberId}"};
			ws.send(JSON.stringify(myid));
		};
		
		//소켓이 닫히고 실행되는 함수, 즉 이 메소드가 실행될 땐 이미 소켓이 닫힌 상태
		ws.onclose = function(){
			console.log("Connection Closed");
		};
		
    });
    
    //메시지 보내는 기능
    function MessageSend()
	{
		jsonData.text = $('#messageInput').val();
		jsonData.sender ="${logined.memberId}";
		
		//나중에 채팅방 클릭하면 그쪽으로 옮겨야함, 아래 공간있음
		jsonData.reciver = "test2";
		jsonData.roomId = "test1,test2";
		
		ws.send(JSON.stringify(jsonData));
		$('#messageInput').val("");
		$('#messageInput').focus();
	}
    
    
    function bringMessage(roomId){
    	
    	//receiver, roomid 해당값으로 변경하는 로직 구현해야함
  
    	$.ajax({
    		url:"${path}/chat/bringMessage.do",
    		data:{"roomId":roomId},
    		success:function(data)
    		{
    			for(var i=0;i<data.chatList.length;i++){
    				console.log(data.chatList[i]);
    				var allMsg="";
    				if(data.chatList[i].SENDER=='test1')
        			{
						var right = "<div >";
						right +="<p class='right' style='clear:both'>"+(decodeURIComponent(data.chatList[i].CCONTENT)).replace(/\+/g," ")+"</p>";
						right +="</div>";
    					allMsg +=right;
    					//스타일 주고 오른쪽으로 붙임,내가 보낸 메시지
        				$('#chatContent').append(right);
        			}
        			else{
        				var left = "<div class='msgDiv'>";
        				left +="<img class='left' style='clear:both' width='40px' height='40px' src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqxxKiKaDBtz-L7KGPFFhMxUpQ6XjWrws0jIqfZYn3NY76zAspLQ' alt='회원사진'/>";
        				left +="<p class='left' >"+(decodeURIComponent(data.chatList[i].CCONTENT)).replace(/\+/g," ")+"</p>";
        				left +="</div>";
    					allMsg +=left;
        				//스타일 주고 왼쪽에 이미지와 함께 붙임,상대방 메시지
        				$('#chatContent').append(left);
        			}
    			}
    			/* $('#chatContent').html(allMsg); */
    		}
    		
    	});
    }
    
    function jsonTextParse(jsonText){
    	var json = JSON.parse(jsonText);
    	console.log("파이널에 합치는중 : "+json.sender);
    	if(json.sender=='test1')
		{
			var right = "<div >";
			right +="<p class='right' style='clear:both'>"+json.text+"</p>";
			right +="</div>";
			
			//스타일 주고 오른쪽으로 붙임,내가 보낸 메시지
			$('#chatContent').append(right);
		}
		else{
			var left = "<div class='msgDiv'>";
			left +="<img class='left' style='clear:both' width='40px' height='40px' src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqxxKiKaDBtz-L7KGPFFhMxUpQ6XjWrws0jIqfZYn3NY76zAspLQ' alt='회원사진'/>";
			left +="<p class='left' >"+json.text+"</p>";
			left +="</div>";
			
			//스타일 주고 왼쪽에 이미지와 함께 붙임,상대방 메시지
			$('#chatContent').append(left);
		}
    }
    
    </script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>