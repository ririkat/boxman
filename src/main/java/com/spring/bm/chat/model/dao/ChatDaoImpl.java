package com.spring.bm.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.bm.chat.model.vo.Chat;
import com.spring.bm.chatting.RTCMessage;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Override
	public List<Map<String, String>> selectChatList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("chat.selectChatList");
	}

	@Override
	public List<Map<String, String>> selectChatListEmp(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectList("chat.selectChatListEmp", empNo);
	}

	@Override
	public Chat selectChatOneEmp(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("chat.selectChatOneEmp",empNo);
	}

	@Override
	public int insertChat(SqlSessionTemplate sqlSession, RTCMessage msg) {
		return sqlSession.insert("chat.insertchatting",msg);
		}
	
	
	

}
