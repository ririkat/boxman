package com.spring.bm.note.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoteDaoImpl implements NoteDao {

	@Override
	public int updateNote(SqlSessionTemplate session, Map<String, Object> map) {
		return session.update("note.noteUpdate", map);
	}

}
