package com.spring.bm.chat.controller;

import java.util.HashMap;
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
import com.spring.bm.chat.model.vo.ChatRoom;

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
	public String chatRoom(@RequestParam(name="receiver") int receiver, @RequestParam(name="sender") int sender, Model model) {

		  Map<String,Object> m = new HashMap();
		  m.put("receiver", receiver);
		  m.put("sender", sender);
		  System.out.println("리시버 =======>"+receiver);
		  System.out.println("샌더 =======>"+sender);
		  int result = 0;
		  ChatRoom chatroom = service.chatRoom(m);
		  List<Chat> list = null;
		  ChatRoom cr = null;
		  
		  String loc="";
		  
		  if(chatroom  != null ) {
			  
			  System.out.println("방 있음");
			  
			  loc="chat/chatRoom";
			  cr = service.selectChatRoom(m);
			  list = service.seletChat(cr.getRoomNo());
		  }else {
			  result = service.createChatRoom(m);
			  
			  loc = "stuff/stuffList";

		  }
		  
	      model.addAttribute("list",list);
	      model.addAttribute("cr",cr);

	      return loc;

	}

}
