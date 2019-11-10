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
import com.spring.bm.common.PageBarFactory;
import com.spring.bm.common.PageUrlFactory;

@Controller
public class CalendarController {

	private Logger logger = LoggerFactory.getLogger(CalendarController.class);

	@Autowired
	CalendarService service;

	private PageUrlFactory path = new PageUrlFactory();

	/* 일정관리첫페이지로 이동 */
	@RequestMapping("/calendar/allView.do") // 사원등록 폼으로 전환
	public ModelAndView allView(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage,
			Model model, @RequestParam(value = "data") int param) {

		int numPerPage = 5;

		ModelAndView mv = new ModelAndView();

		// 스케줄 조회 페이징처리
		List<Calendar> list = service.selectCalendarEmpNo(cPage, numPerPage, param);
		int totalCount = service.selectCalendarCount2(param);

		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage,
				path.getUrl() + "/calendar/allView.do", "" + param));
		mv.addObject("list", list);
		mv.addObject("count", totalCount);
		mv.setViewName("calendar/calendarAll");

		return mv;
	}

	// 스케줄 등록
	@RequestMapping("/calendar/insertCalendarEnd.do")
	public @ResponseBody Calendar insertCalendar(@RequestParam Map<String, Object> param) {

		Calendar c = service.insertCalender(param);

		return c;

	}

	// 스케줄 조회
	@RequestMapping("/calendar/selectCal.do")
	public @ResponseBody List<Calendar> selectCal(@RequestParam(value = "data") int data) {

		List<Calendar> list = service.selectCalendarEmpNo(data);

		return list;
	}

	// 스케줄 삭제
	@RequestMapping("/calender/deleteCal.do")
	public ModelAndView updateCalendar(@RequestParam(value = "data") int data,
			@RequestParam(value = "empNo") int data2) {

		System.out.println(data);

		int result = service.deletecCal(data);

		String msg = "";
		String loc = "/calendar/allView.do?data=" + data2;

		if (result > 0) {
			msg = "스케줄 삭제 완료되었습니다.";
		} else {
			msg = "스케줄 삭제 실패하였습니다.";
		}

		ModelAndView mv = new ModelAndView();

		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");

		return mv;
	}

	// 개인별
	@RequestMapping("/calender/1Cal.do")
	public ModelAndView Calendar1(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage,
			Model model, @RequestParam(value = "empNo") int data) {

		ModelAndView mv = new ModelAndView();

		int numPerPage = 5;
		List<Calendar> list = service.selectCalendar1(cPage, numPerPage, data);
		int totalCount = service.selectCalendar1Count(data);

		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage,
				path.getUrl() + "/calender/1Cal.do", "" + data));
		mv.addObject("list", list);
		mv.addObject("count", totalCount);
		mv.setViewName("calendar/calendarAll");

		return mv;
	}

	// 부서별
	@RequestMapping("/calender/2Cal.do")
	public ModelAndView Calendar2(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage,
			Model model, @RequestParam(value = "empNo") int data) {

		ModelAndView mv = new ModelAndView();

		int numPerPage = 5;
		List<Calendar> list = service.selectCalendar2(cPage, numPerPage, data);
		int totalCount = service.selectCalendar2Count(data);

		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage,
				path.getUrl() + "/calender/2Cal.do", "" + data));
		mv.addObject("list", list);
		mv.addObject("count", totalCount);
		mv.setViewName("calendar/calendarAll");

		return mv;
	}

	// 회사별
	@RequestMapping("/calender/3Cal.do")
	public ModelAndView Calendar3(@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage,
			Model model, @RequestParam(value = "empNo") int data) {

		ModelAndView mv = new ModelAndView();

		int numPerPage = 5;
		List<Calendar> list = service.selectCalendar3(cPage, numPerPage, data);
		int totalCount = service.selectCalendar3Count(data);

		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage,
				path.getUrl() + "/calender/3Cal.do", "" + data));
		mv.addObject("list", list);
		mv.addObject("count", totalCount);
		mv.setViewName("calendar/calendarAll");

		return mv;
	}

	// 일정 수정 화면 전환
	@RequestMapping("/calendar/updateCal.do")
	public ModelAndView updateCal(@RequestParam(value = "calNo") int data) {
		System.out.println(data);

		// 일정 번호로 조회
		Calendar c = service.selectCno(data);
		System.out.println("잘 나왔냐 : " + c);

		ModelAndView mv = new ModelAndView();
		mv.addObject("c", c);
		mv.setViewName("calendar/updateCal");

		return mv;
	}

	// 일정 수정 동작
	@RequestMapping("/calendar/updateCal2.do")
	public ModelAndView updateCalEnd(@RequestParam Map<String, Object> param) {
		  
		  for ( String key : param.keySet() ) { System.out.println("key : " + key
		  +" / value : " + param.get(key)); }
		  
		int result = service.updateCalendar(param);
		
		System.out.println("수정했어? : " + result);
		
		String msg = "";
		String loc = "/calendar/updateCal.do?calNo=" + param.get("calNo");

		if (result > 0) {
			msg = "스케줄 수정 완료";
		} else {
			msg = "스케줄 수정 실패";
		}

		ModelAndView mv = new ModelAndView();

		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		

		return mv;
	}
}
