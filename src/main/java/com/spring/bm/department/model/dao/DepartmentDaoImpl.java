package com.spring.bm.department.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DepartmentDaoImpl implements DepartmentDao {

	@Override
	public List<Map<String, String>> selectDeptList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("dept.selectDeptList");
	}
	
	

}
