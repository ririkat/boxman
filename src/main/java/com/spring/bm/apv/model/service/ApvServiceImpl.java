package com.spring.bm.apv.model.service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
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
		result=dao.insertApvLine(session,param);
		if(result==0) throw new Exception(); //트랜잭션 처리하기
		ArrayList list=(ArrayList) param.get("selOpts");
		int pno=1;
		int curr=Integer.parseInt((String) param.get("apvlNo"));
		for(int i=0; i<list.size(); i++) {
			Map<String,Object> param2=new HashMap<String,Object>();
			param2.put("priorNo",pno);
			param2.put("empNo",Integer.parseInt(list.get(i).toString()));
			param2.put("apvlNo",curr);
			result=dao.insertApvlApplicant(session,param2);
			pno++;
			if(result==0) throw new Exception();
		}
		
		return result;
	}
	
	@Override
	public int deleteApvLine(int alNo) throws Exception{
		
		int result=dao.deleteApvlApplicant(session,alNo);
		if(result==0) throw new Exception();
		result=dao.deleteApvLine(session,alNo);
		return result;
	}
	
	@Override
	public Map<String, Object> selectALModi(int alno) {
		return dao.selectALModi(session,alno);
	}
	
	@Override
	public List selectALApplicants(int alno) {
		return dao.selectALApplicants(session,alno);
	}
	
	@Override
	public int updateApvLine(Map<String, Object> param) throws Exception {
		int result=0;
		/*결재라인 자체테이블 수정*/
		result=dao.updateApvLine(session,param);
		if(result==0) throw new Exception(); //트랜잭션 처리하기
		/*기존 결재자들 삭제*/
		result=dao.deleteApvlApplicants(session,param);
		if(result==0) throw new Exception();
		/*새로 입력된 결재라인으로 등록*/
		ArrayList list=(ArrayList) param.get("selOpts");
		int pno=1;
		int curr=Integer.parseInt((String) param.get("apvlNo"));
		for(int i=0; i<list.size(); i++) {
			Map<String,Object> param2=new HashMap<String,Object>();
			param2.put("priorNo",pno);
			param2.put("empNo",Integer.parseInt(list.get(i).toString()));
			param2.put("apvlNo",curr);
			result=dao.insertApvlApplicant(session,param2);
			pno++;
			if(result==0) throw new Exception();
		}
		
		return result;
	}
	
}
