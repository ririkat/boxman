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
	
	private Logger logger=LoggerFactory.getLogger(CalendarController.class);
	
	@Autowired
	CalendarService service;
	
	private PageUrlFactory path = new PageUrlFactory();
	
	/* 일정관리첫페이지로 이동 */
	@RequestMapping("/calendar/allView.do")	//사원등록 폼으로 전환
	public ModelAndView allView(@RequestParam(value="cPage", 
	         required=false, defaultValue="0") int cPage, Model model, @RequestParam(value = "data") int param) {

	    int numPerPage = 5;
	    
		ModelAndView mv = new ModelAndView();
		
		List<Calendar> list = service.selectCalendarEmpNo(cPage, numPerPage, param);
	    int totalCount = service.selectCalendarCount2(param);
	    
	    System.out.println("list나온거 : " + list);
	    System.out.println("totalCount나온거 : " + totalCount);
		
	    mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl()+"/calendar/allView.do",""+param));
		mv.addObject("list",list);
		mv.addObject("count",totalCount);
		mv.setViewName("calendar/calendarAll");
	    
		return mv;
	}

	//스케줄 등록
	@RequestMapping("/calendar/insertCalendarEnd.do")
	public @ResponseBody int insertCalendar(@RequestParam Map<String,Object> param) {
		
		int result = service.insertCalender(param);
		 
		return result;
	
	}
	
	//스케줄 조회
	@RequestMapping("/calendar/selectCal.do")
	public @ResponseBody List<Calendar> selectCal(@RequestParam(value = "data") int data){

		List<Calendar> list = service.selectCalendarEmpNo(data);

		
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
	
	//스케줄 삭제
	@RequestMapping("/calender/deleteCal.do")
	public ModelAndView updateCalendar(@RequestParam (value = "data") int data, @RequestParam(value = "empNo") int data2) {
		
		System.out.println(data);
		
		int result = service.deletecCal(data);
		
		String msg = "";
		String loc = "/calendar/allView.do?data="+data2;
		
		if(result > 0) {
			msg="스케줄 삭제 완료되었습니다.";
		} else {
			msg="스케줄 삭제 실패하였습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("msg", msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}

}
