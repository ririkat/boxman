package com.spring.bm.calendar.model.service;

import java.util.List;
import java.util.Map;

public interface CalendarService {

	//스케줄 등록
	int insertCalender(Map<String, Object> param);
	//스케줄 수정
	int updateCalendar(Map<String, Object> param);
	//스케줄 유형선택 리스트
	List<Map<String, Object>> selectScheCategory();

}
