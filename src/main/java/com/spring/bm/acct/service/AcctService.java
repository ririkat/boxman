package com.spring.bm.acct.service;


import java.util.List;
import java.util.Map;

public interface AcctService {

	List<Map<String, String>> selectICList();

	List<Map<String, String>> selectEmpList();

	int updateWagePayment(int salno);

	
	

}
