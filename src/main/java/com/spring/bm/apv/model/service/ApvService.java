package com.spring.bm.apv.model.service;

import java.util.List;
import java.util.Map;

import com.spring.bm.apv.model.dao.ApvDao;


public interface ApvService {
	/*결재양식*/
	int insertApvDoc(Map<String, Object> param) throws Exception;
	
	List<Map<String, Object>> selectDocCate();

	List<Map<String, Object>> selectDocForm(int cPage, int numPerPage);

	int selectDfCount();

	Map<String, Object> selectDfModi(int dfNo);

	int updateApvDoc(Map<String, Object> param) throws Exception;

	int deleteApvDoc(int dfNo) throws Exception;

	int insertApvDocHead(Map<String, Object> param) throws Exception;

	int insertApvDocContent(Map<String, Object> param) throws Exception;

	List<Map<String, Object>> selectDocHCate();

	List<Map<String, Object>> selectDocCCate();

	String selectDfhContent(int no);

	String selectDfcContent(int no);
	
	/*결재라인*/
	List<Map<String, Object>> selectDeptList();

	List<Map<String, Object>> selectMyApvLineList(int cPage, int numPerPage, int loginNo);

	int selectMyALCount(int loginNo);

	List<Map<String, Object>> selectDeptToEmp(int deptNo);

	int insertApvLine(Map<String, Object> param) throws Exception;

	int deleteApvLine(int alNo) throws Exception;

	Map<String, Object> selectALModi(int alno);

	List selectALApplicants(int alno);

	int updateApvLine(Map<String, Object> param) throws Exception;

	Map<String, Object> selectEmpInfoAll(Map<String, Object> loginEmp);

	int insertRequestApv(Map<String, Object> param) throws Exception;

	List<Map<String, Object>> selectSendApvList(int cPage, int numPerPage, int loginNo);

	int selectSendApvCount(int loginNo);

	List<Map<String, Object>> selectReceiveApvList(int cPage, int numPerPage, int loginNo);

	int selectReceiveApvCount(int loginNo);

	List<Map<String, Object>> selectEnforceApvList(int cPage, int numPerPage, int loginNo);

	int selectEnforceApvCount(int loginNo);

	List<Map<String, Object>> selectReferApvList(int cPage, int numPerPage, int loginNo);

	int selectReferApvCount(int loginNo);

	Map<String, Object> selectLookupApv(int apvNo);

	Map<String, Object> selectLookupApvR(Map<String, Object> param);

	int updateReferYN(Map<String, Object> param) throws Exception;

	Map<String, Object> selectLookupApvA(Map<String, Object> param);



}
