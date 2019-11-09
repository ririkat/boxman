package com.spring.bm.calendar.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.calendar.model.dao.CalendarDao;
import com.spring.bm.calendar.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	CalendarDao dao;
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Calendar insertCalender(Map<String, Object> param) {
		int result = 0;
		Calendar c = null;
		result = dao.insertCalendar(sqlSession, param);
		
		if(result > 0) {
			c = new Calendar();
			c.set_id(Integer.parseInt((String) param.get("scheNo")));
			result = c.get_id();
			c = dao.resultCalendar(sqlSession, result);
			
		}
		return c;
	}

	@Override
	public int updateCalendar(Map<String, Object> param) {
		return dao.updateCalendar(sqlSession, param);
	}

	@Override
	public List<Map<String, Object>> selectScheCategory() {
		return dao.selectScheCategory(sqlSession);
	}

	@Override
	public List<Calendar> selectCalendarEmpNo(int username) {
		return dao.selectCalendarEmpNo(sqlSession, username);
	}

	@Override
	public int selectCalendarCount(int username) {
		return dao.selectCalendarCount(sqlSession, username);
	}

	@Override
	public List<Calendar> selectCalendarEmpNo(int cPage, int numPerPage, int param) {
		return dao.selectCalendarEmpNo(sqlSession, cPage, numPerPage, param);
	}

	@Override
	public int selectCalendarCount2(int param) {
		return dao.selectCalendarCount2(sqlSession, param);
	}

	@Override
	public int deletecCal(int data) {
		return dao.deleteCal(sqlSession, data);
	}

	@Override
	public List<Calendar> selectCalendar1(int cPage, int numPerPage, int data) {
		return dao.selectCalendar1(sqlSession, cPage, numPerPage, data);
	}

	@Override
	public List<Calendar> selectCalendar2(int cPage, int numPerPage, int data) {
		return dao.selectCalendar2(sqlSession, cPage, numPerPage, data);
	}

	@Override
	public List<Calendar> selectCalendar3(int cPage, int numPerPage, int data) {
		return dao.selectCalendar3(sqlSession, cPage, numPerPage, data);
	}

	@Override
	public int selectCalendar1Count(int data) {
		return dao.selectCalendar1Count(sqlSession, data);
	}
	
	@Override
	public int selectCalendar2Count(int data) {
		return dao.selectCalendar2Count(sqlSession, data);
	}

	
	@Override
	public int selectCalendar3Count(int data) {
		return dao.selectCalendar3Count(sqlSession, data);
	}

	@Override
	public Calendar selectCno(int data) {
		return dao.selectCno(sqlSession, data);
	}





	
	
	
	
}
