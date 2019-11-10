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
	
	@Override
	public Map<String, Object> selectEmpInfoAll(Map<String, Object> param) {
		return dao.selectEmpInfoAll(session,param);
	}
	
	@Override
	public int insertRequestApv(Map<String, Object> param) throws Exception{
		int result=0;
		result=dao.insertRequestApv(session,param);
		if(result==0) throw new Exception();
		
		int apvNo=Integer.parseInt((String) param.get("apvNo"));
		
		//결재자,시행자,참조자 넣는 로직
		if((param.get("apvLA"))!=null&&((ArrayList) param.get("apvLA")).size()>0) {
			int pno=1;
			ArrayList listA=(ArrayList) param.get("apvLA");
			for(int i=0; i<listA.size(); i++) {
				Map<String,Object> param2=new HashMap<String,Object>();
				param2.put("priorNo",pno);
				param2.put("empNo",Integer.parseInt(listA.get(i).toString()));
				param2.put("apvNo",apvNo);
				result=dao.insertApvApplicant(session,param2);
				pno++;
				if(result==0) throw new Exception();
			}
		}
		if((param.get("apvLR"))!=null&&((ArrayList) param.get("apvLR")).size()>0) {
			int pno=1;
			ArrayList listR=(ArrayList) param.get("apvLR");
			for(int i=0; i<listR.size(); i++) {
				Map<String,Object> param2=new HashMap<String,Object>();
				param2.put("priorNo",pno);
				param2.put("empNo",Integer.parseInt(listR.get(i).toString()));
				param2.put("apvNo",apvNo);
				result=dao.insertApvReferer(session,param2);
				pno++;
				if(result==0) throw new Exception();
			}
		}
		if(param.get("apvLE")!=null&&!((String.valueOf(param.get("apvLE"))).equals(""))) {
			System.out.println("들어오니?");
			String apvE=String.valueOf(param.get("apvLE"));
			System.out.println(apvE);
			Map<String,Object> param2=new HashMap<String,Object>();
			param2.put("empNo",Integer.parseInt(apvE));
			param2.put("apvNo",apvNo);
			result=dao.insertApvEnforcer(session,param2);
			if(result==0) throw new Exception();
		}
		
		return result;
	}
	
	/*상신함 리스트 불러오기*/
	@Override
	public List<Map<String, Object>> selectSendApvList(int cPage, int numPerPage,int loginNo) {
		return dao.selectSendApvList(session,cPage,numPerPage,loginNo);
	}
	@Override
	public int selectSendApvCount(int loginNo) {
		return dao.selectSendApvCount(session,loginNo);
	}
	//상신함 -> 조회 뷰
	@Override
	public Map<String, Object> selectLookupApv(int apvNo) {
		return dao.selectLookupApv(session,apvNo);
	}
	
	/*수신함 리스트 불러오기*/
	@Override
	public List<Map<String, Object>> selectReceiveApvList(int cPage, int numPerPage, int loginNo) {
		return dao.selectReceiveApvList(session, cPage, numPerPage, loginNo);
	}
	@Override
	public int selectReceiveApvCount(int loginNo) {
		return dao.selectReceiveApvCount(session,loginNo);
	}
	
	/*시행함 리스트 불러오기*/
	@Override
	public List<Map<String, Object>> selectEnforceApvList(int cPage, int numPerPage, int loginNo) {
		return dao.selectEnforceApvList(session, cPage, numPerPage, loginNo);
	}
	@Override
	public int selectEnforceApvCount(int loginNo) {
		return dao.selectEnforceApvCount(session,loginNo);
	}
	
	/*참조함 리스트 불러오기*/
	@Override
	public List<Map<String, Object>> selectReferApvList(int cPage, int numPerPage, int loginNo) {
		return dao.selectReferApvList(session, cPage, numPerPage, loginNo);
	}
	@Override
	public int selectReferApvCount(int loginNo) {
		return dao.selectReferApvCount(session,loginNo);
	}
	
	/*참조함 -> 열람 뷰*/
	@Override
	public Map<String, Object> selectLookupApvR(Map<String, Object> param) {
		return dao.selectLookupApvR(session,param);
	}
	@Override
	public int updateReferYN(Map<String, Object> param) throws Exception {
		int result=0;
		result=dao.updateReferYN(session,param);
		if(result==0) throw new Exception();
		return result;
	}
	
	/*수신결재함 -> 결재하기*/
	@Override
	public Map<String, Object> selectLookupApvA(Map<String, Object> param) {
		return dao.selectLookupApvA(session,param);
	}
	
	/*결재하기 -> 개인결재승인처리*/
	@Override
	public int apvPermit(Map<String, Object> param) throws Exception{
		int result=0;
		//먼저, 해당 결재문서에 결재자들 총 인원을 불러옴
		result=dao.selectApvACount(session,param);
		int allCount=result;
		//개인을 전결처리시킴
		result=dao.apvPermit(session,param);
		if(result==0) throw new Exception();
		//총 인원과 현재 턴 번호가 일치하면 전체 종결상태가 되도록 ,
		if(Integer.parseInt(String.valueOf(param.get("priorNo")))
				==allCount) {
			result=dao.updateApvPermitAll(session,param);
		}else {
			//아니라면 진행상태로 update 하고, currturn +1함.
			result=dao.updateApvPermit(session,param);
		}
		
		return result;
	}
	
	/*결재하기 -> 반려하기*/
	@Override
	public int apvReturn(Map<String, Object> param) throws Exception {
		int result=0;
		result=dao.apvAReturn(session,param);
		if(result==0) throw new Exception();
		result=dao.updateApvReturn(session,param);
		if(result==0) throw new Exception();
		return result;
	}
	
	/*시행함 -> 시행관리 뷰*/
	@Override
	public Map<String, Object> selectLookupApvEOne(Map<String, Object> param) {
		return dao.selectLookupApvEOne(session,param);
	}
	
	/*시행관리뷰 -> 시행처리하기*/
	@Override
	public int apvEnforce(Map<String, Object> param) throws Exception {
		// 개인 시행 처리하기
		int result=0;
		result=dao.updateApvEEnforce(session,param);
		if(result==0) throw new Exception();
		// 문서 시행처리하기
		result=dao.updateApvEnforce(session,param);
		if(result==0) throw new Exception();
		return result;
	}
	
	@Override
	public int apvEReturn(Map<String, Object> param) throws Exception {
		int result=0;
		result=dao.apvEEReturn(session,param);
		if(result==0) throw new Exception();
		result=dao.updateApvEReturn(session,param);
		if(result==0) throw new Exception();
		return result;
	}
}
