package com.spring.bm.apv.model.service;

import java.util.List;
import java.util.Map;

import com.spring.bm.apv.model.dao.ApvDao;


public interface ApvService {

	int insertApvDoc(Map<String, Object> param) throws Exception;

	List<Map<String, Object>> selectDocCate();

	List<Map<String, Object>> selectDocForm(int cPage, int numPerPage);

	int selectDfCount();

	Map<String, Object> selectDfModi(int dfNo);

	int updateApvDoc(Map<String, Object> param) throws Exception;

	int deleteApvDoc(int dfNo) throws Exception;

}
