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

	@Override
	public int enrollConn(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("connection.enrollConn",param);
	}

	@Override
	public int enrollTransferInfo(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("connection.enrollTransferInfo",param);
	}

	@Override
	public Map<String, String> selectConnection(SqlSessionTemplate session, int conCode) {
		return session.selectOne("connection.selectConnection", conCode);
	}

	@Override
	public String selectThisMainCateg(SqlSessionTemplate session, int conCode) {
		return session.selectOne("connection.selectThisMainCateg", conCode);
	}

	@Override
	public Map<String, String> selectTransferInfo(SqlSessionTemplate session, int conCode) {
		return session.selectOne("connection.selectTransferInfo", conCode);
	}

	@Override
	public int modifyConn(SqlSessionTemplate session, Map<String, String> param) {
		return session.update("connection.modifyConn",param);
	}

	@Override
	public int modifyTransferInfo(SqlSessionTemplate session, Map<String, String> param) {
		return session.update("connection.modifyTransferInfo",param);
	}

	@Override
	public int deleteConn(SqlSessionTemplate session, int conCode) {
		return session.delete("connection.deleteConn", conCode);
	}

	@Override
	public List<Map<String, String>> selectConnSearchList(SqlSessionTemplate session, Map<String, Object> m) {
		int cPage = (Integer)m.get("cPage");
		int numPerPage = (Integer)m.get("numPerPage");
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("connection.selectConnSearchList",m,rows);
	}

	@Override
	public int selectConnSearchCount(SqlSessionTemplate session, Map<String, Object> m) {
		return session.selectOne("connection.selectConnSearchCount",m);
	}

}