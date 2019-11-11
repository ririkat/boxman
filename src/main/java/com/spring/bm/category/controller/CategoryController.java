package com.spring.bm.category.controller;

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

import com.spring.bm.category.model.service.CategoryService;
import com.spring.bm.common.PageBarFactory;
import com.spring.bm.common.PageUrlFactory;
import com.spring.bm.stuff.model.vo.StuffMaincategory;
import com.spring.bm.stuff.model.vo.StuffSubcategory;


@Controller
public class CategoryController {
	
	@Autowired
	CategoryService service;
	
	private PageUrlFactory path = new PageUrlFactory();
	
	
	//메인 카테고리 조회
	@RequestMapping("/category/maincategoryUpdate.do")
	public ModelAndView maincategoryUpdate(@RequestParam(value="cPage", 
			required=false, defaultValue="0") int cPage) {
		
		ModelAndView mv = new ModelAndView();
		
		int numPerPage = 10;
		List<StuffMaincategory> list=service.selectMaincategoryList(cPage,numPerPage);
		int totalCount = service.selectMaincategoryCount(); 
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl() +"/category/maincategoryUpdate.do"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("category/maincategoryUpdate");
		return mv;
	}
	
	//서브 카테고리 조회
	@RequestMapping("/category/subcategoryUpdate.do")
	public ModelAndView subcategoryUpdate(@RequestParam(value="cPage", 
			required=false, defaultValue="0") int cPage) {
		
		ModelAndView mv = new ModelAndView();
		
		int numPerPage = 10;
		List<StuffMaincategory> maincategoryList = service.maincategoryList();
		List<StuffSubcategory> subcategoryList = service.subcategoryList(cPage,numPerPage);
		int totalCount = service.selectSubcategoryCount(); 
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, path.getUrl() +"/category/subcategoryUpdate.do"));
		mv.addObject("list", maincategoryList);
		mv.addObject("list2", subcategoryList);
		mv.setViewName("category/subcategoryUpdate");
		

		
		return mv;
		
	}
	
	//메인 카테고리 추가
	@RequestMapping("/category/maincategoryEnrollEnd.do")
	public String maincategoryEnrollEnd(@RequestParam("mcName") String mcName, Model model) {
		
		int result = service.maincategoryEnroll(mcName);
		System.out.println("메인카테고리 결과 : " + result);
		
		String msg = "";
		String loc = "/category/maincategoryUpdate.do";
		
		if(result > 0) {
			
			msg = "메인 카테고리 등록 완료!";
			model.addAttribute("msg", msg);
			
		} else {
			
			msg = "메인 카테고리 등록 실패!";
			model.addAttribute("msg", msg);

		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	//서브 카테고리 추가
	@RequestMapping("/category/subcategoryEnrollEnd.do")
	public String subcategoryEnrollEnd(@RequestParam("scName") String scName, @RequestParam("stuffMain") String mcName, Model model) {
		
		Map<String, Object> m = new HashMap();
		m.put("scName", scName);
		m.put("mcName", mcName);
		
		int result = service.subcategoryEnroll(m);
		
		String msg = "";
		String loc = "/category/subcategoryUpdate.do";
		
		if(result > 0) {
			
			msg = "서브 카테고리 등록 완료!";
			model.addAttribute("msg", msg);
			
		} else {
			
			msg = "서브 카테고리 등록 실패!";
			model.addAttribute("msg", msg);

		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
		
	}
	
	@RequestMapping("/category/maincategoryDelete.do")
	public String maincategoryDelete(@RequestParam("mcName") String mcName, Model model) {
		
		
		int result = service.maincategoryDelete(mcName);
		
		String msg = "";
		String loc = "/category/maincategoryUpdate.do";
		
		if(result > 0) {
			
			msg = "메인 카테고리 삭제 완료!";
			model.addAttribute("msg", msg);
			
		} else {
			
			msg = "메인 카테고리 삭제 실패!";
			model.addAttribute("msg", msg);

		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/category/subcategoryDelete.do")
	public String subcategoryDelete(@RequestParam("scName") String scName, Model model) {
		
		
		int result = service.subcategoryDelete(scName);
		
		String msg = "";
		String loc = "/category/subcategoryUpdate.do";
		
		if(result > 0) {
			
			msg = "서브 카테고리 삭제 완료!";
			model.addAttribute("msg", msg);
			
		} else {
			
			msg = "서브 카테고리 삭제 실패!";
			model.addAttribute("msg", msg);

		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	
	//메인 카테고리 이름 중복 검사
	@RequestMapping("/category/maincategoryNameDupliCheck.do")
	public @ResponseBody int maincategoryNameDupliCheck(@RequestParam("mcName") String mcName) {
		
		System.out.println(mcName);
		
		int result = service.maincategoryNameDupliCheck(mcName);
		System.out.println(result);
		
		return result;
	}
	
	//서브 카테고리 이름 중복 검사
	@RequestMapping("/category/subcategoryNameDupliCheck.do")
	public @ResponseBody int subcategoryNameDupliCheck(@RequestParam("scName") String scName) {
		
		System.out.println(scName);
		
		int result = service.subcategoryNameDupliCheck(scName);
		System.out.println(result);
		
		return result;
	}

}
