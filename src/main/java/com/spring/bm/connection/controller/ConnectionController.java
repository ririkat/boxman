package com.spring.bm.connection.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.common.PageBarFactory;
import com.spring.bm.common.PageUrlFactory;
import com.spring.bm.connection.model.service.ConnectionService;
import com.spring.bm.connection.model.vo.Connection;

@Controller
public class ConnectionController {
	
	private PageUrlFactory path = new PageUrlFactory();
	
	@Autowired
	ConnectionService service;
	
	@RequestMapping("/connection/connList.do")
	public ModelAndView selectConnList(@RequestParam(value="cPage",required=false,defaultValue="0") int cPage) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		List<Map<String,String>> list = service.selectConnList(cPage,numPerPage);
		int totalCount = service.selectConnCount();
		
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount,cPage,numPerPage, path.getUrl()+"/connection/connList.do"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("connection/connList");
		
		return mv;
	}
	
	@RequestMapping("/connection/enrollConn.do")
	public ModelAndView enrollConn() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("connection/enrollConn");
		return mv;
	}
	
	@RequestMapping("/connection/checkConNameDupl.do")
	public ModelAndView checkConNameDupl(@RequestParam Map<String,String> param) {
		String conCateg = param.get("conCateg_");
		String conName = param.get("conName_");
		int result = 0;
		
		result = service.searchDisCon(param);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("conCateg",conCateg);
		mv.addObject("conName",conName);
		mv.addObject("result",result);
		mv.setViewName("connection/connDuplPopUp");
		return mv;
	}
	
	@RequestMapping("/connection/enrollConnEnd.do")
	public ModelAndView enrollConnEnd(@RequestParam Map<String,String> param) {
		int result = 0;
		try {
			result = service.enrollConn(param);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String msg="";
		String loc="/connection/connList.do";
		if(result>0) {
			msg="거래처 등록 성공";
		}else {
			msg="거래처 등록 실패";
		}
		ModelAndView mv= new ModelAndView();
				
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/connection/modifyConn.do")
	public ModelAndView modifyConn(HttpServletRequest req) {
		int conCode = Integer.parseInt(req.getParameter("conCode"));
		
		Map<String,String> conn = service.selectConnection(conCode);
		Map<String,String> transfer =  service.selectTransferInfo(conCode);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("conn",conn);
		mv.addObject("transferInfo",transfer);
		mv.setViewName("connection/modifyConn");
		return mv;
	}
	
	@RequestMapping("/connection/modifyConnEnd.do")
	public ModelAndView modifyConnEnd(@RequestParam Map<String,String> param) {
		int result = 0;
		try {
			result = service.modifyConn(param);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String msg="";
		String loc="/connection/connList.do";
		if(result>0) {
			msg="거래처 수정 성공";
		}else {
			msg="거래처 수정 실패";
		}
		ModelAndView mv= new ModelAndView();
				
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/connection/deleteConn.do")
	public ModelAndView deleteConn(HttpServletRequest req) {
		int conCode = Integer.parseInt(req.getParameter("conCode"));
		
		int result = service.deleteConn(conCode);
		
		String msg="";
		String loc="/connection/connList.do";
		if(result>0) {
			msg="거래처 삭제 성공";
		}else {
			msg="거래처 삭제 실패";
		}
		ModelAndView mv= new ModelAndView();
				
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		
		mv.setViewName("common/msg");
		return mv;
	}

	@RequestMapping("/connection/searchConnection.do")
	public ModelAndView searchConnection(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage,
			@RequestParam(value="type") String type, @RequestParam(value="data") String data) {

		int numPerPage = 10;
		Map<String, Object> m = new HashMap();
		m.put("cPage", cPage);
		m.put("numPerPage", numPerPage);
		m.put("type", type);
		m.put("data", data);

		List<Map<String,String>> list = service.selectConnSearchList(m);
		int totalCount = service.selectConnSearchCount(m);

		ModelAndView mv = new ModelAndView();

		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage,
				path.getUrl()+"/connection/searchConnection.do", type, data));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("connection/connList");

		return mv;
	}
	
	//구매 정보 등록에서 거래처 이름 검색
	@RequestMapping("/connection/searchConnection2.do")
	public ModelAndView searchConnection2(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage,
			@RequestParam Map<String,String> param) {
		
	    int numPerPage = 10;   
	    Map<String, Object> m = new HashMap();
	    m.put("cPage", cPage);
	    m.put("numPerPage", numPerPage);
	    m.put("data", param.get("data_")); // 빈칸에 입력한 값
	    m.put("type", param.get("type_")); // select에서 가져온 값 
	    
	    List<Connection> list = service.searchConnection(m);
	    int totalCount = service.searchConnectionCount(m);
	    System.out.println("list : " + list + "/" + "count : " + totalCount);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl()+"/connection/searchConnection2.do", param.get("type_"), param.get("data_")));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("connection/connSearchPopUp");
		return mv;
	}
	
	@RequestMapping("/connection/searchConnection3.do")
	public ModelAndView searchConnection3(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage,
			@RequestParam Map<String,String> param) {
		
	    int numPerPage = 10;   
	    Map<String, Object> m = new HashMap();
	    m.put("cPage", cPage);
	    m.put("numPerPage", numPerPage);
	    m.put("data", param.get("data_")); // 빈칸에 입력한 값
	    m.put("type", param.get("type_")); // select에서 가져온 값 
	    
	    List<Connection> list = service.searchConnection2(m);
	    int totalCount = service.searchConnectionCount2(m);
	    System.out.println("list : " + list + "/" + "count : " + totalCount);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl()+"/connection/searchConnection3.do", param.get("type_"), param.get("data_")));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("connection/connSearchPopUp");
		return mv;
	}
	
}


















