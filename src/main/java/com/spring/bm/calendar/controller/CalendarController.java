package com.spring.bm.calendar.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.calendar.model.service.CalendarService;
import com.spring.bm.calendar.model.vo.Calendar;



@Controller
public class CalendarController {
	
	private Logger logger=LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	CalendarService service;
	
	/* 일정관리첫페이지로 이동 */
	@RequestMapping("/calendar/allView.do")	//사원등록 폼으로 전환
	public String allView(Model model) {
		List<Map<String, Object>> list = service.selectScheCategory();
		model.addAttribute("list", list);
		return "calendar/calendarAll";
	}
	
	//등록페이지로 이동
	@RequestMapping("/calendar/insertCalendar.do")
	public ModelAndView insertView() {
		
		List<Map<String, Object>> list = service.selectScheCategory();

		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list",list);
		mv.setViewName("calendar/calendarEnroll");
		
		return mv;
	}
	
	//스케줄 등록
	@RequestMapping("/calendar/insertCalendarEnd.do")
	public @ResponseBody int insertCalendar(@RequestParam Map<String,Object> param) {
		
		for ( String key : param.keySet() ) {
		    System.out.println("key : " + key +" / value : " + param.get(key));
		}
		
		int result = service.insertCalender(param);
		

		
		return result;
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
	
	@RequestMapping("/calendar/selectCalendarEmpNo.do")
	public @ResponseBody List<Calendar> selectcCalendarEmpNo (int empNo) {
		
		List<Calendar> list = service.selectCalendarEmpNo(empNo);
		System.out.println("리스트 잘 나오냐 : " + list);
		
		return list;
		
	}

}
