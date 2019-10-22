
package com.spring.bm.employee.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.bm.employee.model.vo.EmpFile;

public interface EmployeeDao {

	/* 사원리스트불러오기 */
	List<Map<String, String>> selectEmpList(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectEmpCount(SqlSessionTemplate session);
	/* 사원리스트불러오기끝 */

	/* 사원등록 */
	int insertEmp(SqlSessionTemplate session, Map<String, String> param);
	/* 사원첨부파일등록 */
	int insertEmpFile(SqlSessionTemplate session, EmpFile e);
	/* 사원등록끝 */
	/* 사원상세보기 */
	Map<String, Object> selectEmpOne(SqlSessionTemplate session, int empNo);
	List<EmpFile> selectEmpFileList(SqlSessionTemplate session, int empNo);
	/* 사원로그인*/
	Map<String, String> selectLoginEmp(SqlSessionTemplate session, Map<String, String> map);
	/* 사원검색 */
	List<Map<String, String>> selectEmpSearchList(SqlSessionTemplate session, Map<String, Object> param);
	int selectEmpSearchCount(SqlSessionTemplate session, Map<String, Object> param);
	/* 아이디 중복확인 */
	int checkId(SqlSessionTemplate session, String empId);
	/* 첨부파일삭제 */
	int deleteEmpFile(SqlSessionTemplate session, int efNo);
	/* 사원수정 */
	int updateEmp(SqlSessionTemplate session, Map<String, Object> param);
	
}

