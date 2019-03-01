<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="오다가다 타는 카풀" name="pageTitle"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<div>
	<input type="text" id="messageinput">
</div>

<div>
	<button onclick="openSocket();">채팅연결하기</button>
	<button onclick="send();">전송</button>
	<button onclick="closeSocket();">채팅 끊기</button>
</div>

<div id="message"></div>
<script>
	var ws;
	var url="http://localhost:9090/odagada/echo";
	
	function openSocket()
	{
		if(ws!==undefined && ws.readyState!==WeSocket.CLOSED)
		{
			writeResponse("WebSocket is already opend");
			return;
		};
		
		ws = new SockJS(url);
		
		ws.onmessage = function(event){
			writeResponse(event.data);
		};
		ws.onopen = function(event){
			if(data===undefined) return;
			writeResponse(event.data);
		};
		ws.onclose = function(){
			writeResponse("Connection Closed");
		};
	}
	
	function send()
	{
		var text = $('#messageinput').val();
		ws.send(text);
		text.val("");
	}
	
	function closeSocket()
	{
		ws.close();
	}
	
	function writeResponse(text){
		message.innerHTML +="<br/>"+text;
	}
	
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>