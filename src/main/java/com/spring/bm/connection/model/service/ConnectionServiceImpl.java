package com.spring.bm.connection.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.connection.model.dao.ConnectionDao;
import com.spring.bm.connection.model.vo.Connection;

@Service
public class ConnectionServiceImpl implements ConnectionService {

	@Autowired
	ConnectionDao dao;
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public int selectConnCount() {
		return dao.selectConnCount(session);
	}

	@Override
	public List<Map<String, String>> selectConnList(int cPage, int numPerPage) {
		return dao.selectConnList(session,cPage,numPerPage);
	}

	@Override
	public List<Map<String,String>> selectStfMainCateg() {
		return dao.selectStfMainCateg(session);
	}

	@Override
	public int searchDisCon(Map<String,String> param) {
		return dao.searchDisCon(session,param);
	}

	@Override
	public int searchCon(Map<String,String> param) {
		return dao.searchCon(session,param);
	}

	@Override
	public int enrollConn(Map<String, String> param) throws Exception {
		int result = 0;
		
		result = dao.enrollConn(session,param);	//거래처 정보 입력
		if(result==0) throw new RuntimeException();
		
		if(result!=0) {
			result = dao.enrollTransferInfo(session,param);	//이체정보 입력
			if(result==0) throw new Exception();
		}
		
		return result;
	}

	@Override
	public Map<String, String> selectConnection(int conCode) {
		return dao.selectConnection(session,conCode);
	}

	@Override
	public String selectThisMainCateg(int conCode) {
		return dao.selectThisMainCateg(session,conCode);
	}

	@Override
	public Map<String, String> selectTransferInfo(int conCode) {
		return dao.selectTransferInfo(session,conCode);
	}

	@Override
	public int modifyConn(Map<String, String> param) throws Exception {
		int result = 0;
		
		result = dao.modifyConn(session,param);	//거래처 정보 수정
		if(result==0) throw new RuntimeException();
		
		if(result!=0) {
			result = dao.modifyTransferInfo(session,param);	//이체정보 수정
			if(result==0) throw new Exception();
		}
		
		return result;
	}
	
	@Override
	public int deleteConn(int conCode) {
		return dao.deleteConn(session,conCode);
	}

	@Override
	public List<Map<String, String>> selectConnSearchList(Map<String, Object> m) {
		return dao.selectConnSearchList(session, m);
	}

	@Override
	public int selectConnSearchCount(Map<String, Object> m) {
		return dao.selectConnSearchCount(session, m);
	}

	//구매정보 등록 거래처 검색
	@Override
	public List<Connection> searchConnection(Map<String, Object> m) {
		return dao.searchConnection(session, m);
	}

	@Override
	public int searchConnectionCount(Map<String, Object> m) {
		return dao.serchConnectionCount(session, m);
	}
	
	//판매정보 등록 거래처 검색
	@Override
	public List<Connection> searchConnection2(Map<String, Object> m) {
		return dao.searchConnection2(session, m);
	}

	@Override
	public int searchConnectionCount2(Map<String, Object> m) {
		return dao.serchConnectionCount2(session, m);
	}
	
}