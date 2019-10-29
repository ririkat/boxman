package com.spring.bm.note.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class NoteController {
	
	
	
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
	public String saveNote(String note, HttpServletResponse response) throws JsonProcessingException {
		
		return "/";
	}
	
}
