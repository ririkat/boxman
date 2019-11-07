package com.spring.bm.calendar.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.bm.calendar.model.vo.Calendar;

public interface CalendarDao {

	int insertCalendar(SqlSessionTemplate sqlSession, Map<String, Object> param);

	int updateCalendar(SqlSessionTemplate sqlSession, Map<String, Object> param);

	List<Map<String, Object>> selectScheCategory(SqlSessionTemplate sqlSession);

	List<Calendar> selectCalendarEmpNo(SqlSessionTemplate sqlSession, int empNo);

}
