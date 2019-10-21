package com.spring.bm.stuff.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.bm.stuff.model.dao.StuffDao;
import com.spring.bm.stuff.model.vo.Stuff;
import com.spring.bm.stuff.model.vo.StuffMaincategory;
import com.spring.bm.stuff.model.vo.StuffSubcategory;
import com.spring.bm.stuff.model.vo.StuffUpload;

@Service
public class StuffServiceImpl implements StuffService {
	
	@Autowired
	StuffDao dao;
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<StuffMaincategory> stuffMaincategoryList() {
		return dao.stuffMaincategoryList(sqlSession);
	}

	@Override
	public List<StuffSubcategory> stuffSubcategoryList(int mcNo) {
		return dao.stuffSubcategoryList(sqlSession, mcNo);
	}

	@Override
	public int stuffEnrollEnd(Map<String, String> param, List<StuffUpload> stuffUploadList) throws Exception{
		
		int result = 0;
		int stuffNo = 0;
		
		result = dao.stuffEnrollEnd(sqlSession, param);
		System.out.println("물품까지" + result);
		
		if(result == 0 ) throw new RuntimeException();
		if(stuffUploadList.size() > 0) {
			for(StuffUpload su : stuffUploadList) {
				su.setStuffNo(Integer.parseInt(param.get("stuffNo")));
				result = dao.insertStuffImage(sqlSession, su);
				if(result == 0) throw new Exception();
			}
		}
		
		return result;
	}

	@Override
	public Stuff stuffSeeMore(int stuffNo) {
		return dao.stuffSeeMore(sqlSession, stuffNo);
	}

	@Override
	public StuffSubcategory stuffScName(int scNo) {
		return dao.stuffScName(sqlSession, scNo);
	}

	@Override
	public List<Stuff> selectStuffList(int cPage, int numPerPage) {
		return dao.selectStuffList(sqlSession, cPage, numPerPage);
	}

	@Override
	public int selectStuffCount() {
		return dao.selectStuffCount(sqlSession);
	}

	@Override
	public int stuffNameDupliCheck(String stuffName) {
		return dao.stuffNameDupliCheck(sqlSession, stuffName);
	}

	@Override
	public List<Stuff> selectStuffSearchList(Map<String, Object> m) {
		return dao.selectStuffSearchList(sqlSession, m);
	}

	@Override
	public int selectStuffSearchCount(Map<String, Object> m) {
		return dao.selectStuffSearchCount(sqlSession, m);
	}

	@Override
	public Stuff stuffOne(int stuffNo) {
		return dao.suffOne(sqlSession, stuffNo);
	}



}
