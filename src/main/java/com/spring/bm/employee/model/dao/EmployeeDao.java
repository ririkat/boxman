package com.spring.bm.employee.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface EmployeeDao {

	Map<String, String> selectEmpOne(SqlSessionTemplate session, int empNo);

}
