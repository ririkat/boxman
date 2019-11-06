package com.spring.bm.acct.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface AcctDao {

	List<Map<String, String>> selectICList(SqlSessionTemplate session);

	// 월급 리스트 가져오기
	List<Map<String, String>> selectEmpList(int cPage, int numPerPage, SqlSessionTemplate session);
	int selectEmpCount(SqlSessionTemplate session);
	
	int updateWagePayment(SqlSessionTemplate session, int salno);

	List<Map<String, String>> selectSevList(SqlSessionTemplate session);

	int updateSeveranceStatus(SqlSessionTemplate session, Map<String, String> m);

	int updateEmployeeStatus(SqlSessionTemplate session, Map<String, String> m);

	List<Map<String, String>> selectBizTripList(SqlSessionTemplate session);



}