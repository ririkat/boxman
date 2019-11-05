package com.spring.bm.acct.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public int updateWagePayment(int salno) {
		return dao.updateWagePayment(session, salno);
	}

	@Override
	public List<Map<String, String>> selectSevList() {
		return dao.selectSevList(session);
	}

	@Override
	@Transactional
	public int updateSeveranceStatus(Map<String, String> m) throws RuntimeException{
		int result =0;
		
		result = dao.updateSeveranceStatus(session, m);
		if(result==0) throw new RuntimeException();
		result= dao.updateEmployeeStatus(session, m);
		if(result==0) throw new RuntimeException();
		
		return result;
	}

	@Override
	public List<Map<String, String>> selectBizTripList() {
		return dao.selectBizTripList(session);
	}


}