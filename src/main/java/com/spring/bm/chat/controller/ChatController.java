package com.spring.bm.chat.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.chat.model.service.ChatService;

@Controller
public class ChatController {

	@Autowired
	ChatService service;
	
	@RequestMapping("/chat/chatList.do")
	public ModelAndView ChatList() {
		
		ModelAndView mv = new ModelAndView();
	    List<Map<String,String>> list = service.selectChatList();
	    System.out.println("controller 에서 list 찍은거 ====>>>"+list);
	    mv.addObject("list", list);
	    mv.setViewName("chat/chatList");
		
		return mv;
		
	}
	
}
