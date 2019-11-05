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
public class ApvDocController {
	private Logger logger=LoggerFactory.getLogger(ApvDocController.class);

	@Autowired
	ApvService service;
	
	/* 결재 양식 관리 리스트 뷰 호출 */
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
		List<Map<String,Object>> docHCate=service.selectDocHCate();
		List<Map<String,Object>> docCCate=service.selectDocCCate();
		mv.addObject("docCate",docCate);
		mv.addObject("docHCate",docHCate);
		mv.addObject("docCCate",docCCate);
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
	
	/* 결재 양식 삭제 로직*/
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
	
	
	/* 결재폼 양식 등록 팝업창 */
	@RequestMapping("/apv/apvDocHeadEnroll.do")
	public String apvDocHeadEnroll() {
		return "apv/apvDocHeadEnroll";
	}
	
	/* 결재폼 양식 등록 로직*/
	@RequestMapping("/apv/apvDocHeadEnrollEnd.do")
	@ResponseBody
	public int apvDocHeadEnrollEnd(@RequestParam Map<String,Object> param){
		int result=0;
		try {
			result=service.insertApvDocHead(param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	/* 결재 본문 양식 등록 팝업창 */
	@RequestMapping("/apv/apvDocContentEnroll.do")
	public String apvDocContentEnroll() {
		return "apv/apvDocContentEnroll";
	}
	
	/* 결재본문 양식 등록 로직*/
	@RequestMapping("/apv/apvDocContentEnrollEnd.do")
	@ResponseBody
	public int apvDocContentEnrollEnd(@RequestParam Map<String,Object> param){
		int result=0;
		try {
			result=service.insertApvDocContent(param);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	/* 결재양식 등록->결재폼옵션 변경 로직  */
	@RequestMapping(value="/apv/apvDocHChange.do",produces ="application/text; charset=utf8")
	@ResponseBody
	public String apvDocHChange(@RequestParam Map<String,Object> param){
		int no=Integer.parseInt((String) param.get("no"));
		String code=service.selectDfhContent(no);
		return code;
	}
	
	/* 결재양식 등록->본문 양식 변경 로직  */
	@RequestMapping(value="/apv/apvDocCChange.do",produces ="application/text; charset=utf8")
	@ResponseBody
	public String apvDocCChange(@RequestParam Map<String,Object> param){
		int no=Integer.parseInt((String) param.get("no"));
		String code=service.selectDfcContent(no);
		return code;
	}
	
//	기안하기------------
	/* 기안하기 리스트 뷰 */
	@RequestMapping("/apv/requestApv.do")
	public ModelAndView requestApvMain(@RequestParam(value="cPage", 
			required=false, defaultValue="0") int cPage) {
		int numPerPage = 10;
		List<Map<String,Object>> list=service.selectDocForm(cPage,numPerPage);
		int totalCount = service.selectDfCount();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/bm/apv/requestApv.do"));
		mv.addObject("count", totalCount);
		mv.addObject("list",list);
		mv.setViewName("apv/requestApvMain");
		return mv;
	}
	
	/* 기안 등록 뷰 */
	@RequestMapping("/apv/requestApvEnroll.do")
	public ModelAndView requestApvEnroll(@RequestParam(value="dfNo", 
			required=false, defaultValue="0") int dfNo) {
		ModelAndView mv = new ModelAndView();
		/* List<Map<String,Object>> docCate=service.selectDocCate(); */
		Map<String,Object> dfOne=service.selectDfModi(dfNo);
		String title=(String)dfOne.get("DFTITLE");
		String form=((String)dfOne.get("DFHEADFORM")).replace("<c:out value='${dfOne[\"DFTITLE\"]}' ​escapeXml=\"false\"/>", title);
		
		mv.addObject("dfOne",dfOne);
		/* mv.addObject("docCate",docCate); */
		mv.setViewName("apv/requestApvEnroll");
		return mv;
	}
}
