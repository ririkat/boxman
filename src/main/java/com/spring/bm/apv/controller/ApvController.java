package com.spring.bm.apv.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.apv.model.service.ApvService;
import com.spring.bm.common.PageBarFactory;


@Controller
public class ApvController {
	private Logger logger=LoggerFactory.getLogger(ApvController.class);

	@Autowired
	ApvService service;
	
	/* 결재 양식 관리 */
	@RequestMapping("/apv/apvDoc.do")
	public ModelAndView apvDoc(@RequestParam(value="cPage", 
			required=false, defaultValue="0") int cPage) {
		int numPerPage = 10;
		List<Map<String,Object>> list=service.selectDocForm(cPage,numPerPage);
		int totalCount = service.selectDfCount();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/bm/apv/apvDoc.do"));
		mv.addObject("count", totalCount);
		mv.addObject("list",list);
		mv.setViewName("apv/apvDocList");
		return mv;
	}
	/* 결재 라인 관리 */
	@RequestMapping("/apv/apvLine.do")
	public String apvLine() {
		return "apv/apvLine";
	}
	/* 상신결재함 관리 */
	@RequestMapping("/apv/receiveApv.do")
	public String receiveApv() {
		return "apv/receiveApv";
	}
	
	/* 수신결재함 관리 */
	@RequestMapping("/apv/sendApv.do")
	public String sendApv() {
		return "apv/sendApv";
	}
	
	
	/* 결재 양식 등록 팝업창 */
	@RequestMapping("/apv/apvDocEnroll.do")
	public ModelAndView apvDocEnroll() {
		ModelAndView mv = new ModelAndView();
		List<Map<String,Object>> docCate=service.selectDocCate();
		mv.addObject("docCate",docCate);
		mv.setViewName("apv/apvDocEnroll");
		return mv;
	}
	
	/* 결재 양식 등록 로직*/
	@RequestMapping("/apv/apvDocEnrollEnd.do")
	@ResponseBody
	public int apvDocEnrollEnd(@RequestParam Map<String,Object> param){
		int result=0;
		try {
			result=service.insertApvDoc(param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	

	/* 결재 양식 수정 팝업창 */
	@RequestMapping("/apv/apvDocModify.do")
	public ModelAndView apvDocModify(@RequestParam(value="dfNo", 
			required=false, defaultValue="0") int dfNo) {
		ModelAndView mv = new ModelAndView();
		List<Map<String,Object>> docCate=service.selectDocCate();
		Map<String,Object> dfOne=service.selectDfModi(dfNo);
		
		mv.addObject("dfOne",dfOne);
		mv.addObject("docCate",docCate);
		mv.setViewName("apv/apvDocModi");
		return mv;
	}
	
	/* 결재 양식 수정 로직*/
	@RequestMapping("/apv/apvDocModiEnd.do")
	@ResponseBody
	public int apvDocModiEnd(@RequestParam Map<String,Object> param){
		int result=0;
		try {
			result=service.updateApvDoc(param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	/* 결재 양식 수정 로직*/
	@RequestMapping("/apv/apvDocDelete.do")
	public ModelAndView apvDocDelete(@RequestParam(value="dfNo", 
			required=false, defaultValue="0") int dfNo){
		ModelAndView mv = new ModelAndView();
		
		int result=0;
		String msg="";
		String loc="/apv/apvDoc.do";
		try {
			result=service.deleteApvDoc(dfNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0) {
			msg="결재양식 삭제 성공";
		}else {
			msg="결재 양식 삭제 실패";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
}
