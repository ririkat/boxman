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

	@Override
	public Map<String, String> addStuffToTemp(SqlSessionTemplate session, String stuffNo) {
		return session.selectOne("purchase.addStuffToTemp", stuffNo);
	}

	@Override
	public int enrollPurInfo(SqlSessionTemplate session, Map<String, String> param) {
		return session.insert("purchase.enrollPurInfo", param);
	}

	@Override
	public int enrollPurItem(SqlSessionTemplate session, Map<String,Object> paramMap) {
		return session.insert("purchase.enrollPurItem", paramMap);
	}

}
