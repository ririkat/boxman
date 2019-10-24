package com.spring.bm.notice.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.bm.common.PageBarFactory;
import com.spring.bm.department.model.service.DepartmentService;
import com.spring.bm.employee.model.service.EmployeeService;
import com.spring.bm.notice.model.service.NoticeService;
import com.spring.bm.notice.model.vo.Notice;
import com.spring.bm.notice.model.vo.UploadNotice;

@Controller
public class NoticeController {

   @Autowired
   NoticeService noticeService;
   @Autowired
   DepartmentService deptservice;
   @Autowired
   EmployeeService empSerivce;
   //   @RequestParam(name="empNo") int empNo
   //게시판에서 게시판등록화면으로 화면전환
   @RequestMapping("/notice/notice.do")
   public String Notice(Model model) {
      List<Map<String, String>> list = deptservice.selectDeptList();
      //      Map<String, String> empMap = empSerivce.selectEmpOne(empNo);

      //      model.addAttribute("empOne",empMap);
      model.addAttribute("deptList",list);

      return "notice/noticeInsert";
   }

   //부서별게시판에서 부서별게시판등록화면으로 화면전환
   @RequestMapping("/notice/noticeDept.do")
   public String NoticeDept(Model model) {
      List<Map<String, String>> list = deptservice.selectDeptList();
      //      Map<String, String> empMap = empSerivce.selectEmpOne(empNo);

      //      model.addAttribute("empOne",empMap);
      model.addAttribute("deptList",list);

      return "notice/noticeDeptInsert";
   }

   //가이드라인화면에서 가이드라인등록화면으로 화면전환
   @RequestMapping("/notice/guideline.do")
   public String NoticeGuideline(Model model) {
      List<Map<String, String>> list = deptservice.selectDeptList();
      //      Map<String, String> empMap = empSerivce.selectEmpOne(empNo);

      //      model.addAttribute("empOne",empMap);
      model.addAttribute("deptList",list);

      return "notice/guidelineInsert";
   }

   //게시판등록 ,첨부파일
   @RequestMapping("/notice/insertNotice.do")
   public ModelAndView insertNotice(@RequestParam Map<String, Object> param,
         @RequestParam(value="upFile", required=false) MultipartFile[] upFile, HttpServletRequest request) {


      if(param.get("nCheck") == null || !param.get("nCheck").equals("필독체크") || param.get("nCheck").equals("null")) {
         param.remove("nCheck");
         param.put("nCheck", "필수아님");
      }
      //                파일업로드 처리하기
      //         1.저장경로 지정하기
      String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/notice");

      List<UploadNotice> upNoticeList=new ArrayList(); //여러파일 보관용

      File dir=new File(saveDir);

      for(MultipartFile f : upFile) {
         if(!f.isEmpty()) {
            //파일명 생성(rename)
            String oriFileName=f.getOriginalFilename();
            String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
            //규칙설정
            SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
            int rdv = (int)(Math.random()*1000);
            String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
            try {
               f.transferTo(new File(saveDir+"/"+reName));
            }catch(Exception e) {
               e.printStackTrace();
            }
            //DB에 저장할 데이터 보관
            UploadNotice un=new UploadNotice();
            un.setUpNoticeOrgName(oriFileName);
            un.setUpNoticeReName(reName);
            upNoticeList.add(un);
         }
      }

      int result=0;
      try {
         result=noticeService.insertNotice(param,upNoticeList);

      } catch (Exception e) {

         e.printStackTrace();
      }

      String categoryNo = request.getParameter("categoryNo");

      String msg="";      
      String loc="";

      switch(categoryNo) {
      case "1" : loc="/notice/selectNoticeList.do"; break;
      case "2" : loc="/notice/selectNoticeDeptList.do"; break;
      case "3" : loc="/notice/guidelineList.do"; break;
      }

      if(result>0) {
         msg="게시판등록성공!";
      }else {
         msg="게시판등록실패!";
      }

      ModelAndView mv = new ModelAndView();
      mv.addObject("msg",msg);
      mv.addObject("loc",loc);
      mv.setViewName("common/msg");

      return mv;
   }


   //작성글 상세페이지로 연결
   @RequestMapping("/notice/selectNoticeOne.do")
   public String selectNoticeOne(@RequestParam(name="nName") String nName, @RequestParam("nReadCount") int nReadCount, Model model, @RequestParam(name="nNo") int nNo) {

      Notice nt = noticeService.selectNoticeOne(nName);
      List<UploadNotice> upNotice  = noticeService.selectUpNoticeList(nNo);
      List<Map<String,String>> list2 = noticeService.selectNoticeCheck(nName);
      //조회수 +1
      int rc = noticeService.updateReadCount(nReadCount);

      model.addAttribute("upNotice",upNotice);
      model.addAttribute("list2",list2);
      model.addAttribute("nt",nt);
      model.addAttribute("rc",rc);

      return "notice/noticeOne";
   }

