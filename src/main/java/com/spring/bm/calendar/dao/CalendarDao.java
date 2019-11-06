package com.spring.bm.calendar.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface CalendarDao {

	int insertCalendar(SqlSessionTemplate sqlSession, Map<String, Object> param);

	int updateCalendar(SqlSessionTemplate sqlSession, Map<String, Object> param);

	List<Map<String, Object>> selectScheCategory(SqlSessionTemplate sqlSession);

}
