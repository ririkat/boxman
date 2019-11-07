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

	@RequestMapping("acct/is.do")
	public String is(Model model) {
		ObjectMapper mapper = new ObjectMapper(); // json 객체를 자동으로 연결
		List <Map<String, String>> list = service.selectICList();
		model.addAttribute("list", list);
		
		return "acct/is";
	}
	
	@RequestMapping("acct/result.do") 
	@ResponseBody
	public String result(Model model) throws JsonProcessingException{
		
		ObjectMapper mapper = new ObjectMapper(); // json 객체를 자동으로 연결
		List <Map<String, String>> list = service.selectICList();
		model.addAttribute("list", list);
		return mapper.writeValueAsString(list);
		
	}
	
	/* 월급 지급하기 */
	@RequestMapping("/acct/wage.do")
	public ModelAndView wage(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		int numPerPage = 10;
		List <Map<String, String>> list = service.selectEmpList(cPage, numPerPage);
		int totalCount = service.selectEmpCount();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/bm/acct/wage.do"));
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
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl()+"/acct/wage.do",""+param.get("type"), ""+param.get("data")));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("acct/wage");
		return mv;
	}
	
	@RequestMapping("/acct/wagePay.do")
	@ResponseBody
	public String payment(int data) throws JsonProcessingException {

		int num = service.updateWagePayment(data);
		
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(num);
	}
	
	
	/* biztrip search */
	@RequestMapping("/acct/biztripSearch.do")
	public ModelAndView biztripSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, @RequestParam Map<String, Object> param ) {
		int numPerPage = 5;
		List <Map<String, String>> list = service.selectBiztripSearchList(cPage, numPerPage, param);
		int totalCount = service.biztripSearchCount(param);
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl()+"/acct/biztrip.do",""+param.get("type"), ""+param.get("data")));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("acct/biztrip");
		return mv;
	}
	
	/* severance search */
	@RequestMapping("/acct/severanceSearch")
	public ModelAndView severanceSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, @RequestParam Map<String, Object> param) {
		int numPerPage = 5;
		List <Map<String, String>>list = service.selectSevSearchList(cPage, numPerPage, param);
		System.out.println("////////");
		System.out.println(list);
		int totalCount = service.sevSearchCount(param);
		System.out.println(totalCount);
		System.out.println(totalCount);
		System.out.println("////////");
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl()+"/acct/severance.do",""+param.get("type"), ""+param.get("data")));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("acct/severance");
		return mv;
	}
	
	
	/* 출장비용 */
	@RequestMapping("/acct/biztrip.do")
	public ModelAndView bizTrip(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		int numPerPage=5;
		List <Map<String, String>> list = service.selectBizTripList(cPage, numPerPage);
		int totalCount = service.selectBizTripCount();
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/bm/acct/biztrip.do"));
		mv.addObject("list", list);
		mv.setViewName("acct/biztrip");
		return mv;
	}
	
	/* severance */
	@RequestMapping("/acct/severance.do")
	public ModelAndView severance(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage) {
		int numPerPage = 5;
		List <Map<String, String>> list = service.selectSevList(cPage, numPerPage);
		int totalCount = service.selectSevCount();
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/bm/acct/severance.do"));
		mv.addObject("list", list);
		mv.setViewName("acct/severance");
		return mv;
	}
	
	@RequestMapping("/acct/quitJob.do")
	public ModelAndView quitJob(String empname, String amt, String empno, Model mode) {
		System.out.println("//////////////////////////////////////////////");
		System.out.println(empname);
		System.out.println(empno);
		System.out.println(amt);
		
		Map <String, String> m = new HashMap();
		m.put("empname",empname);
		m.put("amt", amt);
		m.put("empno", empno);
		System.out.println(m);
		
		int result = 0;
		String msg="";
		String loc="/acct/severance.do";
		try {
			result = service.updateSeveranceStatus(m);
			msg=empname+"님을 퇴사 시켰습니다";
		} catch (RuntimeException e) {
			msg="문제가 발생했습니다";
		}
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
		
	}
	
}
