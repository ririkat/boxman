package com.spring.bm.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.notice.model.service.NoticeService;
import com.spring.bm.notice.model.vo.Notice;

@Controller
public class CommonController {
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/common/main.do")
	public ModelAndView toMain() {
		
		List<Notice> noticeList = noticeService.selectNoticeList2();
		System.out.println("공지사항이 보일라나???"+noticeList);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("noticeList", noticeList);
		mv.setViewName("common/main");
		
		return mv;
	}
	

}
