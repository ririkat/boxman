package com.spring.bm.acct.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/acct/biztrip.do")
	public String bizTrip() {
		
		return "acct/biztrip";
	}
	
	@RequestMapping("/acct/severance.do")
	public String severance() {
		
		return "acct/severance";
	}
	
}
