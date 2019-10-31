package com.spring.bm.employee.model.service;

import java.util.List;
import java.util.Map;

import com.spring.bm.employee.model.vo.EmpFile;

public interface EmployeeService {

	/* 사원 리스트 불러오기 */
	List<Map<String, String>> selectEmpList(int cPage, int numPerPage);
	int selectEmpCount();
	/* 사원 리스트 불러오기 끝 */
	/* 사원등록 */
	int insertEmp(Map<String, String> param, List<EmpFile> fileList) throws Exception;
	/* 사원상세보기 */
	Map<String, Object> selectEmpOne(int empNo);
	List<EmpFile> selectEmpFileList(int empNo);
	/* 사원로그인*/
	Map<String, Object> selectLoginEmp(Map<String, Object> map);
	/* 사원검색 */
	List<Map<String, String>> selectEmpSearchList(Map<String, Object> param);
	int selectEmpSearchCount(Map<String, Object> param);
	/* 아이디중복확인 */
	int checkId(String empId);
	/* 첨부파일삭제 */
	int deleteEmpFile(int efNo) throws Exception;
	/* 사원수정 */
	int updateEmp(Map<String, Object> param, List<EmpFile> fileList) throws Exception;
	/* 비밀번호변경 */
	int updatePassword(Map<String, Object> param) throws Exception;
	int selectEmpIdYN(String empId);
	Map<String, Object> selectEmpSchEmpId(String empId);
	
}

