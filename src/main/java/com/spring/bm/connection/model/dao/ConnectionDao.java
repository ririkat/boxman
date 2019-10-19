package com.spring.bm.connection.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface ConnectionDao {

	public int selectConnCount(SqlSessionTemplate session);
	List<Map<String, String>> selectConnList(SqlSessionTemplate session, int cPage, int numPerPage);

	List<Map<String,String>> selectStfMainCateg(SqlSessionTemplate session);
	
	int searchDisCon(SqlSessionTemplate session, Map<String,String> param);
	int searchCon(SqlSessionTemplate session, Map<String,String> param);	
	
}
