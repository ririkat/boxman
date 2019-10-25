package com.spring.bm.sale.model.service;

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
	
}
