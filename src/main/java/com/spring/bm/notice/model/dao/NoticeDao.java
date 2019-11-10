package com.spring.bm.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.spring.bm.employee.model.vo.Employee;
import com.spring.bm.notice.model.vo.Notice;
import com.spring.bm.notice.model.vo.UploadNotice;

public interface NoticeDao {

	Notice selectNoticeOne(SqlSessionTemplate sqlSession, String nName);

	int selectNoticeCount(SqlSessionTemplate sqlSession);
	
	int selectNoticeCount2(SqlSessionTemplate sqlSession);

	int selectNoticeCount3(SqlSessionTemplate sqlSession);

	List<Map<String, String>> selectNoticeList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);

	int updateReadCount(SqlSessionTemplate sqlSession, int nReadCount);

	int insertNotice(SqlSessionTemplate sqlSession, Map<String, Object> param);

	int insertUploadNotice(SqlSessionTemplate sqlSession, UploadNotice n);

	List<UploadNotice> selectUpNoticeList(SqlSessionTemplate sqlSession, int nNo);

	List<Notice> selectNoticeList2(SqlSessionTemplate sqlSession);

	int insertSite(SqlSessionTemplate sqlSession, Map<String, Object> param);

	int updateNotice(SqlSessionTemplate sqlSession, Map<String, Object> param);

	int deleteNotice(SqlSessionTemplate sqlSession, Map<String, Object> param);

	List<Map<String, String>> selectNoticeCheck(SqlSessionTemplate sqlSession, String nName);

	int deleteUpNotice(SqlSessionTemplate sqlSession, Map<String, Object> param);

	List<Map<String, String>> selectNoticeSearchList(SqlSessionTemplate sqlSession, Map<String, Object> m);

	int selectNoticeSearchCount(SqlSessionTemplate sqlSession, Map<String, Object> m);

	List<Map<String, Object>> selectSiteList(SqlSessionTemplate sqlSession);
	
	List<Map<String, Object>> selectSiteList2(SqlSessionTemplate sqlSession);

	int deleteSite(SqlSessionTemplate sqlSession, String param);

	Employee selectNoticeEmp(SqlSessionTemplate sqlSession, int empNo);

	List<Map<String, String>> selectNoticeList3(SqlSessionTemplate sqlSession, int cPage, int numPerPage);

	List<Map<String, String>> selectNoticeList4(SqlSessionTemplate sqlSession, int cPage, int numPerPage);

}
