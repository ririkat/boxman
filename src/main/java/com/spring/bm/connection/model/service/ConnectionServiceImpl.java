package com.spring.bm.connection.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.connection.model.dao.ConnectionDao;

@Service
public class ConnectionServiceImpl implements ConnectionService {

	@Autowired
	ConnectionDao dao;
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public int selectConnCount() {
		return dao.selectConnCount(session);
	}

	@Override
	public List<Map<String, String>> selectConnList(int cPage, int numPerPage) {
		return dao.selectConnList(session,cPage,numPerPage);
	}

	@Override
	public List<Map<String,String>> selectStfMainCateg() {
		return dao.selectStfMainCateg(session);
	}

	@Override
	public int searchDisCon(Map<String,String> param) {
		return dao.searchDisCon(session,param);
	}

	@Override
	public int searchCon(Map<String,String> param) {
		return dao.searchCon(session,param);
	}
	
}
