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


}
