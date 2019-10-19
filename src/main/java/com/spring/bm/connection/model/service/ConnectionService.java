package com.spring.bm.connection.model.service;

import java.util.List;
import java.util.Map;

public interface ConnectionService {
	
	int selectConnCount();
	List<Map<String,String>> selectConnList(int cPage, int numPerPage);
	
	List<Map<String,String>> selectStfMainCateg();
	
	int searchDisCon(Map<String,String> param);
	int searchCon(Map<String,String> param);

}
