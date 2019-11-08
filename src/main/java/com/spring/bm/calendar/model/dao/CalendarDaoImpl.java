package com.spring.bm.calendar.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.bm.calendar.model.vo.Calendar;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Override
	public int insertCalendar(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		return sqlSession.insert("calendar.insertCalendar", param);
	}

	@Override
	public int updateCalendar(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		return sqlSession.update("calendar.updateCalendar", param);
	}

	@Override
	public List<Map<String, Object>> selectScheCategory(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("calendar.selectScheCategory");
	}

	@Override
	public List<Calendar> selectCalendarEmpNo(SqlSessionTemplate sqlSession, int username) {
		return sqlSession.selectList("calendar.selectCalendarEmpNo",username);
	}

	@Override
	public int selectCalendarCount(SqlSessionTemplate sqlSession, int username) {
		return sqlSession.selectOne("calendar.selectCalendarCount", username);
	}

	@Override
	public List<Calendar> selectCalendarEmpNo(SqlSessionTemplate sqlSession, int cPage, int numPerPage, int param) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("calendar.selectCalendarEmpNo2",param,rows);
	}

	@Override
	public int selectCalendarCount2(SqlSessionTemplate sqlSession, int param) {
		return sqlSession.selectOne("calendar.selectCalendarCount2", param);
	}

	@Override
	public int deleteCal(SqlSessionTemplate sqlSession, int data) {
		return sqlSession.delete("calendar.deleteCalendar",data);
	}



	
	
	
}
