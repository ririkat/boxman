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
	
	int enrollConn(SqlSessionTemplate session, Map<String,String> param);
	int enrollTransferInfo(SqlSessionTemplate session, Map<String,String> param);
	
	Map<String, String> selectConnection(SqlSessionTemplate session, int conCode);
	String selectThisMainCateg(SqlSessionTemplate session, int conCode);
	Map<String, String> selectTransferInfo(SqlSessionTemplate session, int conCode);
	
	int modifyConn(SqlSessionTemplate session, Map<String, String> param);
	int modifyTransferInfo(SqlSessionTemplate session, Map<String,String> param);
	
	int deleteConn(SqlSessionTemplate session, int conCode);
	
	List<Map<String, String>> selectConnSearchList(SqlSessionTemplate session, Map<String, Object> m);
	int selectConnSearchCount(SqlSessionTemplate session, Map<String, Object> m);
}