   //게시글 수정
   @RequestMapping("/notice/updateNotice.do")
   public ModelAndView updateNotice(@RequestParam Map<String, Object> param,
         @RequestParam(value="upFile", required=false) MultipartFile[] upFile, HttpServletRequest request) {

      int result=0;
      int result2=0;
      
      if(upFile[0].getOriginalFilename() != "") {

         int result3 = noticeService.deleteUpNotice(param);

         String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/notice");

         List<UploadNotice> upNoticeList=new ArrayList(); //여러파일 보관용

         File dir=new File(saveDir);

         for(MultipartFile f : upFile) {
            if(!f.isEmpty()) {
               //파일명 생성(rename)
               String oriFileName=f.getOriginalFilename();
               String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
               //규칙설정
               SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
               int rdv = (int)(Math.random()*1000);
               String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
               try {
                  f.transferTo(new File(saveDir+"/"+reName));
               }catch(Exception e) {
                  e.printStackTrace();
               }
               //DB에 저장할 데이터 보관
               UploadNotice un=new UploadNotice();
               un.setUpNoticeOrgName(oriFileName);
               un.setUpNoticeReName(reName);
               upNoticeList.add(un);
            }
         }

         try {
            
            result2=noticeService.updateNotice(param,upNoticeList);
         } catch (Exception e) {

            e.printStackTrace();
         }

      } else {

         result = noticeService.updateNotice(param);
      }
      
      String msg="";
      String loc="/";
      if(result > 0 || result2 > 0) {
            msg = "게시글 수정 완료!";
         } else {
            msg = "게시글 수정 실패!";
         }
      
         ModelAndView mv = new ModelAndView();
         mv.addObject("msg", msg);
         mv.addObject("loc", loc);
         mv.setViewName("common/msg");

      return mv;
   }

   //게시글 삭제
   @RequestMapping("/notice/deleteNotice.do")
   public ModelAndView deleteNotice(@RequestParam Map<String, Object> param) {

      int result = noticeService.deleteNotice(param);

      String msg="";
      String loc="/notice/selectNoticeList.do";

      if(result>0) {
         msg="게시글 삭제 완료!";
      }else {
         msg="게시글 삭제 실패!";
      }
      ModelAndView mv = new ModelAndView();

      mv.addObject("msg",msg);
      mv.addObject("loc",loc);
      mv.setViewName("common/msg");
      return mv;

   }

   //메인화면에서 게시판화면으로 화면전환, 게시판목록 (페이징처리)
   //ModelAndView : 모델과 view를 한번에 묶어서 처리
   @RequestMapping("/notice/selectNoticeList.do")
   public ModelAndView selectList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {

      //반환될 modelAndView객체 생성
      ModelAndView mv = new ModelAndView();
      int numPerPage = 5;
      List<Map<String,String>> list = noticeService.selectNoticeList(cPage, numPerPage);
      List<Notice> list2 = noticeService.selectNoticeList2();
      int totalCount = noticeService.selectNoticeCount();

      mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/bm/notice/selectNoticeList.do"));
      mv.addObject("count", totalCount);
      mv.addObject("list",list);   //key value형식 -> model로 들어감
      mv.addObject("list2",list2); //필독체크 리스트

      mv.setViewName("notice/noticeList");   // -> view

      return mv;
   }

