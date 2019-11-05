package com.spring.bm.sale.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface SaleDao {
	
	List<Map<String, String>> selectSaleList(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectSaleCount(SqlSessionTemplate session);
	
	List<Map<String, String>> selectConnList(SqlSessionTemplate session);
	
	////////////////////////////////////////////////////////////////////////////

	Map<String, String> addStuffToTemp(SqlSessionTemplate session, String stuffNo);
	
	int enrollSaleInfo(SqlSessionTemplate session, Map<String, String> param);
	int enrollSaleItem(SqlSessionTemplate session, Map<String,Object> paramMap);
	
	List<Map<String, String>> selectSaleSearchList(SqlSessionTemplate session, Map<String, Object> m);
	int selectSaleSearchCount(SqlSessionTemplate session, Map<String, Object> m);
	
	Map<String, String> selectSaleInfo(SqlSessionTemplate session, int salCode);
	List<Map<String, String>> selectSaleItemList(SqlSessionTemplate session, int salCode);

}
