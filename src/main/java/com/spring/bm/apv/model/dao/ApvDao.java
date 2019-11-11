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

	Map<String, Object> selectEmpInfoAll(SqlSessionTemplate session, Map<String, Object> param);

	int insertRequestApv(SqlSessionTemplate session, Map<String, Object> param);

	int insertApvApplicant(SqlSessionTemplate session, Map<String, Object> param2);

	int insertApvReferer(SqlSessionTemplate session, Map<String, Object> param2);

	int insertApvEnforcer(SqlSessionTemplate session, Map<String, Object> param2);

	List<Map<String, Object>> selectSendApvList(SqlSessionTemplate session, int cPage, int numPerPage, int loginNo);

	int selectSendApvCount(SqlSessionTemplate session, int loginNo);

	List<Map<String, Object>> selectReceiveApvList(SqlSessionTemplate session, int cPage, int numPerPage, int loginNo);

	int selectReceiveApvCount(SqlSessionTemplate session, int loginNo);

	List<Map<String, Object>> selectEnforceApvList(SqlSessionTemplate session, int cPage, int numPerPage, int loginNo);

	int selectEnforceApvCount(SqlSessionTemplate session, int loginNo);

	List<Map<String, Object>> selectReferApvList(SqlSessionTemplate session, int cPage, int numPerPage, int loginNo);

	int selectReferApvCount(SqlSessionTemplate session, int loginNo);

	Map<String, Object> selectLookupApv(SqlSessionTemplate session, int apvNo);

	Map<String, Object> selectLookupApvR(SqlSessionTemplate session, Map<String, Object> param);

	int updateReferYN(SqlSessionTemplate session, Map<String, Object> param);

	Map<String, Object> selectLookupApvA(SqlSessionTemplate session, Map<String, Object> param);

	int apvPermit(SqlSessionTemplate session, Map<String, Object> param);

	int apvAReturn(SqlSessionTemplate session, Map<String, Object> param);

	int updateApvReturn(SqlSessionTemplate session, Map<String, Object> param);

	int selectApvACount(SqlSessionTemplate session, Map<String, Object> param);

	int updateApvPermitAll(SqlSessionTemplate session, Map<String, Object> param);

	int updateApvPermit(SqlSessionTemplate session, Map<String, Object> param);

	Map<String, Object> selectLookupApvEOne(SqlSessionTemplate session, Map<String, Object> param);

	int updateApvEEnforce(SqlSessionTemplate session, Map<String, Object> param);

	int updateApvEnforce(SqlSessionTemplate session, Map<String, Object> param);

	int apvEEReturn(SqlSessionTemplate session, Map<String, Object> param);

	int updateApvEReturn(SqlSessionTemplate session, Map<String, Object> param);

	int updateAddApv(SqlSessionTemplate session, Map<String, Object> param);

	List<Map<String, String>> selectDfSearchList(SqlSessionTemplate session, int cPage, int numPerPage,
			Map<String, Object> param);

	int selectDfSearchCount(SqlSessionTemplate session, Map<String, Object> param);

	List<Map<String, String>> selectApvlSearchList(SqlSessionTemplate session, int cPage, int numPerPage,
			Map<String, Object> param);

	int selectApvlSearchCount(SqlSessionTemplate session, Map<String, Object> param);

	Map<String, Object> selectStamp(SqlSessionTemplate session,Map<String, Object> param);

	int apvSaveUpdate(SqlSessionTemplate session, Map<String, Object> param);

}
