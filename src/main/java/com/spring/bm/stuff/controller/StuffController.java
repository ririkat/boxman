package com.spring.bm.stuff.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.common.PageBarFactory;
import com.spring.bm.stuff.model.service.StuffService;
import com.spring.bm.stuff.model.vo.Stuff;
import com.spring.bm.stuff.model.vo.StuffMaincategory;
import com.spring.bm.stuff.model.vo.StuffSubcategory;
import com.spring.bm.stuff.model.vo.StuffUpload;

@Controller
public class StuffController {
	
	@Autowired
	StuffService service;

	
	//물품등록 화면으로 페이지 전환
	@RequestMapping("/stuff/stuffEnroll.do")
	public String stuffEnroll(Model model) {
		
		List<StuffMaincategory> list = service.stuffMaincategoryList();
		model.addAttribute("list", list);
		
		return "stuff/stuffEnroll";
	}
	
	
	//물품 정보 등록
	@RequestMapping("/stuff/stuffEnrollEnd.do")
	public String stuffEnrollEnd(@RequestParam Map<String, String> param ,Model model,
			HttpServletRequest request, @RequestParam(value="upFile", required=false) MultipartFile[] upFile) {
		
		
		String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/stuff");
		List<StuffUpload> stuffUploadList = new ArrayList();
		
		File dir = new File(saveDir);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				String imgOriname = f.getOriginalFilename();
				String ext = imgOriname.substring(imgOriname.lastIndexOf("."));
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
				int rdv = (int)(Math.random()*1000);
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rdv + ext;
				
				try {
					f.transferTo(new File(saveDir + "/" + reName));
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				StuffUpload su = new StuffUpload();
				su.setImgOriname(imgOriname);
				su.setImgRename(reName);
				stuffUploadList.add(su);
			}
		}
		
		int result = 0;
		try {
			result = service.stuffEnrollEnd(param, stuffUploadList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String msg = "";
		String loc = "/stuff/stuffAllList.do";
		
		if(result > 0) {
			
			msg = "물품 등록 완료!";
			model.addAttribute("msg", msg);
			
    	} else {
			
			msg = "물품 등록 실패!";
			model.addAttribute("msg", msg);

		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		
		return "common/msg";
	}
	
	//물품 이름 중복 검사
	@RequestMapping("/stuff/stuffNameDupliCheck.do")
	public @ResponseBody int stuffNameDupliCheck(@RequestParam("stuffName") String stuffName) {
		
		int result = service.stuffNameDupliCheck(stuffName);
		
		return result;
	}
	
	//등록한 물품 전체 조회
	@RequestMapping("/stuff/stuffAllList.do")
	public ModelAndView stuffAllList(@RequestParam(value="cPage", 
			required=false, defaultValue="0") int cPage) {
		
		ModelAndView mv = new ModelAndView();
		
		int numPerPage = 10;
		List<Stuff> list=service.selectStuffList(cPage,numPerPage);
		int totalCount = service.selectStuffCount();
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/bm/stuff/stuffAllList"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("stuff/stuffList");
		return mv;
	}
	
	//물품 자세히 보기
	@RequestMapping("/stuff/stuffSeeMore.do")
	public String stuffSeeMore(Model model, @RequestParam("stuffNo") int stuffNo) {
		
		Stuff s = service.stuffSeeMore(stuffNo);
		StuffSubcategory sc = service.stuffScName(s.getScNo());
		String scName = sc.getScName();
		
		model.addAttribute("stuff", s);
		model.addAttribute("scName", scName);
		
		return "stuff/stuffSeeMore";
	}
	//물품 검색
	@RequestMapping("/stuff/searchStuff.do")
	public ModelAndView searchStuff(@RequestParam(value="cPage", 
			required=false, defaultValue="0") int cPage, @RequestParam(value = "type") String type, @RequestParam(value = "data") String data) {
		
		int numPerPage = 10;	
		Map<String, Object> m = new HashMap();
		m.put("cPage", cPage);
		m.put("numPerPage", numPerPage);
		m.put("data", data); // 빈칸에 입력한 값
		m.put("type", type); // select에서 가져온 값 
				
		List<Stuff> list=service.selectStuffSearchList(m);
		int totalCount = service.selectStuffSearchCount(m);
		
		System.out.println("list : " + list);
		System.out.println("totalCount : " + totalCount);
		
		
		ModelAndView mv = new ModelAndView();
		
		if(totalCount > 0) {
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/stuff/searchStuff"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("stuff/stuffList");
		
		} else {
			
			String msg = "검색 결과가 없습니다!";
			String loc = "/stuff/stuffAllList.do";
			
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			
		}
		
		return mv;
		
	}
	
	
	//물품등록 화면에서 사용할 서브카테고리 전체 목록 조회 (Ajax임)
	@RequestMapping("/stuff/stuffSubcategoryList.do")
	public @ResponseBody List<StuffSubcategory> stuffSubcategoryList(@RequestParam("mcNo") int mcNo) {
		
		List<StuffSubcategory> list2 = service.stuffSubcategoryList(mcNo);
		return list2;
	}
	
	@RequestMapping("/stuff/stuffOne.do")
	public ModelAndView stuffOne(@RequestParam("stuffNo") int stuffNo) {
		
		Stuff stuff = service.stuffOne(stuffNo);
		
		
		return null;
	}
	

	


}
