package com.spring.bm.sale.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.sale.model.dao.SaleDao;

@Service
public class SaleServiceImpl implements SaleService {

	@Autowired
	SaleDao dao;
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Map<String, String>> selectSaleList(int cPage, int numPerPage) {
		return dao.selectSaleList(session, cPage, numPerPage);
	}

	@Override
	public int selectSaleCount() {
		return dao.selectSaleCount(session);
	}
	
	@Override
	public List<Map<String, String>> selectConnList() {
		return dao.selectConnList(session);
	}

	@Override
	public int enrollSaleInfo(Map<String, Object> param) throws Exception {
		int result = 0;
		
		result = dao.enrollSaleInfo(session,param);	//구매 정보 등록
		if(result==0) throw new RuntimeException();

		if(result!=0) {
			Map<String,Object> paramMap = new HashMap<String,Object>();
			List<Map<String,Object>> stList = new ArrayList<Map<String,Object>>();
			for(int i=0; i<Integer.parseInt(String.valueOf(param.get("cnt"))); i++) {
				Map<String,Object> stMap = new HashMap<String,Object>();
				stMap.put("stNo", param.get("stNo"+i));
				stMap.put("stNum", param.get("stNum"+i));
				stList.add(stMap);
			}
			paramMap.put("stList",stList);
			result = dao.enrollSaleItem(session,paramMap);	//물품 리스트 등록
			if(result==0) throw new Exception();
		}
		return result;
	}

	@Override
	public List<Map<String, String>> selectSaleSearchList(Map<String, Object> m) {
		return dao.selectSaleSearchList(session,m);
	}

	@Override
	public int selectSaleSearchCount(Map<String, Object> m) {
		return dao.selectSaleSearchCount(session,m);
	}

	@Override
	public Map<String, String> selectSaleInfo(int salCode) {
		return dao.selectSaleInfo(session,salCode);
	}

	@Override
	public List<Map<String, String>> selectSaleItemList(int salCode) {
		return dao.selectSaleItemList(session,salCode);
	}

	@Override
	public Map<String, Object> selectSalOne(Map<String, Object> param) {
		return dao.selectSalOne(session,param);
	}
	
}
