package com.spring.odagada.community.util;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

public class EchoHandler extends TextWebSocketHandler {
	
	 private Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	 private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
     
     // 클라이언트와 연결 이후에 실행되는 메서드
     @Override
     public void afterConnectionEstablished(WebSocketSession session) throws Exception {
       //접속된 session들을 List에 저장. 현재 어떤 유저가 접속해 있는지 확인 가능
       sessionList.add(session);
       logger.debug(session.getId()+"님이 연결 되었습니다.");
     }
    
     // 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
     @Override
     protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
       logger.debug(session.getId()+"님 으로부터 메시지를 받음, 내용 : "+message.getPayload());
       JSONObject json = new JSONObject();
       JsonParser jsonParser = new JsonParser();
       
       
       for (WebSocketSession sess : sessionList) {
         sess.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
       }
     }
    
     // 클라이언트와 연결을 끊었을 때 실행되는 메소드
     @Override
     public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
       sessionList.remove(session);
       logger.debug(session.getId()+"님의 연결이 끊어졌습니다.");
     }
	
}
