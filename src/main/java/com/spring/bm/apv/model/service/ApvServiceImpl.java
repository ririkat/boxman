package com.spring.bm.apv.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.apv.model.dao.ApvDao;

@Service
public class ApvServiceImpl implements ApvService {
	@Autowired
	ApvDao dao;
	@Autowired
	SqlSessionTemplate session;
	
	/*결재양식*/
	@Override
	public int insertApvDoc(Map<String, Object> param) throws Exception{
		int result=0;
		result=dao.insertApvDoc(session,param);
		if(result == 0) throw new Exception();
		return result;
	}
	
	@Override
	public List<Map<String, Object>> selectDocCate() {
		return dao.selectDocCate(session);
	}
	
	@Override
	public List<Map<String, Object>> selectDocCCate() {
		return dao.selectDocCCate(session);
	}
	
	@Override
	public List<Map<String, Object>> selectDocHCate() {
		return dao.selectDocHCate(session);
	}

	
	@Override
	public List<Map<String, Object>> selectDocForm(int cPage, int numPerPage) {
		return dao.selectDocForm(session,cPage,numPerPage);
	}
	
	@Override
	public int selectDfCount() {
		return dao.selectDfCount(session);
	}
	
	@Override
	public Map<String, Object> selectDfModi(int dfNo) {
		return dao.selectDfModi(session,dfNo);
	}
	
	@Override
	public int updateApvDoc(Map<String, Object> param) throws Exception {
		
		int result=0;
		result=dao.updateApvDoc(session,param);
		if(result == 0) throw new Exception();
		return result;
	}
	
	@Override
	public int deleteApvDoc(int dfNo) throws Exception  {
		int result=0;
		result=dao.deleteApvDoc(session,dfNo);
		if(result == 0) throw new Exception();
		return result;
	}
	
	@Override
	public int insertApvDocHead(Map<String, Object> param) throws Exception {
		int result=0;
		result=dao.insertApvDocHead(session,param);
		if(result == 0) throw new Exception();
		return result;
	}
	
	@Override
	public int insertApvDocContent(Map<String, Object> param) throws Exception {
		int result=0;
		result=dao.insertApvDocContent(session,param);
		if(result == 0) throw new Exception();
		return result;
	}
	
	@Override
	public String selectDfhContent(int no) {
		return dao.selectDfhContent(session,no);
	}
	
	@Override
	public String selectDfcContent(int no) {
		return dao.selectDfcContent(session,no);
	}
	
	/*결재라인*/
	@Override
	public List<Map<String, Object>> selectDeptList() {
		return dao.selectDeptList(session);
	}
	
	@Override
	public List<Map<String, Object>> selectMyApvLineList(int cPage, int numPerPage,int loginNo) {
		return dao.selectMyApvLineList(session,cPage,numPerPage,loginNo);
	}
	
	@Override
	public int selectMyALCount(int loginNo) {
		return dao.selectMyALCount(session,loginNo);
	}
	
	@Override
	public List<Map<String, Object>> selectDeptToEmp(int deptNo) {
		return dao.selectDeptToEmp(session,deptNo);
	}
	
	@Override
	public int insertApvLine(Map<String, Object> param) throws Exception {
		
		int result=0;
		result=dao.insertApvLine(session,param);//board테이블에 데이터 입력!
		if(result==0) throw new Exception(); //트랜잭션 처리하기
		/*
		 * if(attachList.size()>0) { for(Attachment a : attachList) {
		 * a.setBoardNo((Integer)param.get("boardNo"));
		 * result=dao.insertAttachment(session,a); if(result==0) throw new Exception();
		 * //트랜잭션 처리하기 } }
		 */
		System.out.println(param.get("apvL"));
		
		return result;
	}
	
}
