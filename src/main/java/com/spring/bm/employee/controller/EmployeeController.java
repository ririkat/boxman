
package com.spring.bm.employee.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.bm.common.PageBarFactory;
import com.spring.bm.department.model.service.DepartmentService;
import com.spring.bm.empjob.model.service.EmpJobService;
import com.spring.bm.employee.model.service.EmployeeService;
import com.spring.bm.employee.model.vo.EmpFile;



@Controller
public class EmployeeController {

	private Logger logger=LoggerFactory.getLogger(EmployeeController.class);

	@Autowired
	EmployeeService service;
	@Autowired
	DepartmentService dService;
	@Autowired
	EmpJobService jService;
	@Autowired
	BCryptPasswordEncoder pwEncoder;

	/* 사원등록 */
	@RequestMapping("/emp/insertEmp.do")	//사원등록 폼으로 전환
	public String insertEmp(Model model) {

		List<Map<String, String>> dept = dService.selectDeptList();
		model.addAttribute("dept", dept);

		List<Map<String, String>> job = jService.empJobList();
		model.addAttribute("job", job);

		return "emp/empEnroll";
	}

	/* 사원리스트 불러오기 */
	@RequestMapping("/emp/empList.do")
	public ModelAndView empList(@RequestParam(value="cPage", 
	required=false, defaultValue="0") int cPage) {

		int numPerPage = 10;
		List<Map<String,String>> list = service.selectEmpList(cPage, numPerPage);
		int totalCount = service.selectEmpCount();

		ModelAndView mv=new ModelAndView();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/bm/emp/empList.do"));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("emp/empList");
		return mv;
	}

	/* 사원상세보기 */
	@RequestMapping("/emp/selectEmpOne.do")
	public ModelAndView selectEmpOne(int empNo, String temp) {
		Map<String, Object> empMap = service.selectEmpOne(empNo);
		List<EmpFile> list = service.selectEmpFileList(empNo);
		
		Map<String, Object> dept = dService.selectDeptOne(Integer.parseInt(String.valueOf(empMap.get("DEPTNO"))));
		Map<String, Object> job = jService.selectEmpJobOne(Integer.parseInt(String.valueOf(empMap.get("JOBNO"))));
		List<Map<String, String>> deptList = dService.selectDeptList();
		List<Map<String, String>> jobList = jService.empJobList();
		String strAddr = String.valueOf(empMap.get("EMPADDR"));
		String[] addr = strAddr.split("/");

		ModelAndView mv = new ModelAndView();
		mv.addObject("emp", empMap);
		mv.addObject("addr", addr);
		mv.addObject("dept", dept);
		mv.addObject("job", job);
		mv.addObject("deptList", deptList);
		mv.addObject("jobList", jobList);
		mv.addObject("list", list);
		mv.setViewName("emp/empOne");
		
		return mv;
	}


	/* 사원로그인*/
	@RequestMapping("/bfLogin/loginEmp.do")
	public ModelAndView empLogin(@RequestParam Map<String,String> map,HttpSession session) {

//		logger.debug((String) map.get("empId"));
//		logger.debug((String) map.get("empPassword"));

		Map<String, String> m = service.selectLoginEmp(map);

//		logger.debug("--------------------");
//		logger.debug((String) m.get("EMPID"));
//		logger.debug((String) m.get("EMPPASSWORD"));

		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "";
//		if(m.get("EMPPASSWORD").equals(map.get("empPassword"))) {
		if (pwEncoder.matches((CharSequence) map.get("empPassword"), m.get("EMPPASSWORD"))) {
			msg = "로그인 성공";
			loc="/common/main.do";
			session.setAttribute("loginEmp", m);//HttpSession 사용
			session.setMaxInactiveInterval(60*60);//세션유효시간 1분
		} else {
			msg = "로그인 실패";
			loc="/";
		}

		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");

		return mv;
	}

	/* 사원로그아웃*/
	@RequestMapping("/emp/logoutEmp.do")
	public String empLogout(HttpSession session) {
		session.invalidate();//세션 삭제
		return "redirect:/";
	}

