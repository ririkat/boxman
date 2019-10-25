package com.spring.bm.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface ChatDao {

	List<Map<String, String>> selectChatList(SqlSessionTemplate sqlSession);

}
