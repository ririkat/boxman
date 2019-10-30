package com.spring.bm.acct.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AccDaoImpl implements AcctDao {

	@Override
	public List<Map<String, String>> selectICList(SqlSessionTemplate session) {
		return session.selectList("acct.selectIc");
	}

	@Override
	public List<Map<String, String>> selectEmpList(SqlSessionTemplate session) {
		return session.selectList("acct.selectEmpList");
	}

	@Override
	public int updateWagePayment(SqlSessionTemplate session, int salno) {
		return session.update("acct.updateWagePayment", salno);
	}

}
