package com.spring.bm.connection.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ConnectionDaoImpl implements ConnectionDao {

	@Override
	public int selectConnCount(SqlSessionTemplate session) {
		return session.selectOne("connection.selectConnCount");
	}

	@Override
	public List<Map<String, String>> selectConnList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("connection.selectConnList",null,rows);
	}

	@Override
	public List<Map<String,String>> selectStfMainCateg(SqlSessionTemplate session) {
		return session.selectList("connection.selectStfMainCateg");
	}

	@Override
	public int searchDisCon(SqlSessionTemplate session, Map<String,String> param) {
		return session.selectOne("connection.searchDisCon",param);
	}

	@Override
	public int searchCon(SqlSessionTemplate session, Map<String,String> param) {
		return session.selectOne("connection.searchCon",param);
	}

}
