package com.spring.bm.calendar.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.calendar.model.service.CalendarService;



@Controller
public class CalendarController {
	
	private Logger logger=LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	CalendarService service;
	
	/* 일정관리첫페이지로 이동 */
	@RequestMapping("/calendar/allView.do")	//사원등록 폼으로 전환
	public String allView() {
		return "calendar/calendarAll";
	}
	//등록페이지로 이동
	@RequestMapping("/calendar/insertCalendar.do")
	public ModelAndView insertView() {
		
		List<Map<String, Object>> list = service.selectScheCategory();
		System.out.println("찍어봐야겠녜"+list);
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list",list);
		mv.setViewName("calendar/calendarEnroll");
		
		return mv;
	}
	//스케줄 등록
	@RequestMapping("/calendar/insertCalendarEnd.do")
	public ModelAndView insertCalendar(@RequestParam Map<String,Object> param) {
		
		int result = service.insertCalender(param);
		
		String msg="";
		String loc="/calendar/allView.do";
		if(result>0) {
			msg="스케줄이 등록 되었습니다.";
		}else {
			msg="스케줄이 등록되지 않았습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	//스케줄 수정
	@RequestMapping("/calendar/updateCalendar.do")
	public ModelAndView updateCalendar(@RequestParam Map<String,Object> param) {
		
		int result = service.updateCalendar(param);
		
		String msg="";
		String loc="/calendar/allView.do";
		if(result>0) {
			msg="스케줄 수정이 완료되었습니다.";
		}else {
			msg="스케줄 수정에 실패하였습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}

}
