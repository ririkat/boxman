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
		return "calendar/calendarAll";
	}

	//스케줄 등록
	@RequestMapping("/calendar/insertCalendarEnd.do")
	public @ResponseBody int insertCalendar(@RequestParam Map<String,Object> param) {
		
		for ( String key : param.keySet() ) {
		    System.out.println("key : " + key +" / value : " + param.get(key));
		}

		int result = service.insertCalender(param); System.out.println("잘나오냐 : " + result);
		 


		 return result;
	
	}
	
	//스케줄 조회
	@RequestMapping("/calendar/selectCal.do")
	public @ResponseBody List<Calendar> selectCal(@RequestParam(value = "username") int username){
		
		System.out.println(username);
		List<Calendar> list = service.selectCalendarEmpNo(username);
		
		return list;
	}
//	//스케줄 수정
//	@RequestMapping("/calendar/updateCalendar.do")
//	public ModelAndView updateCalendar(@RequestParam Map<String,Object> param) {
//		
//		int result = service.updateCalendar(param);
//		
//		String msg="";
//		String loc="/calendar/allView.do";
//		if(result>0) {
//			msg="스케줄 수정이 완료되었습니다.";
//		}else {
//			msg="스케줄 수정에 실패하였습니다.";
//		}
//		
//		ModelAndView mv = new ModelAndView();
//		
//		mv.addObject("msg",msg);
//		mv.addObject("loc",loc);
//		mv.setViewName("common/msg");
//		
//		return mv;
//	}

}
