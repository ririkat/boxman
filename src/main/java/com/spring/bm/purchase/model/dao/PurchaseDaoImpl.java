package com.spring.bm.purchase.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PurchaseDaoImpl implements PurchaseDao {

	@Override
	public List<Map<String, String>> selectPurList(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("purchase.selectPurList",null,rows);
	}

	@Override
	public int selectPurCount(SqlSessionTemplate session) {
		return session.selectOne("purchase.selectPurCount");
	}

	@Override
	public List<Map<String, String>> selectConnList(SqlSessionTemplate session) {
		return session.selectList("purchase.selectConnList");
	}

}
