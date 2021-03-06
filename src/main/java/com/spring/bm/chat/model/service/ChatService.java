package com.spring.bm.chat.model.service;

import java.util.List;
import java.util.Map;

import com.spring.bm.chat.model.vo.Chat;
import com.spring.bm.chat.model.vo.ChatRoom;
import com.spring.bm.chatting.RTCMessage;
import com.spring.bm.employee.model.vo.Employee;

public interface ChatService {

	//직원리스트 띄어주기
	List<Map<String, String>> selectChatList();
	//사원클릭시 일치하는 사원의 채팅방연결 (리스트)
	List<Map<String, String>> selectChatListEmp(int empNo);
	//사원클릭시 일치하는 사원의 채팅방연결 (하나)
	Employee selectChatOneEmp(int empNo);
	//채팅방에서 입력한 내용 DB저장
	int insertChat(RTCMessage msg);
	//채팅방 생성 (조회해서 없으면 생성)
	int createChatRoom(Map<String,Object> m);
	//채팅방 조회 (있는지 없는지 확인)
	ChatRoom chatRoom(Map<String, Object> m);
	//채팅방 번호조회
	ChatRoom selectChatRoom(Map<String, Object> m);
	//채팅방 번호를 이용한 채팅내역 조회
	List<Chat> seletChat(int roomNo);
	//send할때 보내는 상대방 no
	int selectEmpno(int receiver);
	//사원명으로 조회(채팅방에서)
	List<Map<String, String>> searchEmp(String data);
	//안읽은메세지 
	int noReadCount(int userId);
	//readcount +1 (메세지읽음처리)
	int updateReadCount(Map<String, Object> m);
	//안읽은채팅 아이콘 보여주기
	List<Map<String, String>> selectReadCount(Map<String, String> param);
}
