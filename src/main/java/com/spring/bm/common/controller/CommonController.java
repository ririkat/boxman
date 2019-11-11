package com.spring.bm.common.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.calendar.model.service.CalendarService;
import com.spring.bm.calendar.model.vo.Calendar;
import com.spring.bm.notice.model.service.NoticeService;
import com.spring.bm.notice.model.vo.Notice;

@Controller
public class CommonController {

	@Autowired
	CalendarService calService;
	@Autowired
	NoticeService noticeService;

	@RequestMapping("/common/main.do")
	public ModelAndView toMain(@RequestParam Map<String, Object> param, HttpSession session) {

		Map<String, Object> map = (Map)session.getAttribute("loginEmp");
		int empNo = Integer.parseInt(String.valueOf(map.get("EMPNO")));

		ModelAndView mv = new ModelAndView();

		//내 일정 불러오는 목록(달력을 못넣을시 사용)
		//사원번호로 일정 목록 조회
		List<Calendar> calList = calService.selectCalendarEmpNo2(empNo);

		//공지사항 조회
		List<Notice> noticeList = noticeService.selectNoticeList2();

		mv.addObject("noticeList", noticeList);
		mv.addObject("calList", calList);
		mv.setViewName("common/main");

		return mv;
	}


}