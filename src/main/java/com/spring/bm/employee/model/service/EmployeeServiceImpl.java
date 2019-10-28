
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
	public Map<String, String> selectLoginEmp(Map<String, String> map) {
		return dao.selectLoginEmp(session,map);
	}
	
	/* 사원검색 */
	@Override
	public List<Map<String, String>> selectEmpSearchList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return dao.selectEmpSearchList(session, param);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

