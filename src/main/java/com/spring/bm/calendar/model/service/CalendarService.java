package com.spring.bm.calendar.model.service;

import java.util.List;
import java.util.Map;

import com.spring.bm.calendar.model.vo.Calendar;

public interface CalendarService {

	//스케줄 등록
	Calendar insertCalender(Map<String, Object> param);
	//스케줄 수정
	int updateCalendar(Map<String, Object> param);
	//스케줄 유형선택 리스트
	List<Map<String, Object>> selectScheCategory();
	
	//회원번호로 스케줄 조회
	List<Calendar> selectCalendarEmpNo(int username);
	
	//전체 스케줄 갯수 조회
	int selectCalendarCount(int username);
	
	//회원번호 스케줄 조회2
	List<Calendar> selectCalendarEmpNo(int cPage, int numPerPage, int param);
	int selectCalendarCount2(int param);
	
	//일정 삭제
	int deletecCal(int data);
	
	//개인별 조회
	List<Calendar> selectCalendar1(int cPage, int numPerPage, int data);
	int selectCalendar1Count(int data);
	//부서별 조회
	List<Calendar> selectCalendar2(int cPage, int numPerPage, int data);
	int selectCalendar2Count(int data);
	//회사별 조회
	List<Calendar> selectCalendar3(int cPage, int numPerPage, int data);
	int selectCalendar3Count(int data);
	
	//일정 번호로 조회
	Calendar selectCno(int data);

	


}
