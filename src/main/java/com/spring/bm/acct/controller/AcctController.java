package com.spring.bm.acct.controller;

import java.util.HashMap;	
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.bm.acct.service.AcctService;
import com.spring.bm.common.PageBarFactory;
import com.spring.bm.common.PageUrlFactory;

@Controller
public class AcctController {
	
	private Logger logger = LoggerFactory.getLogger(AcctController.class);
	private PageUrlFactory path = new PageUrlFactory();
	
	@Autowired
	AcctService service;

	
/* Income Statement Start */
	
	/* Income Statement list */
	@RequestMapping("acct/is.do")
	public String is(Model model) {
		ObjectMapper mapper = new ObjectMapper(); // json 객체를 자동으로 연결
		List <Map<String, String>> list = service.selectICList();
		model.addAttribute("list", list);
		
		return "acct/is";
	}
	
	/* Income Statement Result */
	@RequestMapping("acct/result.do") 
	@ResponseBody
	public String result(Model model) throws JsonProcessingException{
		
		ObjectMapper mapper = new ObjectMapper(); // json 객체를 자동으로 연결
		List <Map<String, String>> list = service.selectICList();
		model.addAttribute("list", list);
		return mapper.writeValueAsString(list);
		
	}

/* Income Statement End */
	
	
	
	
	
	
/* Salary Start */
	
	/* salary list */
	@RequestMapping("/acct/wage.do")
	public ModelAndView wage(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		int numPerPage = 10;
		List <Map<String, String>> list = service.selectEmpList(cPage, numPerPage);
		int totalCount = service.selectEmpCount();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl()+"/acct/wage.do"));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("acct/wage");
		return mv;
	}
	
	/* salary search */
	@RequestMapping("/acct/salarySearch.do")
	public ModelAndView salarySearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, @RequestParam Map<String, Object> param) {
		int numPerPage = 10;
		List <Map<String, String>> list = service.selectsSalarySearchList(cPage, numPerPage, param);
		int totalCount = service.salarySearchCount(param);
	
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl()+"/acct/salarySearch.do",""+param.get("type"), ""+param.get("data")));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("acct/wage");
		return mv;
	}
	
	/* wage payment */
	@RequestMapping("/acct/wagePay.do")
	@ResponseBody
	public String payment(int data) throws JsonProcessingException {
		int num = service.updateWagePayment(data);
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(num);
	}
	
/* Salary End */
	
	
	
	
	
	
	
	
/* BusinessTrip Start */
	/* biztrip list */
	@RequestMapping("/acct/biztrip.do")
	public ModelAndView bizTrip(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		int numPerPage=5;
		List <Map<String, String>> list = service.selectBizTripList(cPage, numPerPage);
		int totalCount = service.selectBizTripCount();
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl()+"/acct/biztrip.do"));
		mv.addObject("list", list);
		mv.setViewName("acct/biztrip");
		return mv;
	}

	/* biztrip search */
	@RequestMapping("/acct/biztripSearch.do")
	public ModelAndView biztripSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, @RequestParam Map<String, Object> param ) {
		int numPerPage = 5;
		List <Map<String, String>> list = service.selectBiztripSearchList(cPage, numPerPage, param);
		int totalCount = service.biztripSearchCount(param);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl()+"/acct/biztripSearch.do",""+param.get("type"), ""+param.get("data")));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("acct/biztrip");
		return mv;
	}
	
	/*biztrip payment*/
	@RequestMapping("/acct/biztripPay.do")
	@ResponseBody
	public String biztripPayment(int data) throws JsonProcessingException{
		int num = service.updateBizTripPayment(data);
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(num);
	}
	
/* BusinessTrip End */
	
	
/* Severance Start */	
	/* severance list */
	@RequestMapping("/acct/severance.do")
	public ModelAndView severance(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage) {
		int numPerPage = 5;
		List <Map<String, String>> list = service.selectSevList(cPage, numPerPage);
		int totalCount = service.selectSevCount();
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl()+"/acct/severance.do"));
		mv.addObject("list", list);
		mv.setViewName("acct/severance");
		return mv;
	}
	
	/* severance search */
	@RequestMapping("/acct/severanceSearch")
	public ModelAndView severanceSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, @RequestParam Map<String, Object> param) {
		int numPerPage = 5;
		List <Map<String, String>>list = service.selectSevSearchList(cPage, numPerPage, param);
		int totalCount = service.sevSearchCount(param);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl()+"/acct/severanceSearch.do",""+param.get("type"), ""+param.get("data")));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("acct/severance");
		return mv;
	}
	
	/* action to quit the job */
	@RequestMapping("/acct/quitJob.do")
	//public ModelAndView quitJob(String empname, String amt, String empno, Model mode) {
	public String quitJob(String empname, String amt, String empno,  Model model,RedirectAttributes redirect) {
		
		Map <String, String> m = new HashMap();
		m.put("empname",empname);
		m.put("amt", amt);
		m.put("empno", empno);
		
		String loc = "";
		String loc1 = "";
		String msg = "";
		int severNo;
		int result = 0;

		try {
			result = service.updateSeveranceStatus(m);
			if(result > 0) {
				m = service.selectSevOne(empno);
				m.put("temp", "severance");
				m.put("checkCol", "sevYN");
				m.put("pkey", "sevNo");
				redirect.addAllAttributes(m);
				loc1 = "redirect:/apv/addReqApvEnroll.do";
			} else {
				msg = "퇴사처리가 실패하였습니다.";
				loc= "emp/empList.do?temp=all";
				model.addAttribute("msg", msg);
				model.addAttribute("loc", loc);
				loc1 = "common/msg";
			}
		} catch (RuntimeException e) {
			msg="문제가 발생했습니다";
		}
		return loc1;
		
	}
	
	/*biztrip payment*/
	@RequestMapping("/acct/severancePayment.do")
	@ResponseBody
	public String updateSevPayment(int empno) throws JsonProcessingException{
		int num = service.updateSevPayment(empno);
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(num);
	}
	
	
/* Severance End */
	
}
