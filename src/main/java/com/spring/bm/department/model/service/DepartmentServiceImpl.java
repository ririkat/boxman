package com.spring.bm.department.model.service;

import java.util.List; 
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

import com.spring.bm.department.model.dao.DepartmentDao;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	
	@Autowired
	DepartmentDao dao;
	@Autowired
	SqlSessionTemplate session;
	
	/* 부서등록 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertDept(Map<String, String> param) throws Exception{
		int result = dao.insertDept(session, param);
		if(result == 0) throw new Exception();
		return result;
	}
	
	/* 부서리스트출력 */
	@Override
	public List<Map<String, String>> selectDeptList() {
		// TODO Auto-generated method stub
		return dao.selectDeptList(session);
	}
	
	/* 부서수정 */
	@Override
	public int updateDept(Map<String, Object> map) throws Exception{
		int result = dao.updateDept(session, map);
		if(result < 0) throw new Exception();
		return result;
	}

	/* 부서상세 */
	@Override
	public Map<String, Object> selectDeptOne(int deptNo) {
		// TODO Auto-generated method stub
		return dao.selectDeptOne(session, deptNo);
	}
	
	
	
	

}
