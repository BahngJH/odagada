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
    	#container{
    		margin-bottom:60px;
    	}
        #chattingRoom, #profile{
            display: inline-block;
            width:23%;
        }
        #container{
            margin-top: 30px;
        }
        #chatRooms, #chatContent, #myInfo{
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
            width: 95%;
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
        	margin-left: 10px;
        }
        .right{
        	float:right;
        	word-break: break-all;
        	margin-right: 10px;
        }
        .msgDivLeft{
        	width:400px;
        }
         .msgCount{
        	float:right;
        	border:1px solid red;
        	background-color:red;
        	border-radius: 100%;
        	width: 30px;
            text-align: center;
            color:white;
        }
        
    </style>
<div id="container" class="container-fluid">
      <div class="row">
        <div id="chattingRoom" class="col col-xs-12 " >
        
            <div id="roomTitle">
                <h3>채팅방 목록</h3>
            </div>
            <div id="chatRooms">
            
              <c:forEach items="${chatRooms }"  var="rooms">
            		<div id="chatRoom" onclick="bringMessage(this)">
            			<input type="hidden" id="roomId" value="${rooms.roomId }">
            			<input type="hidden" id="memberId" value="${rooms.memberId }">
            			<div id="userInfoTop">
            				<span id=userName><b>${ rooms.memberName}</b></span>
            				<span id="time"> ${rooms.cDate }</span>
            			</div>
            			<div id="userInfoBottom">
            				<span id="recentMsg">${ rooms.cContent}</span>
            				<!-- <span class="msgCount"></span> -->
            			</div>
	            	</div>
	            </c:forEach>
	            
	            <div id="chatRoom" onclick="">
            			<div id="userInfoTop">
            				<span id=userName><b>유인나</b></span>
            				<span id="time">19.03.07 15:24</span>
            			</div>
            			<div id="userInfoBottom">
            				<span id="recentMsg">메시지 잘 가나요?</span>
            				<sapn class="msgCount">5</sapn>
            			</div>
	            	</div>
	            	
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
    
    //메시지 보낼 json객체
    var jsonData ={};
    
    //채팅 데이터 합칠 거
    var allMsg="";
    
    
    //처음 창에 들어오면 웹소켓 자동 연결
    $(function()
    {
    	var url="http://localhost:9090/odagada/echo";
		ws = new SockJS(url);
		
		ws.onmessage = function(event)
		{
			//1개씩 날아오는 메시지 받는 함수
			jsonTextParse(event.data);
	    	
			//메시지가 오면 채팅방 위치 재배열
	    	updateChatRoom();
	    	
			//알림처리
			
		};
		
		ws.onopen = function(event)
		{
			var myid = {"myId" : "${logined.memberId}"};
			ws.send(JSON.stringify(myid));
		};
		
		//소켓이 닫히고 실행되는 함수, 즉 이 메소드가 실행될 땐 이미 소켓이 닫힌 상태
		ws.onclose = function()
		{
			console.log("Connection Closed");
		};

		ws.error=function(event){
			console.log(event);
		}
    });
    
    //메시지 보내는 기능
    function MessageSend()
	{
		jsonData.text = $('#messageInput').val();
		jsonData.sender ="${logined.memberId}";
		ws.send(JSON.stringify(jsonData));
		$('#messageInput').val("");
		$('#messageInput').focus();
	}
    
    
    function bringMessage(e)
    {
    	//채티방 클릭시 reciver와 roomid를 셋팅한다.
    	jsonData.receiver = $(e).children('#memberId').val();
		jsonData.roomId = $(e).children('#roomId').val();
    	
    	$.ajax({
    		url:"${path}/chat/bringMessage.do",
    		data:{"roomId":$(e).children('#roomId').val()},
    		success:function(data)
    		{
    			for(var i=0;i<data.chatList.length;i++){
    				//console.log(data.chatList[i]);
    				                                                      
    				if(data.chatList[i].SENDER=='${logined.memberId}')
        			{
						var right ="<div >";
						right +="<p class='right' style='clear:both'>"+(decodeURIComponent(data.chatList[i].CCONTENT)).replace(/\+/g," ")+"</p>";
						right +="</div>";
    					allMsg +=right;
    					//스타일 주고 오른쪽으로 붙임,내가 보낸 메시지
        			}
        			else{
        				var left = "<div class='msgDivLeft'>";
        				left +="<img class='left' style='clear:both' width='40px' height='40px' src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqxxKiKaDBtz-L7KGPFFhMxUpQ6XjWrws0jIqfZYn3NY76zAspLQ' alt='회원사진'/>";
        				left +="<p class='left' >"+(decodeURIComponent(data.chatList[i].CCONTENT)).replace(/\+/g," ")+"</p>";
        				left +="</div>";
    					allMsg +=left;
        				//스타일 주고 왼쪽에 이미지와 함께 붙임,상대방 메시지
        			}
    			}
    			$('#chatContent').html(allMsg);
    			allMsg="";
    		}
    	});
    	//스크롤 최신화, 안읽은 메시지 띄워주기

    }
     
     function updateChatRoom()
    {
    	$.ajax({
    		url:"${path}/chat/updateRoom.do",
    		success:function(data)
    		{
				var updateRoom="";
    			
    			for(var i=0;i<data.chatRooms.length;i++)
    			{
            		var roomId = data.chatRooms[i].roomId;
            		var memberId = data.chatRooms[i].memberId;
					var cDate = (data.chatRooms[i].cDate).substring(0,14);	
            		
     				updateRoom +='<div id="chatRoom" onclick="bringMessage(this)">';
     				updateRoom +='<input type="hidden" id="roomId" value="'+roomId+'">';
     				updateRoom +='<input type="hidden" id="memberId" value="'+memberId+'">';
 					updateRoom +='<div id="userInfoTop">';
    				updateRoom +='<span id=userName><b>'+data.chatRooms[i].memberName+'</b></span>';
					updateRoom +='<span id="time">'+cDate+'</span>';
					updateRoom +='</div>';
        			updateRoom +='<div id="userInfoBottom">';
        			updateRoom +='<span id="recentMsg">'+data.chatRooms[i].cContent+'</span></div></div>';
    			}
    			$('#chatRooms').html(updateRoom);
    		}
    	});
    }   
    
     //메시지 받았을 때 켜 있는 화면이랑 메시지 roomid가 같으면 보여주고 아니면 안보여줌
    function jsonTextParse(jsonText)
    {
    	 //JSON파싱처리
    	var json = JSON.parse(jsonText);
    	
    	//넘어온 데이터의 roomid와 현재 보고 있는 roomid가 같으면 채팅창에 추가 아니면 놉
    	if(json.roomId==jsonData.roomId)
    	{
    		//보낸 사람이 자기 자신이면 오른쪽에 메시지 붙임
	    	if(json.sender=='${logined.memberId}')
			{
				var right = "<div >";
				right +="<p class='right' style='clear:both'>"+json.text+"</p>";
				right +="</div>";
				
				//스타일 주고 오른쪽으로 붙임,내가 보낸 메시지
				$('#chatContent').append(right);
			}
    		//보낸 사람이 내가 아니라면 왼쪽에 메시지 붙임
			else
			{
				var left = "<div class='msgDiv'>";
				left +="<img class='left' style='clear:both' width='40px' height='40px' src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqxxKiKaDBtz-L7KGPFFhMxUpQ6XjWrws0jIqfZYn3NY76zAspLQ' alt='회원사진'/>";
				left +="<p class='left' >"+json.text+"</p>";
				left +="</div>";
				
				//스타일 주고 왼쪽에 이미지와 함께 붙임,상대방 메시지
				$('#chatContent').append(left);
			}
    	}
    	
    	
    	
    }
    
    </script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>