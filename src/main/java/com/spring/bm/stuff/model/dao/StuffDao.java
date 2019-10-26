package com.spring.bm.stuff.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.bm.connection.model.vo.Connection;
import com.spring.bm.stuff.model.vo.Stuff;
import com.spring.bm.stuff.model.vo.StuffMaincategory;
import com.spring.bm.stuff.model.vo.StuffSubcategory;
import com.spring.bm.stuff.model.vo.StuffUpload;


public interface StuffDao {

	List<StuffMaincategory> stuffMaincategoryList(SqlSessionTemplate sqlSession);

	List<StuffSubcategory> stuffSubcategoryList(SqlSessionTemplate sqlSession, int mcNo);

	int stuffEnrollEnd(SqlSessionTemplate sqlSession, Map<String, String> param);

	Stuff stuffSeeMore(SqlSessionTemplate sqlSession, int stuffNo);

	StuffSubcategory stuffScName(SqlSessionTemplate sqlSession, int scNo);

	int insertStuffImage(SqlSessionTemplate sqlSession, StuffUpload su);

	List<Stuff> selectStuffList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);

	int selectStuffCount(SqlSessionTemplate sqlSession);

	int stuffNameDupliCheck(SqlSessionTemplate sqlSession, String stuffName);

	List<Stuff> selectStuffSearchList(SqlSessionTemplate sqlSession, Map<String, Object> m);

	int selectStuffSearchCount(SqlSessionTemplate sqlSession, Map<String, Object> m);

	Stuff stuffOne(SqlSessionTemplate sqlSession, int stuffNo);

	StuffUpload stuffUploadOne(SqlSessionTemplate sqlSession, int stuffNo);

	StuffMaincategory selectMaincategory(SqlSessionTemplate sqlSession, int scNo);

	int updateStuff(SqlSessionTemplate sqlSession, Map<String, String> param);

	int deleteStuff(SqlSessionTemplate sqlSession, int stuffNo);

	int deleteStuffUpload(SqlSessionTemplate sqlSession, Map<String, String> param);

	List<Connection> stuffConnectionList(SqlSessionTemplate sqlSession);

	Connection connectionName(SqlSessionTemplate sqlSession, int conCode);







	

}
