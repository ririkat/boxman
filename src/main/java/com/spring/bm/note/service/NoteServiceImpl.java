package com.spring.bm.note.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.note.dao.NoteDao;

@Service
public class NoteServiceImpl implements NoteService {
	
	@Autowired
	NoteDao dao;
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public int updateNote(Map<String, Object> map) {
		return dao.updateNote(session, map);
	}


}
