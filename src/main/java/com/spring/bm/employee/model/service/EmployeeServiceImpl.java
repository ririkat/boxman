package com.spring.bm.employee.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.employee.model.dao.EmployeeDao;
import com.spring.bm.employee.model.vo.EmpFile;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeDao dao;
	@Autowired
	SqlSessionTemplate session;

	/* 사원리스트불러오기 */
	@Override
	public List<Map<String, String>> selectEmpList(int cPage, int numPerPage) {

		return dao.selectEmpList(session, cPage, numPerPage);
	}
	@Override
	public int selectEmpCount() {
		// TODO Auto-generated method stub
		return dao.selectEmpCount(session);
	}
	/* 사원리스트불러오기끝 */
	/* 사원등록 */
	@Override
	public int insertEmp(Map<String, String> param, List<EmpFile> fileList) throws Exception{
		int result = 0;
		result = dao.insertEmp(session, param);
		if(result == 0) throw new Exception();
		if(fileList.size()>0) {
			for(EmpFile e : fileList) {
				e.setEmpNo(Integer.parseInt(param.get("empNo")));
				result = dao.insertEmpFile(session, e);
				if(result == 0) throw new Exception();
			}
		}
		return result;
	}

	/* 사원상세보기 */
	@Override
	public Map<String, Object> selectEmpOne(int empNo) {
		return dao.selectEmpOne(session, empNo);
	}
	
	@Override
	public List<EmpFile> selectEmpFileList(int empNo) {
		// TODO Auto-generated method stub
		return dao.selectEmpFileList(session, empNo);
	}
	/* 사원로그인*/
	@Override
	public Map<String, Object> selectLoginEmp(Map<String, Object> map) {
		return dao.selectLoginEmp(session,map);
	}
	
	/* 사원검색 */
	@Override
	public List<Map<String, String>> selectEmpSearchList(int cPage, int numPerPage, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectEmpSearchList(session, cPage, numPerPage, param);
	}
	@Override
	public int selectEmpSearchCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectEmpSearchCount(session, param);
	}
	/* 아이디중복확인 */
	@Override
	public int checkId(String empId) {
		// TODO Auto-generated method stub
		return dao.checkId(session, empId);
	}
	
	/* 첨부파일삭제 */
	@Override
	public int deleteEmpFile(int efNo) throws Exception{
		int result = 0;
		result = dao.deleteEmpFile(session, efNo);
		if(result == 0) throw new Exception();
		
		return result;
	}
	
	/* 사원수정 */
	@Override
	public int updateEmp(Map<String, Object> param, List<EmpFile> fileList) throws Exception {
		int result = 0;
		result = dao.updateEmp(session, param);
		if(result == 0) throw new Exception();
		if(fileList.size()>0) {
			for(EmpFile e : fileList) {
				e.setEmpNo(Integer.parseInt(String.valueOf(param.get("empNo"))));
				result = dao.insertEmpFile(session, e);
				if(result == 0) throw new Exception();
			}
		}
		
		return result;
	}
	
	/* 비밀번호수정 */
	@Override
	public int updatePassword(Map<String, Object> param) throws Exception {
		int result = 0;
		result = dao.updatePassword(session, param);
		if(result == 0) throw new Exception();
		return result;
	}
	
	/* 출퇴근위치정보 확인 */
	@Override
	public int checkLocation(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.checkLocation(session, param);
	}
	
	/* 출근등록 */
	@Override
	public int insertGotoWork(Map<String, Object> param) throws Exception {
		int result = 0;
		result = dao.insertGotoWork(session, param);
		if(result == 0) throw new Exception();
		return result;
	}
	
	/* 퇴근등록 */
	@Override
	public int updateOffWork(Map<String, Object> param) throws Exception{
		int result = 0;
		result = dao.updateOffWork(session, param);
		if(result == 0) throw new Exception();
		return result;
	}
	
	/* 근태하나보기 */
	@Override
	public Map<String, Object> selectAttenOne(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectAttenOne(session, param);
	}
	
	/* 근태현황보기 */
	@Override
	public List<Map<String, String>> selectAttenList(Map<String, Object> param, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectAttenList(session, param, cPage, numPerPage);
	}
	
	@Override
	public int selectAttenCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectAttenCount(session, param);
	}
	/* 근태현황보기끝 */
	
	/* 휴가리스트출력 */
	@Override
	public List<Map<String, String>> selectDayOffList(Map<String, Object> param, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectDayOffList(session, param, cPage, numPerPage);
	}
	@Override
	public int selectDayOffCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectDayOffCount(session, param);
	}
	/* 휴가리스트출력 끝 */
	
	/* 출장리스트출력 */
	@Override
	public List<Map<String, String>> selectBTList(Map<String, Object> param, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectBTList(session, param, cPage, numPerPage);
	}
	@Override
	public int selectBTCount(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectBTCount(session, param);
	}
	/* 출장리스트출력 끝 */
	/* 근태수정용 한개보기 */
	@Override
	public Map<String, Object> selectAttenNoOne(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectAttenNoOne(session, param);
	}
	/* 남은 휴가일수 보기 */
	@Override
	public int selectDoRemaining(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectDoRemaining(session, map);
	}
	
	/* 휴가신청 */
	@Override
	public int insertDayOff(Map<String, Object> param) throws Exception {
		int result = 0;
		result = dao.insertDayOff(session, param);
		if(result == 0) throw new Exception();
		return result;
	}
	
	/* 출장신청 */
	@Override
	public int insertBT(Map<String, Object> param) throws Exception {
		int result = 0;
		result = dao.insertBT(session, param);
		if(result == 0) throw new Exception();
		return result;
	}
	
	/* 근태수정 */
	@Override
	public int insertUpAttendance(Map<String, Object> param) throws Exception {
		int result = 0;
		result = dao.insertUpAttendance(session, param);
		if(result == 0) throw new Exception();
		return result;
	}
	
	/* 출장비 리스트 */
	@Override
	public List<Map<String, Object>> selectBTPList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectBTPList(session, param);
	}
	
	/* 출장 하나 */
	@Override
	public Map<String, Object> selectBTOne(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectBTOne(session, param);
	}
	
	/* 출장비등록 */
	@Override
	public int insertBTP(Map<String, Object> param) throws Exception {
		int result = 0;
		result = dao.insertBTP(session, param);
		if(result == 0) throw new Exception();
		return result;
	}
	
	/* 사원통계 */
	@Override
	public List<Map<String, Object>> empYearCount() {
		// TODO Auto-generated method stub
		return dao.empYearCount(session);
	}
	@Override
	public List<Map<String, Object>> newEmpYearCount() {
		// TODO Auto-generated method stub
		return dao.newEmpYearCount(session);
	}
	@Override
	public List<Map<String, Object>> entEmpYearCount() {
		// TODO Auto-generated method stub
		return dao.entEmpYearCount(session);
	}
	
	/* 근태수정 한개보기 */
	@Override
	public Map<String, Object> selectUpAttendanceOne(int result) {
		// TODO Auto-generated method stub
		return dao.selectUpAttendanceOne(session, result);
	}
	
	/* 휴가한개보기 */
	@Override
	public Map<String, Object> selectDayoffOne(int doNo) {
		// TODO Auto-generated method stub
		return dao.selectDayoffOne(session, doNo);
	}

	/* 출장비한개보기 */
	@Override
	public Map<String, Object> selectBTPOne(int btpNo) {
		// TODO Auto-generated method stub
		return dao.selectBTPOne(session, btpNo);
	}
	

	
}