package com.spring.bm.calendar.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.calendar.dao.CalendarDao;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	CalendarDao dao;
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertCalender(Map<String, Object> param) {
		return dao.insertCalendar(sqlSession, param);
	}

	@Override
	public int updateCalendar(Map<String, Object> param) {
		return dao.updateCalendar(sqlSession, param);
	}

	
	
	
	
}
