package com.spring.bm.stuff.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
		return sqlSession.selectOne("stuff.selectBoardCount");
	}

	@Override
	public int stuffNameDupliCheck(SqlSessionTemplate sqlSession, String stuffName) {
		return sqlSession.selectOne("stuff.stuffNameDupliCheck", stuffName);
	}

	@Override
	public List<Stuff> selectStuffSearchList(SqlSessionTemplate sqlSession, Map<String, Object> m) {
		
		int cPage = (int) m.get("cPage");
		int numPerPage = (int) m.get("numPerPage");
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		String type = (String) m.get("type");
		String stuffId = "";
		
		
		if(type.equals("stuffName")) {
			
			stuffId = "stuff.selectStuffSearchList1";
			
		}else if(type.equals("subcategoryName")) {
			
			stuffId = "stuff.selectStuffSearchList2";
			
		}else if(type.equals("manufacturer")) {
			
			stuffId = "stuff.selectStuffSearchList2";
			
		}
		
		return sqlSession.selectList(stuffId, m, rows);
	}

	@Override
	public int selectStuffSearchCount(SqlSessionTemplate sqlSession, Map<String, Object> m) {
		
		String type = (String) m.get("type");
		String stuffId = "";
		
		if(type.equals("stuffName")) {
			
			stuffId = "stuff.selectStuffSearchCount1";
			
		}else if(type.equals("subcategoryName")) {
			
			stuffId = "stuff.selectStuffSearchCount2";
			
		}else if(type.equals("manufacturer")) {
			
			stuffId = "stuff.selectStuffSearchCount3";
			
		}
		
		return sqlSession.selectOne(stuffId, m);
	}







}
