<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/headerWS.jsp">
	<jsp:param value="채팅하기" name="pageTitle"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <style>
    	#container{
    		margin-top: 30px;
    		margin-bottom:60px;
    	}
        #chattingRoom, #profile{
            display: inline-block;
            width:23%;
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
        #insertContent{
        	overflow:auto;
        }
        #chatRoom{
            border-top: 1px solid black;
            padding:10px;
        }
        #chatRoom:hover{
            background-color: #D9E5FF;
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
        }
       
        #selectUserInfo{
            border-bottom: 1px solid black;
        }
        #selectName{
        	font-size: 180%;
        }
        #chatContent{
            
            background-color:#EAEAEA;
        }
        #messageInput{
        	
            width: 100%;
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
        div.recentMsg{
        	
        }
        .left{
        	float:left;
        	word-break: break-all;
        	margin-left: 10px;
        }
        p.left{
        	background-color:white;
        	border:2px soild white;
        	padding: 10px;
        	
        	
        	border-top-left-radius: 3px;
        	border-top-right-radius: 10px;        	
		    border-bottom-right-radius: 10px;
		    border-bottom-left-radius: 10px;
        }
        .right{
        	float:right;
        	word-break: break-all;
        	margin-right: 10px;
        	margin-left: 10px;
        	background-color:yellow;
        	border:2px soild yellow;
        	padding: 10px;
        	
        	border-top-right-radius: 3px;
        	border-top-left-radius: 10px;
		    border-bottom-right-radius: 10px;
		    border-bottom-left-radius: 10px;
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
            				<span class="recentMsg">${ rooms.cContent}</span>
            				<c:if test="${rooms.isReadCount>0 }">
            					<span class="msgCount">${rooms.isReadCount }</span>
            				</c:if> 
            			</div>
	            	</div>
	            </c:forEach>
	    
            </div>                                                           
        </div>
		
        <div id="chattingView" class="col-6 col-xs-12" >
            <div id="selectUserInfo">
           	<c:if test="${chatMember.size()>0}">
           		<c:forEach items="${chatMember }" var="member">
	                	<c:set var="receiver" value="${member.MEMBERID }"/>
	                	<c:set var="roomId" value="${member.ROOMID }"/>
	                	<c:set var="memberName" value="${member.MEMBERNAME }"/>
	                	<c:set var="imageUrl" value="${member.PROFILEIMAGERE }"/>
                </c:forEach>
                
                
                <span id="selectImage"><img width="80px" height="80px" src="${path}/resources/upload/profile/${imageUrl}" alt="상대방사진"></span>
	        	<span id="selectName">${memberName}</span>
               </c:if>
               <c:if test="${chatContent.size()>0}">
	                	<c:forEach items="${chatContent }" var="chatCon">
		                	<c:if test="${chatCon.SENDER!=logined.memberId }">
			                	<c:set var="receiver" value="${chatCon.SENDER}"/>
			                	<c:set var="imageUrl" value="${chatCon.PROFILEIMAGERE }"/>
			                	<c:set var="memberName" value="${chatCon.MEMBERNAME }"/>
		                		
		                	</c:if>
	                	</c:forEach>
	                <span id="selectImage"><img width="80px" height="80px" src="${path}/resources/upload/profile/${imageUrl}" alt="상대방사진"></span>
	        		<span id="selectName">${memberName}</span>
                	</c:if>                	
               	
            </div>
            <div id="chatContent">
                <div id="insertContent">
               		<c:if test="${chatContent.size()>0}">
	                	<c:forEach items="${chatContent }" var="chatCon">
	                		<c:if test="${chatCon.SENDER==logined.memberId }">
	                			<div>
	        						<p class="right" style="clear:both">${chatCon.CCONTENT }</p>
	        						
							        <c:set var="roomId" value="${chatCon.ROOMID}"/>
	   							</div>
	                		</c:if>
		                	<c:if test="${chatCon.SENDER!=logined.memberId }">
		                	<c:set var="receiver" value="${chatCon.SENDER}"/>
		                	<c:set var="imageUrl" value="${chatCon.PROFILEIMAGERE }"/>
		                	<c:set var="memberName" value="${chatCon.MEMBERNAME }"/>
		                		<div class="msgDivLeft">
							        <img class="left" style="clear:both" width="40px" height="40px" src="${path}/resources/upload/profile/${imageUrl}" alt="회원사진">
							        <p class="left" style="clear:both">${chatCon.CCONTENT }</p>
							       	
							    </div>
		                	</c:if>
	                	</c:forEach>
                	</c:if>
                </div>
            </div>
            
            <div id="sendForm">
                <input type="text" id="messageInput" placeholder="메시지를 입력하고 Enter를 눌러주세요.">
            </div>
        </div>
        <div id="profile" class="col col-xs-12 ">
            <div id="myInfo">
                <img width="120px" height="120px" src="${path }/resources/upload/profile/${logined.profileImageRe}" alt="내 사진"><br>
                <span id="myName">${logined.memberName }</span>
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
    	//
    	jsonData.sender ="${logined.memberId}";
    	
    	var url="http://localhost:9090/odagada/echo";
		ws = new SockJS(url);
		
		//메세지를 받았을 때
		ws.onmessage = function(event)
		{
			//1개씩 날아오는 메시지 받는 함수
			jsonTextParse(event.data);
	    	
			//메시지가 오면 채팅방 위치 재배열
	    	updateChatRoom();	
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

		ws.error=function(event)
		{
			console.log(event);
		}

		if(${chatMember.size()>0})
		{
			jsonData.receiver='${receiver}';
			jsonData.roomId='${roomId}';
			$('#selectName').html('${memberName}');
			var img ='<img width="80px" height="80px" src="${path}/resources/upload/profile/${imageUrl}" alt="상대방 사진">';
			$('#selectImage').html(img);
			jsonData.imagUrl = "${imageUrl}";
		}
		
		if(${chatContent.size()>0})
		{
			jsonData.receiver='${receiver}';
			jsonData.roomId='${roomId}';
			$('#selectName').html('${memberName}');
			var img ='<img width="80px" height="80px" src="${path}/resources/upload/profile/${imageUrl}" alt="상대방 사진">';
			$('#selectImage').html(img);
			jsonData.imagUrl = "${imageUrl}";
		}
		
		//엔터로 전송하는 코드
		$("#messageInput").keypress(function(e){ 
		    if (e.keyCode == 13)
		    {
		        MessageSend();
		    }    
		});
		
    });
    
    //메시지 보내는 기능
    function MessageSend()
	{
    	if(jsonData.receiver==null)
    	{
    		alert("채팅방을 선택하세요!");
    		return;
    	}
    	if($('#messageInput').val().trim().length==0)
    	{
    		alert("메시지를 입력하세요!");
    		return;	
    	}
    	
		jsonData.text = $('#messageInput').val();
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
    		url:"${path}/community/bringMessage.do",
    		data:{"roomId":$(e).children('#roomId').val()},
    		success:function(data)
    		{
    			console.log(data);
    			var name="";
    			//여기해야함
    			var imageUrl="";
    			var nameImg="";
    			for(var i=0;i<data.chatList.length;i++)
    			{
    				                                                      
    				if(data.chatList[i].SENDER=='${logined.memberId}')
        			{
    					/* name = data.chatList[i].MEMBERNAME;
    					imageUrl = data.chatList[i].PROFILEIMAGERE; */
    					
						var right ="<div >";
						right +="<p class='right' style='clear:both'>"+(decodeURIComponent(data.chatList[i].CCONTENT)).replace(/\+/g," ")+"</p>";
						right +="</div>";
    					allMsg +=right;
    					jsonData.imageUrl =data.chatList[i].PROFILEIMAGERE;
    					//스타일 주고 오른쪽으로 붙임,내가 보낸 메시지
        			}
        			else{
        				name ='<span id="selectImage"><img width="80px" height="80px" src="${path}/resources/upload/profile/'+data.chatList[i].PROFILEIMAGERE+'" alt="상대방사진"></span>';
    		        	nameImg ='<span id="selectName">'+data.chatList[i].MEMBERNAME+'</span>';
        				var left = "<div class='msgDivLeft'>";
        				left +="<img class='left' style='clear:both' width='40px' height='40px' src='${path}/resources/upload/profile/"+data.chatList[i].PROFILEIMAGERE+"' alt='회원사진'/>";
        				left +="<p class='left' >"+(decodeURIComponent(data.chatList[i].CCONTENT)).replace(/\+/g," ")+"</p>";
        				left +="</div>";
    					allMsg +=left;
    					
        				//스타일 주고 왼쪽에 이미지와 함께 붙임,상대방 메시지
        			}
    				
    			}
    			
    			name +=nameImg;
    			$('#selectUserInfo').html(name);
    			$('#insertContent').html(allMsg);
    			allMsg="";
    			updateChatRoom();
    			
    			//스크롤 자동 최신화
    			var chatAreaHeight = $("#chatContent").height();
    	        var maxScroll = $("#insertContent").height() - chatAreaHeight;
    	        $("#chatContent").scrollTop(maxScroll);
    	        
    		}
    	});

    }
     
     function updateChatRoom()
    {
    	$.ajax({
    		url:"${path}/community/updateRoom.do",
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
        			updateRoom +='<span class="recentMsg">'+data.chatRooms[i].cContent+'</span>';
        			
        			if(data.chatRooms[i].isReadCount>0)
        			{
        				updateRoom +='<span class="msgCount">'+data.chatRooms[i].isReadCount+'</span>';
        			}

        			updateRoom +='</div></div>';
        			
    			}
    			$('#chatRooms').html(updateRoom);
    		}
    	});
    }
     
    //사본 생성
    function updateChatRoomCK(roomId)
    {
    	$.ajax({
    		url:"${path}/community/updateRoom.do",
    		data:{"roomId":roomId},
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
        			updateRoom +='<span class="recentMsg">'+data.chatRooms[i].cContent+'</span>';
        			
        			if(data.chatRooms[i].isReadCount>0)
        			{
        				updateRoom +='<span class="msgCount">'+data.chatRooms[i].isReadCount+'</span>';
        			}

        			updateRoom +='</div></div>';
        			
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
    		updateChatRoomCK(json.roomId);
    		//보낸 사람이 자기 자신이면 오른쪽에 메시지 붙임
	    	if(json.sender=='${logined.memberId}')
			{
				var right = "<div >";
				right +="<p class='right' style='clear:both'>"+json.text+"</p>";
				right +="</div>";
				
				//스타일 주고 오른쪽으로 붙임,내가 보낸 메시지
				$('#insertContent').append(right);
			}
    		//보낸 사람이 내가 아니라면 왼쪽에 메시지 붙임
			else
			{
				var left = "<div class='msgDiv'>";
				
				src='${path}/resources/upload/profile/"+data.chatList[i].PROFILEIMAGERE+"'
				
				left +="<img class='left' style='clear:both' width='40px' height='40px' src='${path}/resources/upload/profile/"+json.imageUrl+"' alt='회원사진'/>";
				left +="<p class='left' >"+json.text+"</p>";
				left +="</div>";
				
				//스타일 주고 왼쪽에 이미지와 함께 붙임,상대방 메시지
				$('#insertContent').append(left);
			}
    		
	    	//스크롤 자동 최신화
	    	var chatAreaHeight = $("#chatContent").height();
	        var maxScroll = $("#insertContent").height() - chatAreaHeight;
	        $("#chatContent").scrollTop(maxScroll);
	        
    	}
    
    }
    
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>