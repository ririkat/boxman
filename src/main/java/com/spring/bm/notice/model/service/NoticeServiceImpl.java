package com.spring.bm.notice.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.bm.notice.model.dao.NoticeDao;
import com.spring.bm.notice.model.vo.Notice;
import com.spring.bm.notice.model.vo.UploadNotice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao dao;
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	@Transactional(rollbackFor = Exception.class) //RuntimeException 발생시!
	public int insertNotice(Map<String, Object> param, List<UploadNotice> upNoticeList)throws Exception{
		int result=0;
		int boardNo=0;
		result=dao.insertNotice(sqlSession, param); //board테이블에 데이터를 입력!
		if(result==0) throw new RuntimeException();
		if(upNoticeList.size()>0) {
			for(UploadNotice n : upNoticeList) {
				n.setNNo(Integer.parseInt((String)param.get("nNo")));
				result=dao.insertUploadNotice(sqlSession, n);
			
				if(result==0) throw new Exception();
			}
		}
		
		return result;
	}

	@Override
	public Notice selectNoticeOne(String nName) {
		return dao.selectNoticeOne(sqlSession, nName);
	}

	@Override
	public int selectNoticeCount() {
		return dao.selectNoticeCount(sqlSession);
	}
	

	@Override
	public int selectNoticeCount2() {
		return dao.selectNoticeCount2(sqlSession);
	}

	@Override
	public int selectNoticeCount3() {
		return dao.selectNoticeCount3(sqlSession);
	}

	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		return dao.selectNoticeList(sqlSession, cPage, numPerPage);
	}

	@Override
	public int updateReadCount(int nReadCount) {
		return dao.updateReadCount(sqlSession, nReadCount);
	}

	@Override
	public List<UploadNotice> selectUpNoticeList(int nNo) {
		return dao.selectUpNoticeList(sqlSession, nNo);
	}

	@Override
	public List<Notice> selectNoticeList2() {
		return dao.selectNoticeList2(sqlSession);
	}

	@Override
	public int insertSite(Map<String, Object> param) {
		return dao.insertSite(sqlSession, param);
	}

	@Override
	public int deleteNotice(Map<String, Object> param) {
		return dao.deleteNotice(sqlSession, param);
	}

	@Override
	public List<Map<String, String>> selectNoticeCheck(String nName) {
		return dao.selectNoticeCheck(sqlSession, nName);
	}

	@Override
	public int deleteUpNotice(Map<String, Object> param) {
		return dao.deleteUpNotice(sqlSession, param);
	}
	
	@Override
	@Transactional(rollbackFor = Exception.class) //RuntimeException 발생시!
	public int insertUpNotice(Map<String, Object> param, List<UploadNotice> upNoticeList){
		int result=0;
		int boardNo=0;

		if(upNoticeList.size()>0) {
			for(UploadNotice n : upNoticeList) {
				n.setNNo(Integer.parseInt((String)param.get("nNo")));
				result=dao.insertUploadNotice(sqlSession, n);

			}
		}
		
		return result;
	}

	@Override
	public List<Map<String, String>> selectNoticeSearchList(Map<String, Object> m) {
		return dao.selectNoticeSearchList(sqlSession, m);
	}

	@Override
	public int selectNoticeSearchCount(Map<String, Object> m) {
		return dao.selectNoticeSearchCount(sqlSession, m);
	}
	
	@Override
	public List<Map<String, Object>> selectSiteList() {
		return dao.selectSiteList(sqlSession);
	}

	@Override
	public List<Map<String, Object>> selectSiteList2() {
		return dao.selectSiteList2(sqlSession);
	}

	@Override
	public int updateNotice(Map<String, Object> param, List<UploadNotice> upNoticeList) throws Exception {
		int result=0;
		int boardNo=0;

		result = dao.updateNotice(sqlSession, param);
		if(result == 0 ) throw new RuntimeException();
		if(upNoticeList.size()>0) {
			for(UploadNotice n : upNoticeList) {
				n.setNNo(Integer.parseInt((String)param.get("nNo")));
				result=dao.insertUploadNotice(sqlSession, n);
				 if(result == 0) throw new Exception();
			}
		}
		
		return result;
	}

	@Override
	public int updateNotice(Map<String, Object> param) {
		return dao.updateNotice(sqlSession, param);
	}

	@Override
	public int deleteSite(String param) {
		return dao.deleteSite(sqlSession, param);
	}
	

	
}
