package com.spring.bm.employee.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.employee.model.dao.EmployeeDao;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	EmployeeDao dao;
	@Autowired
	SqlSessionTemplate session;

	@Override
	public Map<String, String> selectEmpOne(int empNo) {
		return dao.selectEmpOne(session, empNo);
	}
	
	

}
