
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
	public Map<String, String> selectEmpOne(SqlSessionTemplate sqlSession, int empNo) {
		return sqlSession.selectOne("emp.selectEmpOne",empNo);
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


}

