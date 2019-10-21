package com.spring.bm.category.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.bm.stuff.model.vo.StuffMaincategory;
import com.spring.bm.stuff.model.vo.StuffSubcategory;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Override
	public List<StuffMaincategory> maincategoryList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("category.maincategoryList");
	}

	@Override
	public int maincategoryEnroll(SqlSessionTemplate sqlSession, String mcName) {
		return sqlSession.insert("category.maincategoryEnroll", mcName);
	}

	@Override
	public List<StuffSubcategory> subcategoryList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("category.subcategoryList", null, rows);
	}

	@Override
	public int subcategoryEnroll(SqlSessionTemplate sqlSession, Map<String, Object> m) {
		return sqlSession.insert("category.subcategoryEnroll", m);
	}

	@Override
	public int maincategoryDelete(SqlSessionTemplate sqlSession, String mcName) {
		return sqlSession.delete("category.maincategoryDelete", mcName);
	}

	@Override
	public int subcategoryDelete(SqlSessionTemplate sqlSession, String scName) {
		return sqlSession.delete("category.subcategoryDelete", scName);
	}

	@Override
	public List<StuffMaincategory> selectMaincategoryList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("category.selectMaincategoryList", null, rows);
	}

	@Override
	public int selectMaincategoryCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("category.selectMaincategoryCount");
	}

	@Override
	public int selectSubcategoryCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("category.selectSubcategoryCount");
	}

}
