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
	
	Cookie noteCookie;
	
	@Autowired
	NoteService service;
	
	@RequestMapping("/note/saveCache.do")
	@ResponseBody
	public String saveCache(String note, HttpServletResponse response) throws JsonProcessingException {
		noteCookie = new Cookie("note", note);
		noteCookie.setMaxAge(60*60*24*365);
		noteCookie.setPath("/");
		
		response.setCharacterEncoding("UTF-8");
		response.addCookie(noteCookie);
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(note);
	}
	
	@RequestMapping("/note/saveNote.do")
	@ResponseBody
	public void saveNote(int empNo, HttpServletResponse response) throws JsonProcessingException {
		
		Map<String, Object> map = new HashMap();
		map.put("empNo", empNo);
		map.put("noteCookie", noteCookie.getValue());
		System.out.println("///////////////");
		System.out.println(noteCookie.getValue());
		int result = service.updateNote(map);
		
	}
	
}
