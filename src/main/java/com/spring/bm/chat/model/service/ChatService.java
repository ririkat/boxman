package com.spring.bm.chat.model.service;

import java.util.List;
import java.util.Map;

import com.spring.bm.chat.model.vo.Chat;
import com.spring.bm.chatting.RTCMessage;

public interface ChatService {

	//직원리스트 띄어주기
	List<Map<String, String>> selectChatList();
	//사원클릭시 일치하는 사원의 채팅방연결 (리스트)
	List<Map<String, String>> selectChatListEmp(int empNo);
	//사원클릭시 일치하는 사원의 채팅방연결 (하나)
	Chat selectChatOneEmp(int empNo);
	//채팅방에서 입력한 내용 DB저장
	int insertChat(RTCMessage msg);

}
