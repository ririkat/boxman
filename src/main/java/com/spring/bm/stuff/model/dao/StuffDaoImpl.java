package com.spring.bm.stuff.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.bm.connection.model.vo.Connection;
import com.spring.bm.stuff.model.vo.Stuff;
import com.spring.bm.stuff.model.vo.StuffMaincategory;
import com.spring.bm.stuff.model.vo.StuffSubcategory;
import com.spring.bm.stuff.model.vo.StuffUpload;


@Repository
public class StuffDaoImpl implements StuffDao {

	@Override
	public List<StuffMaincategory> stuffMaincategoryList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("stuff.maincategoryList");
	}

	@Override
	public List<StuffSubcategory> stuffSubcategoryList(SqlSessionTemplate sqlSession, int mcNo) {
		return sqlSession.selectList("stuff.subcategoryList",mcNo);
	}

	@Override
	public int stuffEnrollEnd(SqlSessionTemplate sqlSession, Map<String, String> param) {
		return sqlSession.insert("stuff.stuffEnroll", param);
	}

	@Override
	public Stuff stuffSeeMore(SqlSessionTemplate sqlSession, int stuffNo) {
		return sqlSession.selectOne("stuff.stuffSeeMore", stuffNo);
	}

	@Override
	public StuffSubcategory stuffScName(SqlSessionTemplate sqlSession, int scNo) {
		return sqlSession.selectOne("stuff.stuffScName", scNo);
	}

	@Override
	public int insertStuffImage(SqlSessionTemplate sqlSession, StuffUpload su) {
		return sqlSession.insert("stuff.insertStuffImge", su);
	}

	@Override
	public List<Stuff> selectStuffList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("stuff.selectStuffList",null,rows);
	}

	@Override
	public int selectStuffCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("stuff.selectStuffCount");
	}

	@Override
	public int stuffNameDupliCheck(SqlSessionTemplate sqlSession, String stuffName) {
		return sqlSession.selectOne("stuff.stuffNameDupliCheck", stuffName);
	}

	@Override
	public List<Stuff> selectStuffSearchList(SqlSessionTemplate sqlSession, Map<String, Object> m) {
		
		int cPage = (Integer) m.get("cPage");
		int numPerPage = (Integer) m.get("numPerPage");
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
			
		return sqlSession.selectList("stuff.selectStuffSearchList", m, rows);
	}

	@Override
	public int selectStuffSearchCount(SqlSessionTemplate sqlSession, Map<String, Object> m) {
		
		return sqlSession.selectOne("stuff.selectStuffSearchCount", m);
		
	}

	@Override
	public Stuff stuffOne(SqlSessionTemplate sqlSession, int stuffNo) {
		
		return sqlSession.selectOne("stuff.stuffOne", stuffNo);
		
	}

	@Override
	public StuffUpload stuffUploadOne(SqlSessionTemplate sqlSession, int stuffNo) {

		return sqlSession.selectOne("stuff.stuffUploadOne", stuffNo);
		
	}

	@Override
	public StuffMaincategory selectMaincategory(SqlSessionTemplate sqlSession, int scNo) {
		return sqlSession.selectOne("category.selectMaincategory", scNo);
	}

	@Override
	public int updateStuff(SqlSessionTemplate sqlSession, Map<String, String> param) {
		return sqlSession.update("stuff.updateStuff",param);
	}

	@Override
	public int deleteStuff(SqlSessionTemplate sqlSession, int stuffNo) {
		return sqlSession.delete("stuff.deleteStuff", stuffNo);
	}

	@Override
	public int deleteStuffUpload(SqlSessionTemplate sqlSession, Map<String, String> param) {
		return sqlSession.delete("stuff.deleteStuffUpload",param);
	}

	@Override
	public List<Connection> stuffConnectionList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("stuff.selectConnectionList");
	}

	@Override
	public Connection connectionName(SqlSessionTemplate sqlSession, int conCode) {
		return sqlSession.selectOne("stuff.connectionName", conCode);
	}









}
