package com.spring.bm.department.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface DepartmentDao {

	List<Map<String, String>> selectDeptList(SqlSessionTemplate sqlSession);

}
