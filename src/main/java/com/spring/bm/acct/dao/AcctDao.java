package com.spring.bm.acct.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface AcctDao {

	List<Map<String, String>> selectICList(SqlSessionTemplate session);

	List<Map<String, String>> selectEmpList(SqlSessionTemplate session);

	int updateWagePayment(SqlSessionTemplate session, int salno);


}
