package com.spring.bm.purchase.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.common.PageBarFactory;
import com.spring.bm.purchase.model.service.PurchaseService;

@Controller
public class PurchaseController {
	
	@Autowired
	PurchaseService service;
	
	@RequestMapping("/purchase/purList.do")
	public ModelAndView selectPurList(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		List<Map<String,String>> list = service.selectPurList(cPage,numPerPage);
		int totalCount = service.selectPurCount();
		
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount,cPage,numPerPage, "/bm/purchase/purList.do"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("purchase/purList");
		
		return mv;
	}
	
	@RequestMapping("/purchase/enrollPurInfo.do")
	public ModelAndView enrollPurInfo() {
		List<Map<String,String>> list = service.selectConnList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("purchase/enrollPurInfo");		
		return mv;
	}
	
//	@RequestMapping("/purchase/enrollPurInfoEnd.do")
//	public ModelAndView enrollPurInfoEnd(@RequestParam Map<String,String> param) {
//		int result = 0;
//		try {
//			result = service.enrollPurInfo(param);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		String msg="";
//		String loc="/purchase/purList.do";
//		if(result>0) {
//			msg="구매정보 등록 성공";
//		}else {
//			msg="구매정보 등록 실패";
//		}
//		ModelAndView mv= new ModelAndView();
//				
//		mv.addObject("msg",msg);
//		mv.addObject("loc",loc);
//		
//		mv.setViewName("common/msg");
//		return mv;
//	}

}
