package com.spring.bm.chat.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.chat.model.dao.ChatDao;

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
	
	
}
