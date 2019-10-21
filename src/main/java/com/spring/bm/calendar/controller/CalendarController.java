package com.spring.bm.calendar.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.bm.calendar.model.service.CalendarService;



@Controller
public class CalendarController {
	
	private Logger logger=LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	CalendarService service;
	
	/* 일정관리첫페이지로 이동 */
	@RequestMapping("/calendar/allView.do")	//사원등록 폼으로 전환
	public String allView() {
		return "/calendar/calendarAll";
	}

}
