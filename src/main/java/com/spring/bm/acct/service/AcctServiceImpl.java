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
	public int updateWagePayment(int salno) {
		return dao.updateWagePayment(session, salno);
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

	/* biztrip */
	@Override
	public List<Map<String, String>> selectBizTripList(int cPage, int numPerPage) {
		return dao.selectBizTripList(cPage, numPerPage, session);
	}
	@Override
	public int selectBizTripCount() {
		return dao.selecBizTripCount(session);
	}
	/* biztrip end */
	
	
	
	/* salary */
	@Override
	public List<Map<String, String>> selectEmpList(int cPage, int numPerPage) {
		return dao.selectEmpList(cPage, numPerPage, session);
	}

	@Override
	public int selectEmpCount() {
		return dao.selectEmpCount(session);
	}

	
	
	
	
	/* severance */
	@Override
	public List<Map<String, String>> selectSevList(int cPage, int numPerPage) {
		return dao.selectSevList(session, cPage, numPerPage);
	}
	@Override
	public int selectSevCount() {
		return dao.selectSevCount(session);
	}

	
	
	
	
	/* salary search */
	@Override
	public List<Map<String, String>> selectsSalarySearchList(int cPage, int numPerPage, Map<String, Object> param) {
		return dao.selectsSalarySearchList(session,cPage, numPerPage, param);
	}
	@Override
	public int salarySearchCount(Map<String, Object> param) {
		return dao.salarySearchCount(session, param);
	}

	
	
	/* biztrip search */
	@Override
	public List<Map<String, String>> selectBiztripSearchList(int cPage, int numPerPage, Map<String, Object> param) {
		return dao.selectBiztripSearchList(session, cPage, numPerPage, param);
	}
	@Override
	public int biztripSearchCount(Map<String, Object> param) {
		return dao.biztripSearchCount(session, param);
	}

	
	
	/* severance search */
	@Override
	public List<Map<String, String>> selectSevSearchList(int cPage, int numPerPage, Map<String, Object> param) {
		return dao.selectSevSearchList(session, cPage, numPerPage, param);
	}
	@Override
	public int sevSearchCount(Map<String, Object> param) {
		return dao.sevSearchCount(session, param);
	}

	/* 퇴직금한개보기 */
	@Override
	public Map<String, String> selectSevOne(String empno) {
		// TODO Auto-generated method stub
		return dao.selectSevOne(session, empno);
	}

	
	
	
	
	
	
	

}