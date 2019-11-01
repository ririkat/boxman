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
public class ApvLineController {
	
	private Logger logger=LoggerFactory.getLogger(ApvLineController.class);

	@Autowired
	ApvService service;
	
	/* 결재 라인 관리 리스트 뷰 호출 */
	@RequestMapping("/apv/apvLineList.do")
	public ModelAndView apvLine(@RequestParam(value="cPage", 
			required=false, defaultValue="0") int cPage, int loginNo) {
		int numPerPage = 10;
		List<Map<String,Object>> myList=service.selectMyApvLineList(cPage,numPerPage,loginNo);
		int totalCount = service.selectMyALCount(loginNo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/bm/apv/apvLineList.do"));
		mv.addObject("count", totalCount);
		mv.addObject("myList",myList);
		mv.setViewName("apv/apvLineList");
		return mv;
	}
	
	/* 결재 라인 등록뷰 호출 */
	@RequestMapping("/apv/apvLineEnroll.do")
	public ModelAndView apvLineEnroll() {
		ModelAndView mv = new ModelAndView();
		//결재라인 등록 로직
		//개인/부서/회사 전체 라인 선택 버튼과
		//조직도를 표시해줄 부서정보를 list로 가져옴.
		//저장되어 있는 결재라인도 list로 불러옴.
		List<Map<String,Object>> deptList=service.selectDeptList();
		mv.addObject("deptList",deptList);
		mv.setViewName("apv/apvLineEnroll");
		return mv;
	}
	
	/* 결재라인->부서선택->사원들출력하기  */
	@RequestMapping(value="/apv/selectDeptToEmp.do",produces ="application/json; charset=utf8")
	@ResponseBody
	public List<Map<String,Object>> selectDeptToEmp(@RequestParam Map<String,Object> param){
		int deptNo=Integer.parseInt((String) param.get("deptNo"));
		List<Map<String,Object>> list=service.selectDeptToEmp(deptNo);
		return list;
	}
	
	/* 결재라인 등록 처리  */
	@RequestMapping(value="/apv/apvLineEnrollEnd.do",produces ="application/json; charset=utf8")
	@ResponseBody
	public int apvLineEnrollEnd(@RequestParam Map<String,Object> param){
//		int result=service.apvLineEnrollEnd(param);
		return 0;
	}

}
