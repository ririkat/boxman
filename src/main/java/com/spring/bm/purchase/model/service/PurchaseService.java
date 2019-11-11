package com.spring.bm.purchase.model.service;

import java.util.List;
import java.util.Map;

public interface PurchaseService {
	
	List<Map<String,String>> selectPurList(int cPage, int numPerPage);
	int selectPurCount();
	
	List<Map<String,String>> selectConnList();
	
	Map<String,String> addStuffToTemp(String stuffNo);
	
	int enrollPurInfo(Map<String, Object> param) throws Exception;
	
	List<Map<String,String>> selectPurSearchList(Map<String, Object> m);
	int selectPurSearchCount(Map<String, Object> m);
	
	Map<String,String> selectPurInfo(int purCode);
	List<Map<String,String>> selectPurItemList(int purCode);
	Map<String, Object> selectPurOne(Map<String, Object> param);

}
