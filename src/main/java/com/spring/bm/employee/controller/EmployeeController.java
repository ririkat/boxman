
package com.spring.bm.employee.controller;

import java.io.File;
import java.net.PasswordAuthentication;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.bridge.Message;
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
import com.spring.bm.common.PageBarFactory;
import com.spring.bm.common.encrypt.MyEncrypt;
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
	@Autowired
	MyEncrypt enc;

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
	public ModelAndView empLogin(@RequestParam Map<String,Object> map,HttpSession session) {

		Map<String, Object> m = service.selectLoginEmp(map);
		System.out.println(m.get("EMPNO"));

		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "";
		//		if(m.get("EMPPASSWORD").equals(map.get("empPassword"))) {
		if(m==null) {
			msg = "존재하지 않는 아이디입니다.";
			loc="/";
		}else if (pwEncoder.matches((CharSequence) map.get("empPassword"),(String)m.get("EMPPASSWORD"))) {
			msg = "로그인 성공";
			loc="/common/main.do";
			session.setAttribute("loginEmp", m);//HttpSession 사용
			session.setMaxInactiveInterval(60*60);//세션유효시간 1분
		} else if(pwEncoder.matches((CharSequence) map.get("empPassword"), (String)m.get("EMPPASSWORD"))==false){
			msg = "비밀번호가 일치하지 않습니다.";
			loc="/";
		}else {
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

	/* 사원등록 */
	@RequestMapping("/emp/insertEmpEnd.do")	//사원 등록 완료
	public ModelAndView insertEmpEnd(@RequestParam Map<String, String> param,
			//			@RequestParam(value="upFile", required=false) MultipartFile[] upFile,
			@RequestParam(value="proImg", required=false) MultipartFile proImg,
			@RequestParam(value="stampImg", required=false) MultipartFile stampImg,
			HttpServletRequest request) {

		logger.debug(param.get("password"));
		String empPassword = pwEncoder.encode((String)param.get("password"));
		
		try {
			param.replace("empSSN", enc.encrypt(String.valueOf(param.get("empSSN"))));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
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
			//			@RequestParam(value="upFile", required=false) MultipartFile[] upFile,
			@RequestParam(value="proImg", required=false) MultipartFile proImg,
			@RequestParam(value="stampImg", required=false) MultipartFile stampImg,
			//			@RequestParam(value="licenReName", required=false) String[] licenReName,
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
	
	/* 비밀번호 변경 팝업창 */
	@RequestMapping("/emp/updatePassword.do")
	public ModelAndView updatePassword(String empNo) {
		ModelAndView mv = new ModelAndView();
		logger.debug(String.valueOf(empNo));
		mv.addObject("empNo", empNo);
		mv.setViewName("emp/empUpPassword");
		return mv;
	}
	
	/* 비밀번호 변경 */
	@RequestMapping("/emp/updatePasswordEnd.do")
	@ResponseBody
	public int responsBody(@RequestParam Map<String, Object> param, Model model) throws JsonProcessingException {
		String empPassword = pwEncoder.encode((String)param.get("empPassword"));
		param.put("empPassword", empPassword);
		int result = 0;
		try {
			result = service.updatePassword(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/* 비밀번호 찾기 화면 로드 */
	@RequestMapping("/bfLogin/forgotPassword.do")
	public String forgotPassword() {
		return "emp/empForgotPw1";
	}
	
	/* 비밀번호 찾기 아이디YN 체크 */
	@RequestMapping("/bfLogin/idCheck.do")
	@ResponseBody
	public int fgPwCheckId(@RequestParam Map<String,Object> param) {
		String empId=(String)param.get("empId");
		int result=service.selectEmpIdYN(empId);
		return result;
	}
	
	/* 비밀번호 찾기 이메일 입력 화면 로드 */
	@RequestMapping("/bfLogin/forgotPwEmailSend.do")
	public ModelAndView forgotPwEmailSend(@RequestParam Map<String,Object> param) {
		String empId=(String)param.get("empId");
		Map<String,Object> result=service.selectEmpSchEmpId(empId);
		
		/*SMTP 이메일 발송 로직*/
//		Random rand = new Random();
//        String numStr = ""; //난수가 저장될 변수
//        //6자리 난수 생성하기
//        for(int i=0;i<6;i++) {
//            //0~9 까지 난수 생성
//            String ran = Integer.toString(rand.nextInt(10));
//            numStr += ran;
//        }
//        System.out.println(numStr);
//
//        String toEmail=(String)result.get("EMPEMAIL");
//		System.out.println(toEmail);
//		
//		String host="smtp.gmail.com";
//		String user="ehquf8011@gmail.com";
//		String password="ryustarWkd!1";
//		
//		String msgText="인증코드 : "+numStr+"을 입력하세요<br/>**유효시간이 지나면 자동으로 폐기됩니다.**";
//		
//		Properties props=new Properties();
//		props.put("mail.smtp.host", host);
//		props.put("mail.smtp.port", 587);
//		props.put("mail.smtp.auth", "true");
//		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.starttls.trust", "smtp.gmail.com");
//		
//		Session session=Session.getDefaultInstance(props, new javax.mail.Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(user, password);
//			}
//		});
//		
//		try {
//			MimeMessage message=new MimeMessage(session);
//			message.setFrom(new InternetAddress(user));
//			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
//			
//			message.setSubject("JAVABANG 인증코드 발송");
//			message.setContent(msgText,"text/html;charset=utf-8");
//			
//			Transport.send(message);
//			
//			System.out.println("메세지 발신 성공~");
//			
//		}catch(AddressException e) {
//			e.printStackTrace();
//		}catch(MessagingException e) {
//			e.printStackTrace();
//		}
//		
//		return result;
		return null;
	}
	
}

