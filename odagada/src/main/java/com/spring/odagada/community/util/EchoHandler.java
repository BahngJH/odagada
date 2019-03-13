package com.spring.odagada.community.util;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.odagada.community.model.service.CommunityService;
import com.spring.odagada.community.model.vo.MessageVo;

public class EchoHandler extends TextWebSocketHandler {
	
	@Autowired
	CommunityService service;

	private Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private Map<Object, Object> userList = new HashMap<Object, Object>();
	private Map<Object, Object> sessionMap = new HashMap<Object, Object>();

	// 클라이언트와 연결 이후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//처음 접속 했을 때 실행되는 함수
	}

	// 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		// JSON.stringify로 넘어온 데이터 JSON형태로 다시 복원
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(message.getPayload());
		JSONObject json = (JSONObject) obj;

		logger.debug("메시지 받아서 JSON파싱한 데이터 : "+json);

		// 유저가 접속했을 때 자동으로 userList에 추가
		if (json.get("myId") != null) {
			// 아이디 : session값 으로 map에 추가함.
			userList.put(json.get("myId"), session);
			
			//접속 끊길 때 끊어진 session으로 id를 찾기 위함
			sessionMap.put(session, json.get("myId"));
			logger.debug(sessionMap.get(session)+"님이 접속 하셨습니다.");
		}

		//로그인하면 세션정보 담는 메시지와 채팅하는 메시지를 구분하기 위한 조건
		if (json.get("myId") == null) {
			
			//vo객체에 데이터 담고 DB에 채팅 내용 저장 
			MessageVo msg = new MessageVo((String)json.get("roomId"),(String)json.get("receiver"),(String)json.get("sender"),(String)json.get("text"));
			logger.debug(msg+"");
			
			int rs = service.saveMessage(msg);
			
			Map<String,Object> isreadData = new HashMap();
			isreadData.put("loginId", json.get("sender"));
			isreadData.put("roomId", json.get("roomId"));
			
			int rs2 = service.checkedMessage(isreadData);
			
			//메세지는 자기자신과 상대방에게 모두 보내야함, 먼저 나부터 보냄
			WebSocketSession sender = (WebSocketSession)userList.get(json.get("sender"));
			sender.sendMessage(new TextMessage(message.getPayload()));
			
			//userList에 json.get("reciver")로 일치하는 항목이 있다면 해당 유저 접속중, 그러면 메시지를 보낸다.
			if(userList.get(json.get("receiver"))!=null) {
				WebSocketSession reciver = (WebSocketSession) userList.get(json.get("receiver"));
				reciver.sendMessage(new TextMessage(message.getPayload()));
			}
		}
	}

	// 클라이언트와 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//session으로 삭제할 아이디를 찾는다
		Object deleteId = sessionMap.get(session);
		logger.debug(sessionMap.get(session)+"님의 연결이 끊어졌습니다.");
		
		//로그아웃한 유저 삭제
		userList.remove(deleteId);
		sessionMap.remove(session);
		
	}
	
	

}
