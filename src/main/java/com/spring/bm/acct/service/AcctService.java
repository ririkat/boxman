package com.spring.bm.acct.service;


import java.util.List;
import java.util.Map;

public interface AcctService {

	List<Map<String, String>> selectICList();
	
	/* salary */
	List<Map<String, String>> selectEmpList(int cPage, int numPerPage);
	int selectEmpCount();
	
	/* salary payment */
	int updateWagePayment(int salno);

	int updateSeveranceStatus(Map<String, String> m);

	/* biztrip */
	List<Map<String, String>> selectBizTripList(int cPage, int numPerPage);
	int selectBizTripCount();

	/* severance */
	List<Map<String, String>> selectSevList(int cPage, int numPerPage);
	int selectSevCount();
	
	/* salary search */
	List<Map<String, String>> selectsSalarySearchList(int cPage, int numPerPage, Map<String, Object> param);
	int salarySearchCount(Map<String, Object> param);

	/* biztrip search */
	List<Map<String, String>> selectBiztripSearchList(int cPage, int numPerPage, Map<String, Object> param);
	int biztripSearchCount(Map<String, Object> param);

	/* severance search */
	List<Map<String, String>> selectSevSearchList(int cPage, int numPerPage, Map<String, Object> param);
	int sevSearchCount(Map<String, Object> param);

	/* 퇴직금한개보기 */
	Map<String, String> selectSevOne(String empno);

	/* biztrip payment */
	int updateBizTripPayment(int data);

	/* severance payment */
	int updateSevPayment(int empno);
	
	

}