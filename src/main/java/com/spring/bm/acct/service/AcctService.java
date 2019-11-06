package com.spring.bm.acct.service;


import java.util.List;
import java.util.Map;

public interface AcctService {

	List<Map<String, String>> selectICList();
	
	/* salary */
	List<Map<String, String>> selectEmpList(int cPage, int numPerPage);
	int selectEmpCount();


	int updateSeveranceStatus(Map<String, String> m);

	/* biztrip */
	List<Map<String, String>> selectBizTripList(int cPage, int numPerPage);
	int selectBizTripCount();

	/* severance */
	List<Map<String, String>> selectSevList(int cPage, int numPerPage);
	
	int updateWagePayment(int salno);

	int selectSevCount();

}