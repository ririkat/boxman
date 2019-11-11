package com.spring.bm.purchase.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface PurchaseDao {
	
	List<Map<String, String>> selectPurList(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectPurCount(SqlSessionTemplate session);
	
	List<Map<String, String>> selectConnList(SqlSessionTemplate session);

	Map<String, String> addStuffToTemp(SqlSessionTemplate session, String stuffNo);
	
	int enrollPurInfo(SqlSessionTemplate session, Map<String, Object> param);
	int enrollPurItem(SqlSessionTemplate session, Map<String,Object> paramMap);
	
	List<Map<String, String>> selectPurSearchList(SqlSessionTemplate session, Map<String, Object> m);
	int selectPurSearchCount(SqlSessionTemplate session, Map<String, Object> m);
	
	Map<String, String> selectPurInfo(SqlSessionTemplate session, int purCode);
	List<Map<String, String>> selectPurItemList(SqlSessionTemplate session, int purCode);
	Map<String, Object> selectPurOne(SqlSessionTemplate session, Map<String, Object> param);
	
}
