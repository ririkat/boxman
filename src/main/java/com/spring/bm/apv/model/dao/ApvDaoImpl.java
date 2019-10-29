package com.spring.bm.apv.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ApvDaoImpl implements ApvDao {
	
	@Override
	public int insertApvDoc(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("apv.insertApvDoc", param);
	}
	
	@Override
	public List<Map<String, Object>> selectDocCate(SqlSessionTemplate session) {
		return session.selectList("apv.selectDocCate");
	}
	
	@Override
	public List<Map<String, Object>> selectDocForm(SqlSessionTemplate session,int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return session.selectList("apv.selectDocForm", null, rows);
	}
	
	@Override
	public int selectDfCount(SqlSessionTemplate session) {
		return session.selectOne("apv.selectDfCount");
	}
	
	@Override
	public Map<String, Object> selectDfModi(SqlSessionTemplate session, int dfNo) {
		return session.selectOne("apv.selectDfModi",dfNo);
	}
	
	@Override
	public int updateApvDoc(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("apv.updateApvDoc",param);
	}
	
	@Override
	public int deleteApvDoc(SqlSessionTemplate session, int dfNo) {
		return session.delete("apv.deleteApvDoc",dfNo);
	}

}
