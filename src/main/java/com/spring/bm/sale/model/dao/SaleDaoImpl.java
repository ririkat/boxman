package com.spring.bm.sale.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SaleDaoImpl implements SaleDao {

	@Override
	public List<Map<String, String>> selectSaleList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("sale.selectSaleList",null,rows);
	}

	@Override
	public int selectSaleCount(SqlSessionTemplate session) {
		return session.selectOne("sale.selectSaleCount");
	}
	
	@Override
	public List<Map<String, String>> selectConnList(SqlSessionTemplate session) {
		return session.selectList("sale.selectConnList");
	}

	@Override
	public int enrollSaleInfo(SqlSessionTemplate session, Map<String, Object> param) {
		return session.insert("sale.enrollSaleInfo", param);
	}

	@Override
	public int enrollSaleItem(SqlSessionTemplate session, Map<String,Object> paramMap) {
		return session.insert("sale.enrollSaleItem", paramMap);
	}

	@Override
	public List<Map<String, String>> selectSaleSearchList(SqlSessionTemplate session, Map<String, Object> m) {
		int cPage = (Integer)m.get("cPage");
		int numPerPage = (Integer)m.get("numPerPage");
		RowBounds rows = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("sale.selectSaleSearchList",m,rows);
	}

	@Override
	public int selectSaleSearchCount(SqlSessionTemplate session, Map<String, Object> m) {
		return session.selectOne("sale.selectSaleSearchCount",m);
	}

	@Override
	public Map<String, String> selectSaleInfo(SqlSessionTemplate session, int salCode) {
		return session.selectOne("sale.selectSaleInfo", salCode);
	}

	@Override
	public List<Map<String, String>> selectSaleItemList(SqlSessionTemplate session, int salCode) {
		return session.selectList("sale.selectSaleItemList", salCode);
	}
	
	@Override
	public Map<String, Object> selectSalOne(SqlSessionTemplate session, Map<String, Object> param) {
		return session.selectOne("sale.selectSalOne", param);
	}

}
