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
	public int insertCalender(Map<String, Object> param) {
		int result = 0;
		result = dao.insertCalendar(sqlSession, param);
		
		if(result > 0) {
			Calendar c = new Calendar();
			c.set_id(Integer.parseInt((String) param.get("scheNo")));
			result = c.get_id();
		}
		return result;
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




	
	
	
	
}
