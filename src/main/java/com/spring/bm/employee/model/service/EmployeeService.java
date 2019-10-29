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
	/* 아이디중복확인 */
	int checkId(String empId);
	/* 첨부파일삭제 */
	int deleteEmpFile(int efNo) throws Exception;
	/* 사원수정 */
	int updateEmp(Map<String, Object> param, List<EmpFile> fileList) throws Exception;
	/* 비밀번호변경 */
	int updatePassword(Map<String, Object> param) throws Exception;
	/* 출퇴근위치정보 확인 */
	int checkLocation(Map<String, Object> param);
	/* 출근등록 */
	int insertGotoWork(Map<String, Object> param) throws Exception;
	/* 퇴근등록 */
	int updateOffWork(Map<String, Object> param) throws Exception;
	/* 근태하나보기 */
	Map<String, Object> selectAttenOne(Map<String, Object> param);
	/* 근태현황보기 */
	List<Map<String, String>> selectAttenList(Map<String, Object> param, int cPage, int numPerPage);
	int selectAttenCount(Map<String, Object> param);
	/* 휴가리스트출력 */
	List<Map<String, String>> selectDayOffList(Map<String, Object> param, int cPage, int numPerPage);
	int selectDayOffCount(Map<String, Object> param);
	/* 출장리스트출력 */
	List<Map<String, String>> selectBTList(Map<String, Object> param, int cPage, int numPerPage);
	int selectBTCount(Map<String, Object> param);
	
}

