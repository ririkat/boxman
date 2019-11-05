package com.spring.bm.acct.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AccDaoImpl implements AcctDao {

	@Override
	public List<Map<String, String>> selectICList(SqlSessionTemplate session) {
		return session.selectList("acct.selectIcList");
	}

	@Override
	public List<Map<String, String>> selectEmpList(SqlSessionTemplate session) {
		return session.selectList("acct.selectEmpList");
	}

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
