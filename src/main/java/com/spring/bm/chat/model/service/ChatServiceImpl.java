package com.spring.bm.chat.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.chat.model.dao.ChatDao;
import com.spring.bm.chat.model.vo.Chat;
import com.spring.bm.chat.model.vo.ChatRoom;
import com.spring.bm.chatting.RTCMessage;
import com.spring.bm.employee.model.vo.Employee;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	ChatDao dao;
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectChatList() {
		return dao.selectChatList(sqlSession);
	}
	
	@Override
	public List<Map<String, String>> selectChatListEmp(int empNo) {
		return dao.selectChatListEmp(sqlSession, empNo);
	}

	@Override
	public Employee selectChatOneEmp(int empNo) {
		return dao.selectChatOneEmp(sqlSession, empNo);
	}

	@Override
	public int insertChat(RTCMessage msg) {
		return dao.insertChat(sqlSession, msg);
	}

	@Override
	public int createChatRoom(Map<String,Object> m) {
		return dao.createChatRoom(sqlSession, m);
	}

	@Override
	public ChatRoom chatRoom(Map<String, Object> m) {
		return dao.chatRoom(sqlSession, m);
	}

	@Override
	public ChatRoom selectChatRoom(Map<String, Object> m) {
		return dao.selectChatRoom(sqlSession,m);
	}

	@Override
	public List<Chat> seletChat(int roomNo) {
		return dao.selectChat(sqlSession,roomNo);
	}

	@Override
	public int selectEmpno(int receiver) {
		// TODO Auto-generated method stub
		return dao.selectEmpno(sqlSession, receiver);
	}

	@Override
	public List<Map<String, String>> searchEmp(String data) {
		return dao.searchEmp(sqlSession, data);
	}

	@Override
	public int noReadCount(int userId) {
		return dao.noReadCount(sqlSession, userId);
	}

	@Override
	public int updateReadCount(Map<String, Object> m) {
		return dao.updateReadCount(sqlSession, m);
	}

	
}
