package com.spring.bm.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class VideoController {
	
	@RequestMapping("/chat/videoRequest.do")
	public String viewChatting(@RequestParam(name="receiver") int receiver, @RequestParam(name="sender") int sender, Model model) {
		System.out.println(receiver);
		System.out.println(sender);
		
		model.addAttribute("sender", sender);
		model.addAttribute("receiver", receiver);
		
		return "chat/videochat";
	}
	
}
