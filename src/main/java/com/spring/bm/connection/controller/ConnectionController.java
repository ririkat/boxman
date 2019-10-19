package com.spring.bm.connection.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.common.PageBarFactory;
import com.spring.bm.connection.model.service.ConnectionService;

@Controller
public class ConnectionController {
	
	@Autowired
	ConnectionService service;
	
	@RequestMapping("/connection/connList.do")
	public ModelAndView selectConnList(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		List<Map<String,String>> list = service.selectConnList(cPage,numPerPage);
		int totalCount = service.selectConnCount();
		
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount,cPage,numPerPage, "/bm/connection/connList.do"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("connection/connList");
		
		return mv;
	}
	
	@RequestMapping("/connection/enrollConn.do")
	public ModelAndView enrollConn() {
		ModelAndView mv = new ModelAndView();
		List<Map<String,String>> list = service.selectStfMainCateg();
		
		mv.addObject("list",list);
		mv.setViewName("connection/enrollConn");
		
		return mv;
	}
	
	@RequestMapping("/connection/checkConNameDupl.do")
	public ModelAndView checkConNameDupl(@RequestParam Map<String,String> param) {
		String conCateg = param.get("conCateg_");
		String mCategName = param.get("mCategName_");
		String conName = param.get("conName_");
		int result = -1;
		
		if(conCateg.equals("유통")) {
			result = service.searchDisCon(param);
		}
		else {
			result = service.searchCon(param);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("conCateg",conCateg);
		mv.addObject("mCategName",mCategName);
		mv.addObject("conName",conName);
		mv.addObject("result",result);
		mv.setViewName("connection/connDuplPopUp");
		return mv;
	}

}



















