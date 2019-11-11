package com.spring.bm.vc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VideoChatController {

	// 화상채팅 구현
		@RequestMapping("/viewChatting.do")
		public String videoChat() {
			return "chat/videochat";
		}
}
