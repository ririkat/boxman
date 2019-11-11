package com.spring.bm.sale.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.common.PageBarFactory;
import com.spring.bm.common.PageUrlFactory;
import com.spring.bm.sale.model.service.SaleService;

@Controller
public class SaleController {

	private PageUrlFactory path = new PageUrlFactory();
	
	@Autowired
	SaleService service;

	@RequestMapping("/sale/saleList.do")
	public ModelAndView selectPurList(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		List<Map<String,String>> list = service.selectSaleList(cPage,numPerPage);
		int totalCount = service.selectSaleCount();
		
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount,cPage,numPerPage, path.getUrl()+"/sale/saleList.do"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("sale/saleList");
		
		return mv;
	}
	
	@RequestMapping("/sale/enrollSaleInfo.do")
	public ModelAndView enrollSaleInfo() {
		List<Map<String,String>> list = service.selectConnList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("sale/enrollSaleInfo");
		return mv;
	}
	
	@RequestMapping("/sale/enrollSaleInfoEnd.do")
	public ModelAndView enrollSaleInfoEnd(@RequestParam Map<String,String> param) {
		int result = 0;
		try {
			result = service.enrollSaleInfo(param);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String msg="";
		String loc="/sale/saleList.do";
		if(result>0) {
			msg="판매정보 등록 성공";
		}else {
			msg="판매정보 등록 실패";
		}
		ModelAndView mv= new ModelAndView();
				
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/sale/searchSaleInfo.do")
	public ModelAndView searchSaleInfo(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage,
			@RequestParam(value="type") String type, @RequestParam(value="data") String data, @RequestParam(value="empId") String empId) {

		int numPerPage = 10;
		Map<String, Object> m = new HashMap();
		m.put("cPage", cPage);
		m.put("numPerPage", numPerPage);
		m.put("type", type);
		m.put("data", data);
		m.put("empId", empId);
		
		List<Map<String,String>> list = service.selectSaleSearchList(m);
		int totalCount = service.selectSaleSearchCount(m);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl()+"/sale/searchSaleInfo.do", type, data));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("sale/saleList");
		
		return mv;
	}
	
	@RequestMapping("/sale/verificationSaleInfo.do")
	public ModelAndView veriSaleInfo(@RequestParam Map<String,String> param) {
		int salCode = Integer.parseInt(param.get("salCode"));
		
		Map<String,String> saleInfo = service.selectSaleInfo(salCode);
		List<Map<String,String>> saleItemList = service.selectSaleItemList(salCode);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("saleInfo",saleInfo);
		mv.addObject("saleItemList",saleItemList);
		mv.setViewName("sale/veriSaleInfo");
		return mv;
	}

}
