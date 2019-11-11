package com.spring.bm.purchase.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.bm.common.PageBarFactory;
import com.spring.bm.common.PageUrlFactory;
import com.spring.bm.purchase.model.service.PurchaseService;

@Controller
public class PurchaseController {
	
	private PageUrlFactory path = new PageUrlFactory();
	
	@Autowired
	PurchaseService service;
	
	@RequestMapping("/purchase/purList.do")
	public ModelAndView selectPurList(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		List<Map<String,String>> list = service.selectPurList(cPage,numPerPage);
		int totalCount = service.selectPurCount();
		
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount,cPage,numPerPage, path.getUrl()+"/purchase/purList.do"));
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
	
	@RequestMapping("/purchase/addStuffToTemp.do")
	public @ResponseBody Map<String,String> addStuffToTemp(@RequestParam Map<String,String> param) {
		String stuffNo = param.get("stuffNo");
		
		Map<String,String> stuff = service.addStuffToTemp(stuffNo);
		
		return stuff;
	}
	
	@RequestMapping("/purchase/calPrice.do")
	public @ResponseBody int calPrice(@RequestParam(value="price") int price,
			@RequestParam(value="stNum") int stNum) {
		int result = price*stNum;
		return result;
	}
	
	/*@RequestMapping("/purchase/enrollPurInfoEnd.do")
	public ModelAndView enrollPurInfoEnd(@RequestParam Map<String,String> param) {
		int result = 0;
		try {
			result = service.enrollPurInfo(param);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String msg="";
		String loc="/purchase/purList.do";
		if(result>0) {
			msg="구매정보 등록 성공";
		}else {
			msg="구매정보 등록 실패";
		}
		ModelAndView mv= new ModelAndView();
				
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		return mv;
	}*/
	
	
	@RequestMapping("/purchase/enrollPurInfoEnd.do")
	public String enrollPurInfoEnd(@RequestParam Map<String,Object> param, RedirectAttributes redirect, Model model) {
		int result = 0;
		Map<String, Object> map = new HashMap();
		String loc = "";
		String loc1 = "";
		String msg = "";
		try {
			result = service.enrollPurInfo(param);
			if(result > 0) {
				param.put("purCode", result);
				map = service.selectPurOne(param);
				map.put("temp", "purchaseTab");
				map.put("checkCol", "purck");
				map.put("pkey", "purCode");
				map.put("checkCol2", "deposck");
				map.put("checkColDate", "purdate");
				map.put("checkColDate2", "deposdate");
				redirect.addAllAttributes(map);
				loc1 = "redirect:/apv/addReqApvEnroll.do";
			} else {
				msg = "구매정보 등록 실패";
				loc= "/purchase/purList.do";
				model.addAttribute("msg", msg);
				model.addAttribute("loc", loc);
				loc1 = "common/msg";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return loc1;
	}
	
	@RequestMapping("/purchase/searchPurInfo.do")
	public ModelAndView searchPurInfo(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage,
			@RequestParam(value="type") String type, @RequestParam(value="data") String data, @RequestParam(value="empId") String empId) {

		int numPerPage = 10;
		Map<String, Object> m = new HashMap();
		m.put("cPage", cPage);
		m.put("numPerPage", numPerPage);
		m.put("type", type);
		m.put("data", data);
		m.put("empId", empId);
		
		List<Map<String,String>> list = service.selectPurSearchList(m);
		int totalCount = service.selectPurSearchCount(m);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl()+"/purchase/searchPurInfo.do", type, data));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("purchase/purList");
		
		return mv;
	}
	
	@RequestMapping("/purchase/verificationPurInfo.do")
	public ModelAndView veriPurInfo(@RequestParam Map<String,String> param) {
		int purCode = Integer.parseInt(param.get("purCode"));
		
		Map<String,String> purInfo = service.selectPurInfo(purCode);
		List<Map<String,String>> purItemList = service.selectPurItemList(purCode);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("purInfo",purInfo);
		mv.addObject("purItemList",purItemList);
		mv.setViewName("purchase/veriPurInfo");
		return mv;
	}

}
