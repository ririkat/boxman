package com.spring.bm.employee.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.department.model.service.DepartmentService;
import com.spring.bm.notice.model.service.NoticeService;

@Controller
public class EmployeeController {
	
//	@Autowired
//	NoticeService noticeService;
//	
//	 /* 사원상세보기 */
//	   @RequestMapping("/emp/selectEmpOne.do")
//	   public ModelAndView selectEmp(int empNo) {
//	      Map<String, String> empMap = service.selectEmpOne(empNo);
//	      
//	      ModelAndView mv = new ModelAndView();
//	      mv.addObject("emp", empMap);
//	      mv.setViewName("emp/selectEmpOne");
//	   }

}
