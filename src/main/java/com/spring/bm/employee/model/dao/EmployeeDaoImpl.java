
package com.spring.bm.employee.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.spring.bm.employee.controller.EmployeeController;
import com.spring.bm.employee.model.vo.EmpFile;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {
	
	private Logger logger=LoggerFactory.getLogger(EmployeeController.class);

	/* 사원리스트불러오기 */
	@Override
	public List<Map<String, String>> selectEmpList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return session.selectList("emp.selectEmpList", rows);
	}

	@Override
	public int selectEmpCount(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("emp.selectEmpCount");
	}
	/* 사원리스트불러오기끝 */

	/* 사원등록 */
	@Override
	public int insertEmp(SqlSessionTemplate session, Map<String, String> param) {
		// TODO Auto-generated method stub
		return session.insert("emp.insertEmp", param);
	}

	/* 사원첨부파일등록 */
	@Override
	public int insertEmpFile(SqlSessionTemplate session, EmpFile e) {
		// TODO Auto-generated method stub
		return session.insert("emp.insertEmpFile", e);
	}
	/* 사원등록끝 */

	/* 사원상세보기 */
	@Override
	public Map<String, Object> selectEmpOne(SqlSessionTemplate session, int empNo) {
		return session.selectOne("emp.selectEmpOne",empNo);
	}
	
	@Override
	public List<EmpFile> selectEmpFileList(SqlSessionTemplate session, int empNo) {
		// TODO Auto-generated method stub
		return session.selectList("emp.selectEmpFileList", empNo);
	}

	/* 사원로그인*/
	@Override
	public Map<String, String> selectLoginEmp(SqlSessionTemplate session, Map<String, String> map) {
		return session.selectOne("emp.selectLoginEmp",map);
	}
	
	/* 사원검색 */
	@Override
	public List<Map<String, String>> selectEmpSearchList(SqlSessionTemplate session, Map<String, Object> param) {
		logger.debug((String)param.get("type"));
		logger.debug((String)param.get("data"));
		int cPage = (Integer)(param.get("cPage"));
		int numPerPage = (Integer)(param.get("numPerPage"));
		RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return session.selectList("emp.selectEmpSearchList", param, rows);
	}

	@Override
	public int selectEmpSearchCount(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		logger.debug((String)param.get("type"));
		logger.debug((String)param.get("data"));
		return session.selectOne("emp.selectEmpSearchCount", param);
	}

	/* 아이디중복확인 */
	@Override
	public int checkId(SqlSessionTemplate session, String empId) {
		// TODO Auto-generated method stub
		return session.selectOne("emp.checkId", empId);
	}

	/* 첨부파일삭제 */
	@Override
	public int deleteEmpFile(SqlSessionTemplate session, int efNo) {
		// TODO Auto-generated method stub
		return session.delete("emp.deleteEmpFile", efNo);
	}

	/* 사원수정 */
	@Override
	public int updateEmp(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("emp.updateEmp", param);
	}
	
	/* 비밀번호변경 */
	@Override
	public int updatePassword(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("emp.updatePassword", param);
	}

	/* 출퇴근 위치정보 확인 */
	@Override
	public int checkLocation(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("emp.checkLocation", param);
	}

	/* 출근등록 */
	@Override
	public int insertGotoWork(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("emp.insertGotoWork", param);
	}

	/* 퇴근등록 */
	@Override
	public int updateOffWork(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.update("emp.updateOffWork", param);
	}
	
	/* 근태하나보기 */
	@Override
	public Map<String, Object> selectAttenOne(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("emp.selectAttenOne", param);
	}

	/* 근태현황보기 */
	@Override
	public List<Map<String, String>> selectAttenList(SqlSessionTemplate session, Map<String, Object> param, int cPage,
			int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return session.selectList("emp.selectAttenList", param, rows);
	}

	@Override
	public int selectAttenCount(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("emp.selectAttenCount", param);
	}
	/* 근태현황보기 끝 */

	/* 휴가리스트출력 */
	@Override
	public List<Map<String, String>> selectDayOffList(SqlSessionTemplate session, Map<String, Object> param, int cPage,
			int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return session.selectList("emp.selectDayOffList", param, rows);
	}

	@Override
	public int selectDayOffCount(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectOne("emp.selectDayOffCount", param);
	}
	/* 휴가리스트출력 끝 */

	/* 출장리스트출력 */
	@Override
	public List<Map<String, String>> selectBTList(SqlSessionTemplate session, Map<String, Object> param, int cPage,
			int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return session.selectList("emp.selectBTList", param, rows);
	}

	@Override
	public int selectBTCount(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("emp.selectBTCount", param);
	}
	
	
	
	
	
	
	
	
	
	




}

