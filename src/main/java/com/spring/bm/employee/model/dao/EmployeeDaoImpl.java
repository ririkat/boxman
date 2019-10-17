package com.spring.bm.employee.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Override
	public Map<String, String> selectEmpOne(SqlSessionTemplate session, int empNo) {
		return session.selectOne("emp.selectEmpOne",empNo);
	}
	
	
	

}
