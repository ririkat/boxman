package com.spring.bm.note.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface NoteDao {

	int updateNote(SqlSessionTemplate session, Map<String, Object> map);

}
