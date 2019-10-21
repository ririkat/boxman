package com.spring.bm.category.model.service;

import java.util.List;
import java.util.Map;

import com.spring.bm.stuff.model.vo.StuffMaincategory;
import com.spring.bm.stuff.model.vo.StuffSubcategory;

public interface CategoryService {

	List<StuffMaincategory> maincategoryList();

	int maincategoryEnroll(String mcName);

	List<StuffSubcategory> subcategoryList(int cPage, int numPerPage);

	int subcategoryEnroll(Map<String, Object> m);

	int maincategoryDelete(String mcName);

	int subcategoryDelete(String scName);

	List<StuffMaincategory> selectMaincategoryList(int cPage, int numPerPage);

	int selectMaincategoryCount();

	int selectSubcategoryCount();

}
