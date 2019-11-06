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

	// 월급 관련 리스트 가져오기
	@Override
	public List<Map<String, String>> selectEmpList(int cPage, int numPerPage, SqlSessionTemplate session) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("acct.selectEmpList",null, rows);
	}
	@Override
	public int selectEmpCount(SqlSessionTemplate session) {
		return session.selectOne("acct.selectEmpCount");
	}
	// 월급 관렬 리스트 가져오기 끝
	
	@Override
	public int updateWagePayment(SqlSessionTemplate session, int salno) {
		return session.update("acct.updateWagePayment", salno);
	}

	@Override
	public List<Map<String, String>> selectSevList(SqlSessionTemplate session) {
		return session.selectList("acct.selectSevList");
	}

	@Override
	public int updateSeveranceStatus(SqlSessionTemplate session, Map<String, String> m) {
		return session.update("acct.updateSeveranceStatus", m);
	}

	@Override
	public int updateEmployeeStatus(SqlSessionTemplate session, Map<String, String> m) {
		return session.update("acct.updateEmployeeStatus", m);
	}

	@Override
	public List<Map<String, String>> selectBizTripList(SqlSessionTemplate session) {
		return session.selectList("acct.selectBizTripList");
	}



	

}
