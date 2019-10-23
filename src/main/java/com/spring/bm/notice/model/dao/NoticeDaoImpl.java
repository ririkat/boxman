package com.spring.bm.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.bm.notice.model.vo.Notice;
import com.spring.bm.notice.model.vo.UploadNotice;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Override
	public int insertNotice(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		return sqlSession.insert("notice.insertNotice", param);
	}

	@Override
	public int insertUploadNotice(SqlSessionTemplate sqlSession, UploadNotice n) {
		return sqlSession.insert("notice.insertUploadNotice", n);
	}

	@Override
	public Notice selectNoticeOne(SqlSessionTemplate sqlSession, String nName) {
		return sqlSession.selectOne("notice.selectNoticeOne", nName);
	}

	@Override
	public int selectNoticeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("notice.selectNoticeCount");
	}

	@Override
	public int selectNoticeCount2(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("notice.selectNoticeCount2");
	}

	@Override
	public int selectNoticeCount3(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("notice.selectNoticeCount3");
	}

	@Override
	public List<Map<String, String>> selectNoticeList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("notice.selectNoticeList", null, rows);
	}

	@Override
	public int updateReadCount(SqlSessionTemplate sqlSession, int nReadCount) {
		return sqlSession.update("notice.updateReadCount", nReadCount);
	}

	@Override
	public List<UploadNotice> selectUpNoticeList(SqlSessionTemplate sqlSession, int nNo) {
		return sqlSession.selectList("notice.selectUpNoticeList", nNo);
	}

	@Override
	public List<Notice> selectNoticeList2(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("notice.selectNoticeList2");
	}

	@Override
	public int insertSite(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		return sqlSession.insert("notice.insertSite", param);
	}

	@Override
	public int updateNotice(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		return sqlSession.update("notice.updateNotice", param);
	}

	@Override
	public int deleteNotice(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		return sqlSession.delete("notice.deleteNotice", param);
	}

	@Override
	public List<Map<String, String>> selectNoticeCheck(SqlSessionTemplate sqlSession, String nName) {
		return sqlSession.selectList("notice.selectNoticeCheck", nName);
	}

	@Override
	public int deleteUpNotice(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		return sqlSession.delete("notice.deleteUpNotice", param);
	}

	@Override
	public List<Map<String, String>> selectNoticeSearchList(SqlSessionTemplate sqlSession, Map<String, Object> m) {
		  int cPage = (Integer) m.get("cPage");
	      int numPerPage = (Integer) m.get("numPerPage");
	      RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
	         
	      return sqlSession.selectList("notice.selectNoticeSearchList", m, rows);
	}

	@Override
	public int selectNoticeSearchCount(SqlSessionTemplate sqlSession, Map<String, Object> m) {
		  return sqlSession.selectOne("notice.selectNoticeSearchCount", m);
	}
	
	@Override
	public List<Map<String, Object>> selectSiteList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("notice.selectSiteList");
	}

	@Override
	public List<Map<String, Object>> selectSiteList2(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("notice.selectSiteList2");
	}
	

}
