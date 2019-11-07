package com.spring.bm.calendar.model.service;

import java.util.List;
import java.util.Map;

import com.spring.bm.calendar.model.vo.Calendar;

public interface CalendarService {

	//스케줄 등록
	int insertCalender(Map<String, Object> param);
	//스케줄 수정
	int updateCalendar(Map<String, Object> param);
	//스케줄 유형선택 리스트
	List<Map<String, Object>> selectScheCategory();
	
	//회원번호로 스케줄 조회
	List<Calendar> selectCalendarEmpNo(int username);
	
	//전체 스케줄 조회
	int selectCalendarCount(int username);

}
