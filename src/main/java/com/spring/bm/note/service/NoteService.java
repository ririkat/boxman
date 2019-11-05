package com.spring.bm.note.service;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface NoteService {

	int updateNote(Map<String, Object> map);

	
}
