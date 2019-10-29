package com.spring.bm.apv.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.apv.model.dao.ApvDao;

@Service
public class ApvServiceImpl implements ApvService {
	@Autowired
	ApvDao dao;
	@Autowired
	SqlSessionTemplate session;
	
	
	@Override
	public int insertApvDoc(Map<String, Object> param) throws Exception{
		int result=0;
		result=dao.insertApvDoc(session,param);
		if(result == 0) throw new Exception();
		return result;
	}
	
	@Override
	public List<Map<String, Object>> selectDocCate() {
		return dao.selectDocCate(session);
	}
	
	@Override
	public List<Map<String, Object>> selectDocForm(int cPage, int numPerPage) {
		return dao.selectDocForm(session,cPage,numPerPage);
	}
	
	@Override
	public int selectDfCount() {
		return dao.selectDfCount(session);
	}
	
	@Override
	public Map<String, Object> selectDfModi(int dfNo) {
		return dao.selectDfModi(session,dfNo);
	}
	
	@Override
	public int updateApvDoc(Map<String, Object> param) throws Exception {
		
		int result=0;
		result=dao.updateApvDoc(session,param);
		if(result == 0) throw new Exception();
		return result;
	}
	
	@Override
	public int deleteApvDoc(int dfNo) throws Exception  {
		int result=0;
		result=dao.deleteApvDoc(session,dfNo);
		if(result == 0) throw new Exception();
		return result;
	}

}
