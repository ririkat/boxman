package com.spring.bm.apv.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface ApvDao {

	int insertApvDoc(SqlSessionTemplate session, Map<String, Object> param);

	List<Map<String, Object>> selectDocCate(SqlSessionTemplate session);

	List<Map<String, Object>> selectDocForm(SqlSessionTemplate session, int cPage, int numPerPage);

	int selectDfCount(SqlSessionTemplate session);

	Map<String, Object> selectDfModi(SqlSessionTemplate session, int dfNo);

	int updateApvDoc(SqlSessionTemplate session, Map<String, Object> param);

	int deleteApvDoc(SqlSessionTemplate session, int dfNo);

}
