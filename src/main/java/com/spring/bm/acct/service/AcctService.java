package com.spring.bm.acct.service;


import java.util.List;
import java.util.Map;

public interface AcctService {

	List<Map<String, String>> selectICList();

	List<Map<String, String>> selectEmpList(int cPage, int numPerPage);

	int updateWagePayment(int salno);

	List<Map<String, String>> selectSevList();

	int updateSeveranceStatus(Map<String, String> m);

	List<Map<String, String>> selectBizTripList();

	int selectEmpCount();

}