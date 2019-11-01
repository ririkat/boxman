package com.spring.bm.purchase.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.purchase.model.dao.PurchaseDao;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	PurchaseDao dao;
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Map<String, String>> selectPurList(int cPage, int numPerPage) {
		return dao.selectPurList(session, cPage, numPerPage);
	}

	@Override
	public int selectPurCount() {
		return dao.selectPurCount(session);
	}

	@Override
	public List<Map<String, String>> selectConnList() {
		return dao.selectConnList(session);
	}

}
