package com.spring.bm.notice.model.service;

import java.util.List;
import java.util.Map;

import com.spring.bm.notice.model.vo.Notice;
import com.spring.bm.notice.model.vo.UploadNotice;

public interface NoticeService {
	//상세페이지
	Notice selectNoticeOne(String nName);
	//페이징
	int selectNoticeCount();
	//게시판 목록
	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);
	//조회수 +1
	int updateReadCount(int nReadCount);
	//게시판 등록
	int insertNotice(Map<String, Object> param, List<UploadNotice> upNoticeList) throws Exception;
	//게시판 등록(첨부파일)
	List<UploadNotice> selectUpNoticeList(int nNo);
	//필독체크리스트
	List<Notice> selectNoticeList2();
	//사이트등록
	int insertSite(Map<String, Object> param);
	//게시글 수정
	int updateNotice(Map<String, Object> param);
	//게시글 삭제
	int deleteNotice(Map<String, Object> param);
	//필독체크가져오기
	List<Map<String, String>> selectNoticeCheck(String nName);
	//게시글 첨부파일 수정시 기존사진 삭제
	int deleteUpNotice(Map<String, Object> param);
	//게시글 첨부파일 수정사진 업로드
	int insertUpNotice(Map<String, Object> param, List<UploadNotice> upNoticeList);
	//게시글 제목으로 검색
	List<Notice> selectNoticeSearchList(Map<String, Object> m);
	//게시글 제목으로 검색
	int selectNoticeSearchCount(Map<String, Object> m);
	//등록한 사이트 목록 (내부)
	List<Map<String, Object>> selectSiteList();
	//등록한 사이트 목록 (외부)
	List<Map<String, Object>> selectSiteList2();
}
