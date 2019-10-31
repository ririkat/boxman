package com.spring.bm.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.bm.chat.model.vo.Chat;
import com.spring.bm.chat.model.vo.ChatRoom;
import com.spring.bm.chatting.RTCMessage;
import com.spring.bm.employee.model.vo.Employee;

public interface ChatDao {

	List<Map<String, String>> selectChatList(SqlSessionTemplate sqlSession);

	List<Map<String, String>> selectChatListEmp(SqlSessionTemplate sqlSession, int empNo);

	Employee selectChatOneEmp(SqlSessionTemplate sqlSession, int empNo);

	int insertChat(SqlSessionTemplate sqlSession, RTCMessage msg);

	int createChatRoom(SqlSessionTemplate sqlSession, Map<String, Object> m);

	ChatRoom chatRoom(SqlSessionTemplate sqlSession, Map<String, Object> m);

	ChatRoom selectChatRoom(SqlSessionTemplate sqlSession, Map<String, Object> m);

	List<Chat> selectChat(SqlSessionTemplate sqlSession, int roomNo);

	int selectEmpno(SqlSessionTemplate sqlSession, int receiver);

	List<Map<String, String>> searchEmp(SqlSessionTemplate sqlSession, String data);

	int noReadCount(SqlSessionTemplate sqlSession, int userId);

	int updateReadCount(SqlSessionTemplate sqlSession, Map<String, Object> m);

}
