package com.spring.bm.department.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.department.model.service.DepartmentService;

@Controller
public class DepartmentController {
   
   private Logger logger = LoggerFactory.getLogger(DepartmentController.class);
   
   @Autowired
   DepartmentService service;
   
   /* 부서등록 */
   @RequestMapping("/dept/insertDept.do")
   public String insertDept() {
      return "/dept/deptForm";
   }
   
//   @RequestMapping("/dept/insertDeptEnd.do")
//   public ModelAndView insertDeptEnd(@RequestParam Map<String, String> param) {
//      
//      int result = service.insertDept(param);
//      String msg = "";
//      String loc = "/dept/deptList.do";
//      
//      if(result > 0) msg = param.get("deptName") + " 등록이 완료되었습니다.";
//      else msg = param.get("deptName") + " 등록이 실패하였습니다.";
//      
//      ModelAndView mv = new ModelAndView();
//      mv.addObject("msg", msg);
//      mv.addObject("loc", loc);
//      mv.setViewName("common/msg");
//      
//      return mv;
//   }
   /* 부서등록 종료 */
   
   /* 부서리스트 출력 */
//   @RequestMapping("/notice/insertNotice.do")
//   public ModelAndView selectDeptList() {
//      
//      List<Map<String, String>> list = service.selectDeptList();
//      ModelAndView mv = new ModelAndView();
//      mv.addObject("list", list);
//      mv.setViewName("notice/noticeInsert");
//      return mv;
//   }
//   
//   /* 부서삭제 */
//   @RequestMapping("/dept/deleteDept")
//   public ModelAndView deleteDept(int deptNo) {
//      int result = service.deleteDept(deptNo);
//      
//      ModelAndView mv = new ModelAndView();
//      String msg = "";
//      String loc = "/dept/deptList.do";
//      mv.addObject("msg", msg);
//      mv.addObject("loc", loc);
//      mv.setViewName("common/msg");
//      return mv;
//   }
   
   
   

}