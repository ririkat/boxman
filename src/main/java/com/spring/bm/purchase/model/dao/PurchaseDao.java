package com.spring.bm.purchase.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface PurchaseDao {
	
	List<Map<String, String>> selectPurList(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectPurCount(SqlSessionTemplate session);
	
	List<Map<String, String>> selectConnList(SqlSessionTemplate session);

}
