package com.spring.bm.calendar.model.service;

import java.util.Map;

public interface CalendarService {

	//스케줄 등록
	int insertCalender(Map<String, Object> param);
	//스케줄 수정
	int updateCalendar(Map<String, Object> param);
	
	

}
