package com.spring.bm.sale.model.service;

import java.util.List;
import java.util.Map;

public interface SaleService {
	
	List<Map<String,String>> selectSaleList(int cPage, int numPerPage);
	int selectSaleCount();
	
	List<Map<String,String>> selectConnList();
	
	///////////////////////////////////////////////////////////////////////

	Map<String,String> addStuffToTemp(String stuffNo);
	
	int enrollSaleInfo(Map<String,String> param) throws Exception;
	
	List<Map<String,String>> selectSaleSearchList(Map<String, Object> m);
	int selectSaleSearchCount(Map<String, Object> m);
	
	Map<String,String> selectSaleInfo(int salCode);
	List<Map<String,String>> selectSaleItemList(int salCode);


}
