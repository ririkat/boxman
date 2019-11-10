package com.spring.bm.common.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.calendar.model.service.CalendarService;
import com.spring.bm.calendar.model.vo.Calendar;

@Controller
public class CommonController {
	
	@Autowired
	CalendarService calService;
	
	@RequestMapping("/common/main.do")
	public ModelAndView toMain(@RequestParam Map<String, Object> param) {
		
		System.out.println("혹시? : " + param);
		
		int empNo = Integer.parseInt(param.get("empNo").toString());
		
		ModelAndView mv = new ModelAndView();
		
		//내 일정 불러오는 목록(달력을 못넣을시 사용)
		//사원번호로 일정 목록 조회
		List<Calendar> calList = calService.selectCalendarEmpNo2(empNo);
		mv.addObject("calList", calList);
		mv.setViewName("common/main");
		
		return mv;
	}
	

}
