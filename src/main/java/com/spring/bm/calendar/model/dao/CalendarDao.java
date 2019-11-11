package com.spring.bm.calendar.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.bm.calendar.model.vo.Calendar;

public interface CalendarDao {

	int insertCalendar(SqlSessionTemplate sqlSession, Map<String, Object> param);

	int updateCalendar(SqlSessionTemplate sqlSession, Map<String, Object> param);

	List<Map<String, Object>> selectScheCategory(SqlSessionTemplate sqlSession);

	List<Calendar> selectCalendarEmpNo(SqlSessionTemplate sqlSession, int username);

	int selectCalendarCount(SqlSessionTemplate sqlSession, int username);

	List<Calendar> selectCalendarEmpNo(SqlSessionTemplate sqlSession, int cPage, int numPerPage, int param);

	int selectCalendarCount2(SqlSessionTemplate sqlSession, int param);

	int deleteCal(SqlSessionTemplate sqlSession, int data);

	Calendar resultCalendar(SqlSessionTemplate sqlSession, int result);

	List<Calendar> selectCalendar1(SqlSessionTemplate sqlSession, int cPage, int numPerPage, int data);
	
	List<Calendar> selectCalendar2(SqlSessionTemplate sqlSession, int cPage, int numPerPage, int data);
	
	List<Calendar> selectCalendar3(SqlSessionTemplate sqlSession, int cPage, int numPerPage, int data);

	int selectCalendar1Count(SqlSessionTemplate sqlSession, int data);

	int selectCalendar2Count(SqlSessionTemplate sqlSession, int data);
	
	int selectCalendar3Count(SqlSessionTemplate sqlSession, int data);

	Calendar selectCno(SqlSessionTemplate sqlSession, int data);

	List<Calendar> selectCalendarEmpNo2(SqlSessionTemplate sqlSession, int empNo);


}
