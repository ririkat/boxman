package com.spring.bm.note.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.bm.note.service.NoteService;

@Controller
public class NoteController {
	
	@Autowired
	NoteService service;
	
	@RequestMapping("/note/saveCache.do")
	@ResponseBody
	public String saveCache(String note, HttpServletResponse response) throws JsonProcessingException {
		Cookie noteCookie = new Cookie("note", note);
		noteCookie.setMaxAge(60*60*24*365);
		noteCookie.setPath("/");
		
		response.setCharacterEncoding("UTF-8");
		response.addCookie(noteCookie);
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(note);
	}
	
	@RequestMapping("/note/saveNote.do")
	@ResponseBody
	public void saveNote(String note, int empNo, HttpServletResponse response) throws JsonProcessingException {
		
		Map<String, Object> map = new HashMap();
		try {
			map.put("empNo", empNo);
			map.put("note", note);
			int result = service.updateNote(map);
		} catch (NullPointerException e) {
			
		}
		
	}
	
	
}
