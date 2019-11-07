package com.spring.bm.acct.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AccDaoImpl implements AcctDao {

	@Override
	public List<Map<String, String>> selectICList(SqlSessionTemplate session) {
		return session.selectList("acct.selectIcList");
	}

	/* 월급 관련 리스트 가져오기 */
	@Override
	public List<Map<String, String>> selectEmpList(int cPage, int numPerPage, SqlSessionTemplate session) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("acct.selectEmpList",null, rows);
	}
	@Override
	public int selectEmpCount(SqlSessionTemplate session) {
		return session.selectOne("acct.selectEmpCount");
	}
	
	
	@Override
	public int updateWagePayment(SqlSessionTemplate session, int salno) {
		return session.update("acct.updateWagePayment", salno);
	}

	@Override
	public int updateSeveranceStatus(SqlSessionTemplate session, Map<String, String> m) {
		return session.update("acct.updateSeveranceStatus", m);
	}

	@Override
	public int updateEmployeeStatus(SqlSessionTemplate session, Map<String, String> m) {
		return session.update("acct.updateEmployeeStatus", m);
	}

	/* biztrip */
	@Override
	public List<Map<String, String>> selectBizTripList(int cPage, int numPerPage, SqlSessionTemplate session) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("acct.selectBizTripList", null, rows);
	}
	@Override
	public int selecBizTripCount(SqlSessionTemplate session) {
		return session.selectOne("acct.selectBizTripCount");
	}
	/* biztrip end */

	
	
	/* severance */
	@Override
	public List<Map<String, String>> selectSevList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("acct.selectSevList", null, rows);
	}
	@Override
	public int selectSevCount(SqlSessionTemplate session) {
		return session.selectOne("acct.selectSevCount");
	}
	
	
	
	/* salary search */
	@Override
	public List<Map<String, String>> selectsSalarySearchList(SqlSessionTemplate session, int cPage, int numPerPage,
			Map<String, Object> param) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("acct.selectsSalarySearchList", param, rows);
	}
	@Override
	public int salarySearchCount(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectOne("acct.salarySearchCount", param);
	}

	
	
	
	/* biztrip search */
	@Override
	public List<Map<String, String>> selectBiztripSearchList(SqlSessionTemplate session, int cPage, int numPerPage, Map<String, Object> param) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("acct.selectBiztripSearchList", param, rows);
	}
	@Override
	public int biztripSearchCount(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectOne("acct.biztripSearchCount", param);
	}

	
	
	
	/* severance search */
	@Override
	public List<Map<String, String>> selectSevSearchList(SqlSessionTemplate session, int cPage, int numPerPage, Map<String, Object> param) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("acct.selectSevSearchList", param, rows);
	}
	@Override
	public int sevSearchCount(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectOne("acct.sevSearchCount", param);
	}
	
	
	
}
