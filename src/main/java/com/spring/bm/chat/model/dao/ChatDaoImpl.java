package com.spring.bm.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.bm.chat.model.vo.Chat;
import com.spring.bm.chat.model.vo.ChatRoom;
import com.spring.bm.chatting.RTCMessage;
import com.spring.bm.employee.model.vo.Employee;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Override
	public int selectEmpno(SqlSessionTemplate sqlSession, int receiver) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chat.selectEmpno", receiver);
	}

	@Override
	public List<Map<String, String>> selectChatList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("chat.selectChatList");
	}

	@Override
	public List<Map<String, String>> selectChatListEmp(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectList("chat.selectChatListEmp", empNo);
	}

	@Override
	public Employee selectChatOneEmp(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("chat.selectChatOneEmp",empNo);
	}

	@Override
	public int insertChat(SqlSessionTemplate sqlSession, RTCMessage msg) {
		return sqlSession.insert("chat.insertchatting",msg);
		}

	@Override
	public int createChatRoom(SqlSessionTemplate sqlSession, Map<String, Object> m) {
		return sqlSession.insert("chat.createChatRoom",m);
	}

	@Override
	public ChatRoom chatRoom(SqlSessionTemplate sqlSession, Map<String, Object> m) {
		return sqlSession.selectOne("chat.chatRoom",m);
	}

	@Override
	public ChatRoom selectChatRoom(SqlSessionTemplate sqlSession, Map<String, Object> m) {
		return sqlSession.selectOne("chat.selectChatRoom",m);
	}

	@Override
	public List<Chat> selectChat(SqlSessionTemplate sqlSession, int roomNo) {
		return sqlSession.selectList("chat.selectChat",roomNo);
	}

	@Override
	public List<Map<String, String>> searchEmp(SqlSessionTemplate sqlSession, String data) {
		return sqlSession.selectList("chat.searchEmp",data);
	}

	@Override
	public int noReadCount(SqlSessionTemplate sqlSession, int userId) {
		return sqlSession.selectOne("chat.noReadCount",userId);
	}

	@Override
	public int updateReadCount(SqlSessionTemplate sqlSession, Map<String, Object> m) {
		return sqlSession.update("chat.updateReadCount",m);
	}
	
}
