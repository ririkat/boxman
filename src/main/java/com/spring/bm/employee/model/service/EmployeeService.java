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
	Map<String, String> selectLoginEmp(Map<String, String> map);
	/* 사원검색 */
	List<Map<String, String>> selectEmpSearchList(Map<String, Object> param);
	int selectEmpSearchCount(Map<String, Object> param);
	
}