	@RequestMapping("/emp/insertEmpEnd.do")	//사원 등록 완료
	public ModelAndView insertEmpEnd(@RequestParam Map<String, String> param,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFile,
			@RequestParam(value="proImg", required=false) MultipartFile proImg,
			@RequestParam(value="stampImg", required=false) MultipartFile stampImg,
			HttpServletRequest request) {
		
		logger.debug(param.get("password"));
		String empPassword = pwEncoder.encode((String)param.get("password"));
		param.put("empPassword", empPassword);
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/emp");

		List<EmpFile> fileList = new ArrayList();
		
		File dir = new File(saveDir);

		if(!dir.exists()) logger.debug("생성결과 : " + dir.mkdir());
		if(!proImg.isEmpty()) {
			String oriFileName=proImg.getOriginalFilename();
			String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
			//규칙설정
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
			int rdv=(int)(Math.random()*1000);
			String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
			//파일 실제 저장하기
			try {
				proImg.transferTo(new File(saveDir+"/"+reName));
			}catch (Exception e) {//IlligalStateException|IOException
				e.printStackTrace();
			}
			EmpFile ef = new EmpFile();
			ef.setEfcName("증명사진");
			ef.setEfOrgName(oriFileName);
			ef.setEfReName(reName);
			fileList.add(ef);
		}
		if(!stampImg.isEmpty()) {
			String oriFileName=stampImg.getOriginalFilename();
			String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
			//규칙설정
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
			int rdv=(int)(Math.random()*1000);
			String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
			//파일 실제 저장하기
			try {
				stampImg.transferTo(new File(saveDir+"/"+reName));
			}catch (Exception e) {//IlligalStateException|IOException
				e.printStackTrace();
			}
			EmpFile ef = new EmpFile();
			ef.setEfcName("결재도장");
			ef.setEfOrgName(oriFileName);
			ef.setEfReName(reName);
			fileList.add(ef);
		}
		
		
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				//파일명 생성(rename)
				String oriFileName=f.getOriginalFilename();
				String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
				//규칙설정
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
				int rdv=(int)(Math.random()*1000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
				//파일 실제 저장하기
				try {
					f.transferTo(new File(saveDir+"/"+reName));
				}catch (Exception e) {//IlligalStateException|IOException
					e.printStackTrace();
				}
				EmpFile ef = new EmpFile();
				ef.setEfcName("자격증");
				ef.setEfOrgName(oriFileName);
				ef.setEfReName(reName);
				fileList.add(ef);
			}
		}
		
		
		int result = 0;
		try {
			result=service.insertEmp(param,fileList);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg = "";
		String loc = "/emp/empList.do";
		if(result > 0) {
			msg = param.get("empName") + "사원이 등록되었습니다.";
		} else {
			msg = param.get("empName") + "사원등록이 실패하였습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	/* 사원등록끝 */
	
	/* 사원검색 */
	@RequestMapping("/emp/searchEmp.do")
	public ModelAndView searchEmp(@RequestParam(value="cPage",required=false, defaultValue="0") int cPage,
			@RequestParam Map<String, Object> param) {
		
		int numPerPage = 10;
		param.put("cPage", cPage);
		param.put("numPerPage", numPerPage);
		List<Map<String, String>> list = service.selectEmpSearchList(param);
		int totalCount = service.selectEmpSearchCount(param);

		ModelAndView mv=new ModelAndView();
		mv.addObject("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/bm/emp/empList.do"));
		mv.addObject("count", totalCount);
		mv.addObject("list", list);
		mv.setViewName("emp/empList");
		return mv;
	}

	/* 아이디중복확인 */
	@RequestMapping("/emp/checkId.do")
	@ResponseBody
	public int responsBody(String empId, Model model) throws JsonProcessingException {
		
		return service.checkId(empId);
		
	}
	
	/* 사원수정 */
	@RequestMapping("/emp/updateEmpEnd.do")
	public ModelAndView updateEmpEnd(@RequestParam Map<String, Object> param,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFile,
			@RequestParam(value="proImg", required=false) MultipartFile proImg,
			@RequestParam(value="stampImg", required=false) MultipartFile stampImg,
			@RequestParam(value="licenReName", required=false) String[] licenReName,
			HttpServletRequest request
			) {
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/emp");

		List<EmpFile> fileList = new ArrayList();
		List<EmpFile> oriFileList = service.selectEmpFileList(Integer.parseInt(String.valueOf(param.get("empNo"))));
		
		File dir = new File(saveDir);

		if(!dir.exists()) logger.debug("생성결과 : " + dir.mkdir());
		
		for(EmpFile efc : oriFileList) {

			if(!proImg.isEmpty()) {
				String oriFileName=proImg.getOriginalFilename();
				if(efc.getEfcName().equals("증명사진") && !oriFileName.equals(efc.getEfOrgName())) {
					int result = 0;
					try {
						result = service.deleteEmpFile(efc.getEfNo());
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					if(result > 0) {
					String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
						//규칙설정
						SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
						int rdv=(int)(Math.random()*1000);
						String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
						//파일 실제 저장하기
						try {
							proImg.transferTo(new File(saveDir+"/"+reName));
						}catch (Exception e) {//IlligalStateException|IOException
							e.printStackTrace();
						}
						EmpFile ef = new EmpFile();
						ef.setEfcName("증명사진");
						ef.setEfOrgName(oriFileName);
						ef.setEfReName(reName);
						fileList.add(ef);
					}
				}
			}
			if(!stampImg.isEmpty()) {
				String oriFileName=stampImg.getOriginalFilename();
				if(efc.getEfcName().equals("결재도장") && !oriFileName.equals(efc.getEfOrgName())) {
					int result = 0;
					try {
						result = service.deleteEmpFile(efc.getEfNo());
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					if(result > 0) {
						String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
						//규칙설정
						SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
						int rdv=(int)(Math.random()*1000);
						String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
						//파일 실제 저장하기
						try {
							stampImg.transferTo(new File(saveDir+"/"+reName));
						}catch (Exception e) {//IlligalStateException|IOException
							e.printStackTrace();
						}
						EmpFile ef = new EmpFile();
						ef.setEfcName("결재도장");
						ef.setEfOrgName(oriFileName);
						ef.setEfReName(reName);
						fileList.add(ef);
					}
				}
			}
			if(efc.getEfcName().equals("자격증")) {
				int count = 0;
				for(MultipartFile f : upFile) {
					for(EmpFile efc1 : oriFileList) {
						String oriFileName=f.getOriginalFilename();
						if(oriFileName.equals(efc1.getEfOrgName())) {
							logger.debug(""+f);
							logger.debug(efc.getEfOrgName());
							count++;
						}
					}
				}
				if(count==0) {
					int result = 0;
					try {
						result = service.deleteEmpFile(efc.getEfNo());
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
//					if(result > 0) {
//						String oriFileName=f.getOriginalFilename();
//						String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
//						//규칙설정
//						SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
//						int rdv=(int)(Math.random()*1000);
//						String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
//						//파일 실제 저장하기
//						try {
//							f.transferTo(new File(saveDir+"/"+reName));
//						}catch (Exception e) {//IlligalStateException|IOException
//							e.printStackTrace();
//						}
//						EmpFile ef = new EmpFile();
//						ef.setEfcName("자격증");
//						ef.setEfOrgName(oriFileName);
//						ef.setEfReName(reName);
//						fileList.add(ef);
//					}
				}
			}
		}
		
		//자격증 새로 등록 
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				//파일명 생성(rename)
				String oriFileName=f.getOriginalFilename();
				String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
				//규칙설정
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
				int rdv=(int)(Math.random()*1000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
				//파일 실제 저장하기
				try {
					f.transferTo(new File(saveDir+"/"+reName));
				}catch (Exception e) {//IlligalStateException|IOException
					e.printStackTrace();
				}
				EmpFile ef = new EmpFile();
				ef.setEfcName("자격증");
				ef.setEfOrgName(oriFileName);
				ef.setEfReName(reName);
				fileList.add(ef);
			}
		}
		
		
		int result = 0;
		try {
			result=service.updateEmp(param,fileList);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		String msg = "";
		String loc = "/emp/selectEmpOne.do?empNo="+param.get("empNo");
		if(result > 0) {
			msg = param.get("empName") + "사원이 수정되었습니다.";
		} else {
			msg = param.get("empName") + "사원수정이 실패하였습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
}

