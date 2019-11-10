package com.spring.bm.apv.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ApvDaoImpl implements ApvDao {
	/*결재양식*/
	@Override
	public int insertApvDoc(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("apv.insertApvDoc", param);
	}
	
	@Override
	public List<Map<String, Object>> selectDocCate(SqlSessionTemplate session) {
		return session.selectList("apv.selectDocCate");
	}
	
	@Override
	public List<Map<String, Object>> selectDocCCate(SqlSessionTemplate session) {
		return session.selectList("apv.selectDocCCate");
	}
	
	@Override
	public List<Map<String, Object>> selectDocHCate(SqlSessionTemplate session) {
		return session.selectList("apv.selectDocHCate");
	}
	
	@Override
	public List<Map<String, Object>> selectDocForm(SqlSessionTemplate session,int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return session.selectList("apv.selectDocForm", null, rows);
	}
	
	@Override
	public int selectDfCount(SqlSessionTemplate session) {
		return session.selectOne("apv.selectDfCount");
	}
	
	@Override
	public Map<String, Object> selectDfModi(SqlSessionTemplate session, int dfNo) {
		return session.selectOne("apv.selectDfModi",dfNo);
	}
	
	@Override
	public int updateApvDoc(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("apv.updateApvDoc",param);
	}
	
	@Override
	public int deleteApvDoc(SqlSessionTemplate session, int dfNo) {
		return session.delete("apv.deleteApvDoc",dfNo);
	}
	
	@Override
	public int insertApvDocHead(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("apv.insertApvDocHead",param);
	}
	
	@Override
	public int insertApvDocContent(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("apv.insertApvDocContent",param);
	}
	
	@Override
	public String selectDfhContent(SqlSessionTemplate session, int no) {
		Map<String,String> map=session.selectOne("apv.selectDfhContent",no);
		String result=map.get("DFHCONTENT");
		return result;
	}

	@Override
	public String selectDfcContent(SqlSessionTemplate session, int no) {
		Map<String,String> map=session.selectOne("apv.selectDfcContent",no);
		String result=map.get("DFCCONTENT");
		return result;
	}
	
	/*결재라인*/
	@Override
	public List<Map<String, Object>> selectDeptList(SqlSessionTemplate session) {
		return session.selectList("apv.selectDeptList");
	}
	
	@Override
	public List<Map<String, Object>> selectMyApvLineList(SqlSessionTemplate session, int cPage, int numPerPage,int loginNo) {
		RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return session.selectList("apv.selectMyApvLineList",loginNo, rows);
	}
	
	@Override
	public int selectMyALCount(SqlSessionTemplate session, int loginNo) {
		return session.selectOne("apv.selectMyALCount",loginNo);
	}
	
	@Override
	public List<Map<String, Object>> selectDeptToEmp(SqlSessionTemplate session, int deptNo) {
		return session.selectList("apv.selectDeptToEmp",deptNo);
	}
	
	@Override
	public int insertApvLine(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("apv.insertApvLine",param);
	}
	
	@Override
	public int insertApvlApplicant(SqlSessionTemplate session, Map<String, Object> param2) {
		return session.insert("apv.insertApvlApplicant",param2);
	}
	
	@Override
	public int deleteApvlApplicant(SqlSessionTemplate session, int alNo) {
		return session.delete("apv.deleteApvlApplicant",alNo);
	}
	
	@Override
	public int deleteApvLine(SqlSessionTemplate session, int alNo) {
		return session.delete("apv.deleteApvLine",alNo);
	}
	
	@Override
	public Map<String, Object> selectALModi(SqlSessionTemplate session, int alno) {
		return session.selectOne("apv.selectALModi",alno);
	}
	
	@Override
	public List selectALApplicants(SqlSessionTemplate session, int alno) {
		return session.selectList("apv.selectALApplicants",alno);
	}
	
	@Override
	public int updateApvLine(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("apv.updateApvLine",param);
	}
	
	@Override
	public int deleteApvlApplicants(SqlSessionTemplate session, Map<String, Object> param) {
		return session.delete("apv.deleteApvlApplicants",param);
	}
	
	@Override
	public Map<String, Object> selectEmpInfoAll(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectOne("apv.selectEmpInfoAll",param);
	}
	
	/*기안하기*/
	//approval 테이블
	@Override
	public int insertRequestApv(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("apv.insertRequestApv",param);
	}
	//apvApplicant 테이블
	@Override
	public int insertApvApplicant(SqlSessionTemplate session, Map<String, Object> param2) {
		return session.insert("apv.insertApvApplicant",param2);
	}
	//apvReferer 테이블
	@Override
	public int insertApvReferer(SqlSessionTemplate session, Map<String, Object> param2) {
		return session.insert("apv.insertApvReferer",param2);
	}
	//apvEnforcer 테이블
	@Override
	public int insertApvEnforcer(SqlSessionTemplate session, Map<String, Object> param2) {
		return session.insert("apv.insertApvEnforcer",param2);
	}
	
	/*상신함*/
	@Override
	public List<Map<String, Object>> selectSendApvList(SqlSessionTemplate session, int cPage, int numPerPage,
			int loginNo) {
		RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return session.selectList("apv.selectSendApvList",loginNo, rows);
	}
	@Override
	public int selectSendApvCount(SqlSessionTemplate session, int loginNo) {
		return session.selectOne("apv.selectSendApvCount",loginNo);
	}
	//상신함,참조함 -> 조회 뷰
	@Override
	public Map<String, Object> selectLookupApv(SqlSessionTemplate session, int apvNo) {
		return session.selectOne("apv.selectLookupApv",apvNo);
	}
	
	/*수신함*/
	@Override
	public List<Map<String, Object>> selectReceiveApvList(SqlSessionTemplate session, int cPage, int numPerPage,
			int loginNo) {
		RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return session.selectList("apv.selectReceiveApvList",loginNo, rows);
	}
	@Override
	public int selectReceiveApvCount(SqlSessionTemplate session, int loginNo) {
		return session.selectOne("apv.selectReceiveApvCount",loginNo);
	}
	
	/*시행함*/
	@Override
	public List<Map<String, Object>> selectEnforceApvList(SqlSessionTemplate session, int cPage, int numPerPage,
			int loginNo) {
		RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return session.selectList("apv.selectEnforceApvList",loginNo, rows);
	}
	@Override
	public int selectEnforceApvCount(SqlSessionTemplate session, int loginNo) {
		return session.selectOne("apv.selectEnforceApvCount",loginNo);
	}
	
	/*참조함*/
	@Override
	public List<Map<String, Object>> selectReferApvList(SqlSessionTemplate session, int cPage, int numPerPage,
			int loginNo) {
		RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return session.selectList("apv.selectReferApvList",loginNo, rows);
	}
	@Override
	public int selectReferApvCount(SqlSessionTemplate session, int loginNo) {
		return session.selectOne("apv.selectReferApvCount",loginNo);
	}
	
	/*참조함 -> 열람 뷰*/
	@Override
	public Map<String, Object> selectLookupApvR(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectOne("apv.selectLookupApvR",param);
	}
	@Override
	public int updateReferYN(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("apv.updateReferYN",param);
	}
	
	/*수신결재함 -> 결재하기*/
	@Override
	public Map<String, Object> selectLookupApvA(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectOne("apv.selectLookupApvA",param);
	}
	
	/*결재하기 -> 개인결재승인처리*/
	@Override
	public int selectApvACount(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectOne("apv.selectApvACount",param);
	}
	@Override
	public int apvPermit(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("apv.apvPermit",param);
	}
	@Override
	public int updateApvPermitAll(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("apv.updateApvPermitAll",param);
	}
	@Override
	public int updateApvPermit(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("apv.updateApvPermit",param);
	}
	
	/*결재하기 -> 반려하기*/
	@Override
	public int apvAReturn(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("apv.apvAReturn",param);
	}
	@Override
	public int updateApvReturn(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("apv.updateApvReturn",param);
	}
	
	/*시행함 -> 시행관리 뷰*/
	@Override
	public Map<String, Object> selectLookupApvEOne(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectOne("apv.selectLookupApvEOne",param);
	}
	
	/*시행관리뷰 -> 시행처리*/
	@Override
	public int updateApvEEnforce(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("apv.updateApvEEnforce",param);
	}
	@Override
	public int updateApvEnforce(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("apv.updateApvEnforce",param);
	}
	/*시행관리뷰 -> 반송처리*/
	@Override
	public int apvEEReturn(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("apv.apvEEReturn",param);
	}
	@Override
	public int updateApvEReturn(SqlSessionTemplate session, Map<String, Object> param) {
		return session.update("apv.updateApvEReturn",param);
	}
	
}
