package com.spring.bm.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.bm.chat.model.vo.Chat;
import com.spring.bm.chatting.RTCMessage;

public interface ChatDao {

	List<Map<String, String>> selectChatList(SqlSessionTemplate sqlSession);

	List<Map<String, String>> selectChatListEmp(SqlSessionTemplate sqlSession, int empNo);

	Chat selectChatOneEmp(SqlSessionTemplate sqlSession, int empNo);

	int insertChat(SqlSessionTemplate sqlSession, RTCMessage msg);

}
