package com.spring.bm.category.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.bm.stuff.model.vo.StuffMaincategory;
import com.spring.bm.stuff.model.vo.StuffSubcategory;

public interface CategoryDao {

	List<StuffMaincategory> maincategoryList(SqlSessionTemplate sqlSession);

	int maincategoryEnroll(SqlSessionTemplate sqlSession, String mcName);

	List<StuffSubcategory> subcategoryList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);

	int subcategoryEnroll(SqlSessionTemplate sqlSession, Map<String, Object> m);

	int maincategoryDelete(SqlSessionTemplate sqlSession, String mcName);

	int subcategoryDelete(SqlSessionTemplate sqlSession, String scName);

	List<StuffMaincategory> selectMaincategoryList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);

	int selectMaincategoryCount(SqlSessionTemplate sqlSession);

	int selectSubcategoryCount(SqlSessionTemplate sqlSession);

	int maincategoryNameDupliCheck(SqlSessionTemplate sqlSession, String mcName);

	int subcategoryNameDupliCheck(SqlSessionTemplate sqlSession, String scName);

}
