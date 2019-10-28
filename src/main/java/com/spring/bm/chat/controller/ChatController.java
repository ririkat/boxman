package com.spring.bm.chat.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.chat.model.service.ChatService;
import com.spring.bm.chat.model.vo.Chat;

@Controller
public class ChatController {

	@Autowired
	ChatService service;
	
	//모든사원리스트
	@RequestMapping("/chat/chatList.do")
	public ModelAndView ChatList() {
		
		ModelAndView mv = new ModelAndView();
	    List<Map<String,String>> list = service.selectChatList();
	    mv.addObject("list", list);
	    mv.setViewName("chat/chatList");
		
		return mv;
		
	}
	//선택한 사원과의 채팅방
	@RequestMapping("/chat/chatRoom.do")
	public String chatRoom(@RequestParam(name="empNo") int empNo, Model model) {

		  List<Map<String,String>> list = service.selectChatListEmp(empNo);
		  Chat chat = service.selectChatOneEmp(empNo);
		  System.out.println("list찍어봅시다 ==>"+list);
		  System.out.println("쳇!!!!!!!!!!!!!!!!!!!!!!!"+chat);
		  model.addAttribute("chat",chat);
	      model.addAttribute("list",list);

	      return "chat/chatRoom";

	}

}
