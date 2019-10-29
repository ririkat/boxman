package com.spring.bm.stuff.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
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
import com.spring.bm.connection.model.vo.Connection;
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
      List<Connection> list2 = service.stuffConnectionList();
      
      model.addAttribute("list", list);
      model.addAttribute("list2", list2);
      
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
      
      mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/bm/stuff/stuffAllList.do"));
      mv.addObject("count",totalCount);
      mv.addObject("list",list);
      mv.setViewName("stuff/stuffList");
      return mv;
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
      
      mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/bm/stuff/searchStuff.do"));
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
   
   //물품 상세보기
   @RequestMapping("/stuff/stuffOne.do")
   public ModelAndView stuffOne(@RequestParam("stuffNo") int stuffNo) {
      

      Stuff stuff = service.stuffOne(stuffNo);
      StuffUpload stuffUpload = service.stuffUploadOne(stuffNo);
      List<StuffMaincategory> list = service.stuffMaincategoryList();
      List<Connection> list2 = service.stuffConnectionList();
      StuffMaincategory stuffMaincategory = service.selectMaincategory(stuff.getScNo());
      Connection stuffConnection = service.connectionName(stuff.getConCode());
      
      ModelAndView mv = new ModelAndView();
      mv.addObject("stuff", stuff);
      mv.addObject("stuffUpload", stuffUpload);
      mv.addObject("list", list);
      mv.addObject("list2", list2);
      mv.addObject("stuffMaincategory", stuffMaincategory);
      mv.addObject("sutffConnection", stuffConnection);
      mv.setViewName("stuff/stuffOne");
      
      
      return mv;
   }
   
   //물품 수정
   @RequestMapping("/stuff/stuffUpdateEnd.do")
   public ModelAndView stuffUpdate(@RequestParam Map<String,String> param, HttpServletRequest request,
         @RequestParam(value="upFile", required=false) MultipartFile[] upFile) {
      
      int result1 = 0, result2 = 0;
      int stuffNo = Integer.parseInt(param.get("stuffNo"));

      System.out.println("=======================");
      
      System.out.println(upFile[0].getOriginalFilename());
      
      if(upFile[0].getOriginalFilename() != "") {
    	  
    	  //기존에 있던 DB의 업로드 정보 삭제 
    	  int result3 = service.deleteStuffUpload(param);
    	  
    	  //다시 업로드 추가
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
          
          //물품 정보 수정 및 업로드 재입력
          
          try {
             result2 = service.stuffUpdateEnd(param, stuffUploadList);
          } catch (Exception e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
          }
    	 
      } else {
    	  
    	  //첨부파일 미변경시 물품 내용만 변경
    	  result1 = service.updateStuff(param);
   	  
      }
      
      String msg = "";
      String loc = "/stuff/stuffOne.do?stuffNo="+stuffNo;
      
      if(result1 > 0 || result2 > 0) {
         msg = "물품 수정 완료!";
      } else {
         msg = "물품 수정 실패!";
      }
   
      ModelAndView mv = new ModelAndView();
      mv.addObject("msg", msg);
      mv.addObject("loc", loc);
      mv.setViewName("common/msg");
      
      return mv;
   }
   
   //물품 삭제
   @RequestMapping("/stuff/deleteStuff.do")
   public ModelAndView deleteStuff(@RequestParam(value = "stuffNo") int stuffNo) {
	   
	   System.out.println("물품번호 : " + stuffNo);
	   int result = service.deleteStuff(stuffNo);
	   
	      String msg = "";
	      String loc = "/stuff/stuffAllList.do";
	      
	      if(result > 0) {
	         msg = "물품 삭제 완료!";
	      } else {
	         msg = "물품 삭제 실패!";
	      }
	   
	      ModelAndView mv = new ModelAndView();
	      mv.addObject("msg", msg);
	      mv.addObject("loc", loc);
	      mv.setViewName("common/msg");
	      
	      return mv;
   }
   
   //파일 다운로드
   @RequestMapping("/stuff/filedownLoad.do")
	public void fileDownLoad(String oName,String rName,
			HttpServletRequest req, HttpServletResponse res){
		BufferedInputStream bis=null;
		ServletOutputStream sos=null;
		
		String dir=req.getSession()
				.getServletContext().getRealPath("/resources/upload/stuff");
		File saveFile=new File(dir+"/"+rName);
		try {
			FileInputStream fis=new FileInputStream(saveFile);
			bis=new BufferedInputStream(fis);
			sos=res.getOutputStream();
			String resFileName="";
			boolean isMSIE=req.getHeader("user-agent").indexOf("MSIE")!=-1||
					req.getHeader("user-agent").indexOf("Trident")!=-1;
			if(isMSIE) {
				resFileName=URLEncoder.encode(oName,"UTF-8");
				resFileName=resFileName.replaceAll("\\+", "%20");
			}else {
				resFileName=new String(oName.getBytes("UTF-8"),"ISO-8859-1");
			}
			res.setContentType("application/octet-stream;charset=utf-8");
			res.addHeader("Content-Disposition",
					"stuffUpload;filename=\""+resFileName+"\"");
			res.setContentLength((int)saveFile.length());
			
			int read=0;
			while((read=bis.read())!=-1) {
				sos.write(read);
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
		finally {
			try {
				sos.close();
				bis.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
	}
   
   //이름으로만 물품조회
   @RequestMapping("/stuff/searchStuffName.do")
   public @ResponseBody List<Stuff> searchStuffName(@RequestParam(value="stuffName") String stuffName,
		   @RequestParam(value="conName") String conName) {
	   Map<String,String> map = new HashMap();
	   map.put("stuffName",stuffName);
	   map.put("conName",conName);
	   
	   List<Stuff> list = service.searchStuffName(map);
	   
	   return list;
   }
   

   


}