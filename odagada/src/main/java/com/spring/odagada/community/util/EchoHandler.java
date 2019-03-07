package com.spring.odagada.community.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<Object, Object> userList = new HashMap();

	// 클라이언트와 연결 이후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 접속된 session들을 List에 저장. 현재 어떤 유저가 접속해 있는지 확인 가능
		sessionList.add(session);
		logger.info(session.getId() + "님이 연결 되었습니다.");
	}

	// 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info(session.getId() + "님 으로부터 메시지를 받음, 내용 : " + message.getPayload());

		// JSON.stringify로 넘어온 데이터 JSON형태로 다시 복원
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(message.getPayload());
		JSONObject json = (JSONObject) obj;

		logger.info("넘어온 JSON 확인 : "+json);

		// 유저가 접속했을 때 자동으로 userList에 추가
		if (json.get("myId") != null) {
			userList.put(json.get("myId"), session);
			logger.info(userList + "");
		}

		// 연결이 끊어졌을 때 userList에서 제거
		if (json.get("deleteId") != null) {
			userList.remove(json.get("deleteId"));
		}
		

		// 연결하거나 끊을 땐 text가 null이라 조건을 줌
		if (json.get("myId") == null && json.get("deleteId") == null) {
			
			//vo객체에 데이터 담고 DB에 채팅 내용 저장 
			MessageVo msg = new MessageVo((String)json.get("roomId"),(String)json.get("receiver"),(String)json.get("sender"),(String)json.get("text"));
			logger.info(msg+"");
			int rs = service.saveMessage(msg);
			
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
		logger.debug(""+session);
		sessionList.remove(session);
		logger.info(session.getId() + "님의 연결이 끊어졌습니다.");
	}

}
