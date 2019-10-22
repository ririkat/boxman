
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
	
	
	
	

}

