package com.spring.bm.acct.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.bm.acct.service.AcctService;

@Controller
public class AcctController {
	
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
	
	@RequestMapping("/acct/wage.do")
	public String wage(Model model) {
		List <Map<String, String>> list = service.selectEmpList();
		model.addAttribute("list", list);
		return "acct/wage";
	}
	
	@RequestMapping("/acct/wagePay.do")
	@ResponseBody
	public String payment(int data) throws JsonProcessingException {

		int num = service.updateWagePayment(data);
		
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(num);
	}
	
	@RequestMapping("/acct/biztrip.do")
	public String bizTrip(Model model) {
		List <Map<String, String>> list = service.selectBizTripList();
		model.addAttribute("list", list);
		return "acct/biztrip";
	}
	
	@RequestMapping("/acct/severance.do")
	public String severance(Model model) {
		List <Map<String, String>> list = service.selectSevList();
		model.addAttribute("list", list);
		return "acct/severance";
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