   //메인화면에서 부서별 게시판화면으로 화면전환, 부서별게시판목록 (페이징처리)
   @RequestMapping("/notice/selectNoticeDeptList.do")
   public ModelAndView selectDeptList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage, Model model) {

      //반환될 modelAndView객체 생성
      ModelAndView mv = new ModelAndView();
      int numPerPage = 5;
      List<Map<String,String>> list = noticeService.selectNoticeList(cPage, numPerPage);
      List<Notice> list2 = noticeService.selectNoticeList2();
      int totalCount = noticeService.selectNoticeCount2();

      mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/bm/notice/selectNoticeDeptList.do"));
      mv.addObject("count", totalCount);
      mv.addObject("list",list);   //key value형식 -> model로 들어감
      mv.addObject("list2",list2); //필독체크 리스트

      mv.setViewName("notice/noticeDeptList");   // -> view

      return mv;
   }

   //메인화면에서 가이드라인리스트화면으로
   @RequestMapping("/notice/guidelineList.do")
   public ModelAndView guideLineList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage, Model model) {

      //반환될 modelAndView객체 생성
      ModelAndView mv = new ModelAndView();
      int numPerPage = 5;
      List<Map<String,String>> list = noticeService.selectNoticeList(cPage, numPerPage);
      List<Notice> list2 = noticeService.selectNoticeList2();
      int totalCount = noticeService.selectNoticeCount3();

      mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/bm/notice/guidelineList.do"));
      mv.addObject("count", totalCount);
      mv.addObject("list",list);   //key value형식 -> model로 들어감
      mv.addObject("list2",list2); //필독체크 리스트

      mv.setViewName("notice/guidelineList");   // -> view

      return mv;
   }

   @RequestMapping("/notice/noticeForm")
   public String boardForm() {
      return "notice/noticeForm";
   }

   //업로드된 첨부파일 다운로드
   @RequestMapping("/notice/filedownLoad.do")
   public void fileDownLoad(String oName, String rName, HttpServletRequest req, HttpServletResponse res) {
      BufferedInputStream bis = null;
      ServletOutputStream sos = null;
      String dir = req.getSession().getServletContext().getRealPath("/resources/b4/upload/notice");
      File saveFile = new File(dir + "/" + rName);
      try {
         FileInputStream fis = new FileInputStream(saveFile);
         bis = new BufferedInputStream(fis);
         sos = res.getOutputStream();
         String resFileName = "";
         boolean isMSIE = req.getHeader("user-agent").indexOf("MSIE")!=-1 ||
               req.getHeader("user-agent").indexOf("Trident")!= -1;
         if(isMSIE) {
            resFileName = URLEncoder.encode(oName,"UTF-8");
            resFileName = resFileName.replaceAll("\\+", "%20");   //띄어쓰기 바꿔주는것
         } else {
            resFileName = new String(oName.getBytes("UTF-8"),"ISO-8859-1");
         }
         res.setContentType("application/octet-stream;charset=utf-8");
         res.addHeader("Content-Disposition", "attachment;filename=\"" + resFileName + "\"");
         res.setContentLength((int)saveFile.length());

         int read = 0;
         while((read=bis.read()) != -1) {
            sos.write(read);
         }
      } catch(IOException e) {
         e.printStackTrace();
      } finally {
         try {
            sos.close();
            bis.close();
         } catch(IOException e) {
            e.printStackTrace();
         }
      }
   }

   //사이트등록화면
   @RequestMapping("/notice/insertSite.do")
   public String insertSite() {
      return "notice/insertSite";
   }

   //사이트등록완료
   @RequestMapping("/notice/insertSiteEnd.do")
   public ModelAndView insertSiteEnd(@RequestParam Map<String, Object> param) {

      int result=noticeService.insertSite(param);

      String msg="";
      String loc="/notice/site.do";
      if(result>0) {
         msg="사이트등록성공!";
      }else {
         msg="사이트등록실패!";
      }

      ModelAndView mv = new ModelAndView();
      mv.addObject("msg",msg);
      mv.addObject("loc",loc);
      mv.setViewName("common/msg");

      return mv;
   }

   //관련사이트 목록
   @RequestMapping("/notice/site.do")
   public ModelAndView siteList() {

      //반환될 modelAndView객체 생성
      ModelAndView mv = new ModelAndView();

      List<Map<String,Object>> list = noticeService.selectSiteList(); //내부
      System.out.println("내부 ---->"+list);
      List<Map<String,Object>> list2 = noticeService.selectSiteList2(); //외부
      System.out.println("외부 ---->"+list2);

      mv.addObject("list",list);
      mv.addObject("list2",list2);
      mv.setViewName("notice/noticeSite");   // -> view

      return mv;
   }

   //게시판글 검색
   @RequestMapping("/notice/searchNotice.do")
   public ModelAndView searchNotice(@RequestParam(value="cPage", 
   required=false, defaultValue="0") int cPage, HttpServletRequest req) {


      String data = req.getParameter("data");
      int numPerPage = 10;
      Map<String, Object> m = new HashMap();
      m.put("cPage", cPage);
      m.put("numPerPage", numPerPage);
      m.put("data", data); // 빈칸에 입력한 값

      List<Map<String,String>> list=noticeService.selectNoticeSearchList(m);
      List<Notice> list2 = noticeService.selectNoticeList2();

      int totalCount = noticeService.selectNoticeSearchCount(m);

      System.out.println("list : " + list);
      System.out.println("totalCount : " + totalCount);

      ModelAndView mv = new ModelAndView();

      mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/bm/notice/searchNotice.do"));
      mv.addObject("count",totalCount);
      mv.addObject("list",list);
      mv.addObject("list2",list2);
      mv.setViewName("notice/noticeList");
      return mv;

   }

}