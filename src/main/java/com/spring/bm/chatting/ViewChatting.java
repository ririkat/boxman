package com.spring.bm.chatting;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.BinaryWebSocketHandler;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.bm.chat.model.service.ChatService;
import com.spring.bm.chat.model.vo.Chat;

public class ViewChatting extends BinaryWebSocketHandler{
	//session 관리를 직접해줘야함.
	// websocket 에 접속한 session 관리하기!
	
	
	  @Autowired 
	  ChatService service;
	 
	
	private static Map<String,WebSocketSession> clients = new HashMap();

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) { // 얘가 onmessage 라고 생각해라
		// client 가 보낸 데이터를 JSON 데이터를 파싱처리하기 위해 JACKSON 를 사용
		ObjectMapper mapper = new ObjectMapper();
		RTCMessage msg = getMessageObject(message); // 메세지 파싱용 메소드
		
		session.getAttributes().put(String.valueOf(msg.getEmpNo()), msg); // session 객체에 보낸 메세지를 저장
		// session 관리를 위해 clients 객체에 세션을 추가
		clients.put(String.valueOf(msg.getEmpNo()), session);
		sessionChecking(); // 접속이 종료된 session 을 client 에서 삭제함.
		
		//접속한 회원을 보내기
		//adminBroadCast(); // 현재 접속회원 접속자에게 전송하기
		
		// 화면 연결하는 로직 구성
		for(Map.Entry<String, WebSocketSession> client: clients.entrySet()) {
			WebSocketSession s = client.getValue();
			if(!client.getKey().equals(msg.getEmpNo())) {
				try {
					s.sendMessage(new TextMessage(mapper.writeValueAsString(msg)));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		int result = service.insertChat(msg);		
		
	}
	
//	private void adminBroadCast() {
//		ObjectMapper mapper = new ObjectMapper();
//		RTCMessage msg = new RTCMessage();
//		msg.setEmpNo(msg.getEmpNo());
//		msg.setSender(msg.getSender());
//		try {
//			for(Map.Entry<String, WebSocketSession> client : clients.entrySet()) {
//				client.getValue().sendMessage(new TextMessage(mapper.writeValueAsString(msg)));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	private void sessionChecking() {
		Iterator<Map.Entry<String, WebSocketSession>> it=clients.entrySet().iterator();
		while(it.hasNext()) {
			Map.Entry<String, WebSocketSession> client = it.next();
			if(!client.getValue().isOpen()) {
				it.remove();
			}
		}
	}
	
	
	private RTCMessage getMessageObject(TextMessage message) {
		ObjectMapper mapper = new ObjectMapper();
		RTCMessage m = null;
		try {
			m = mapper.readValue(message.getPayload(), RTCMessage.class);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return m;
	}
	
}