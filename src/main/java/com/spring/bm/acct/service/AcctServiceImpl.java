package com.spring.bm.acct.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.acct.dao.AcctDao;

@Service
public class AcctServiceImpl implements AcctService {

	@Autowired
	AcctDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> selectICList() {
		return dao.selectICList(session);
	}

	@Override
	public List<Map<String, String>> selectEmpList() {
		return dao.selectEmpList(session);
	}


}
