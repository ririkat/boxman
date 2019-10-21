package com.spring.bm.category.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.category.model.dao.CategoryDao;
import com.spring.bm.stuff.model.vo.StuffMaincategory;
import com.spring.bm.stuff.model.vo.StuffSubcategory;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<StuffMaincategory> maincategoryList() {
		return dao.maincategoryList(sqlSession);
	}

	@Override
	public int maincategoryEnroll(String mcName) {
		return dao.maincategoryEnroll(sqlSession, mcName);
	}

	@Override
	public List<StuffSubcategory> subcategoryList(int cPage, int numPerPage) {
		return dao.subcategoryList(sqlSession, cPage, numPerPage);
	}

	@Override
	public int subcategoryEnroll(Map<String, Object> m) {
		return dao.subcategoryEnroll(sqlSession, m);
	}

	@Override
	public int maincategoryDelete(String mcName) {
		return dao.maincategoryDelete(sqlSession, mcName);
	}

	@Override
	public int subcategoryDelete(String scName) {
		return dao.subcategoryDelete(sqlSession, scName);
	}

	@Override
	public List<StuffMaincategory> selectMaincategoryList(int cPage, int numPerPage) {
		return dao.selectMaincategoryList(sqlSession, cPage, numPerPage);
	}

	@Override
	public int selectMaincategoryCount() {
		return dao.selectMaincategoryCount(sqlSession);
	}

	@Override
	public int selectSubcategoryCount() {
		return dao.selectSubcategoryCount(sqlSession);
	}
	
	

}
