package com.spring.bm.calendar.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Override
	public int insertCalendar(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		return sqlSession.insert("calendar.insertCalendar", param);
	}

	@Override
	public int updateCalendar(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		return sqlSession.update("calendar.updateCalendar", param);
	}

	@Override
	public List<Map<String, Object>> selectScheCategory(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("calendar.selectScheCategory");
	}
	
	
	
	
}
