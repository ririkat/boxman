package com.spring.bm.department.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.department.model.dao.DepartmentDao;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	
	@Autowired
	DepartmentDao dao;
	@Autowired
	SqlSessionTemplate sqlSession;
	@Override
	
	public List<Map<String, String>> selectDeptList() {
		return dao.selectDeptList(sqlSession);
	}
	
	

}
