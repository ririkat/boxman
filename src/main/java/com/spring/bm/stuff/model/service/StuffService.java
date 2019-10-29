package com.spring.bm.stuff.model.service;

import java.util.List;
import java.util.Map;

import com.spring.bm.connection.model.vo.Connection;
import com.spring.bm.stuff.model.vo.Stuff;
import com.spring.bm.stuff.model.vo.StuffMaincategory;
import com.spring.bm.stuff.model.vo.StuffSubcategory;
import com.spring.bm.stuff.model.vo.StuffUpload;


public interface StuffService {

	List<StuffMaincategory> stuffMaincategoryList();

	List<StuffSubcategory> stuffSubcategoryList(int mcNo);

	int stuffEnrollEnd(Map<String, String> param, List<StuffUpload> stuffUploadList) throws Exception;

	Stuff stuffSeeMore(int stuffNo);

	StuffSubcategory stuffScName(int scNo);

	List<Stuff> selectStuffList(int cPage, int numPerPage);

	int selectStuffCount();

	int stuffNameDupliCheck(String stuffName);

	List<Stuff> selectStuffSearchList(Map<String, Object> m);

	int selectStuffSearchCount(Map<String, Object> m);

	Stuff stuffOne(int stuffNo);

	StuffUpload stuffUploadOne(int stuffNo);

	StuffMaincategory selectMaincategory(int scNo);

	int updateStuff(Map<String, String> param);

	int deleteStuff(int stuffNo);

	int deleteStuffUpload(Map<String, String> param);

	int stuffUpdateEnd(Map<String, String> param, List<StuffUpload> stuffUploadList) throws Exception;

	List<Connection> stuffConnectionList();

	Connection connectionName(int conCode);

	List<Stuff> searchStuffName(Map<String,String> map);







}
