package com.spring.bm.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDaoImpl implements ChatDao {

	@Override
	public List<Map<String, String>> selectChatList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("chat.selectChatList");
	}
	
	

}
