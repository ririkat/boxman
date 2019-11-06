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

	int insertApvDocHead(SqlSessionTemplate session, Map<String, Object> param);

	int insertApvDocContent(SqlSessionTemplate session, Map<String, Object> param);

	List<Map<String, Object>> selectDocCCate(SqlSessionTemplate session);

	List<Map<String, Object>> selectDocHCate(SqlSessionTemplate session);

	String selectDfhContent(SqlSessionTemplate session, int no);

	String selectDfcContent(SqlSessionTemplate session, int no);

	List<Map<String, Object>> selectDeptList(SqlSessionTemplate session);

	List<Map<String, Object>> selectMyApvLineList(SqlSessionTemplate session, int cPage, int numPerPage, int loginNo);

	int selectMyALCount(SqlSessionTemplate session, int loginNo);

	List<Map<String, Object>> selectDeptToEmp(SqlSessionTemplate session, int deptNo);

	int insertApvLine(SqlSessionTemplate session, Map<String, Object> param);

	int insertApvlApplicant(SqlSessionTemplate session, Map<String, Object> param2);

	int deleteApvLine(SqlSessionTemplate session, int alNo);

	int deleteApvlApplicant(SqlSessionTemplate session, int alNo);

	Map<String, Object> selectALModi(SqlSessionTemplate session, int alno);

	List selectALApplicants(SqlSessionTemplate session, int alno);

	int updateApvLine(SqlSessionTemplate session, Map<String, Object> param);

	int deleteApvlApplicants(SqlSessionTemplate session, Map<String, Object> param);

}
