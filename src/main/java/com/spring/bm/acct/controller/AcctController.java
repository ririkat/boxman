package com.spring.bm.acct.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.bm.acct.service.AcctService;

@Controller
public class AcctController {
	
	@Autowired
	AcctService service;

	@RequestMapping("acct/is.do")
	public String is(Model model) {
		List <Map<String, String>> list = service.selectICList();
		model.addAttribute("list", list);
		return "acct/is";
	}
	
	@RequestMapping("acct/bs.do")
	public String bs() {
		return "acct/bs";
	}
	
	@RequestMapping("acct/cf.do")
	public String cf() {
		return "acct/cf";
	}
	
}
