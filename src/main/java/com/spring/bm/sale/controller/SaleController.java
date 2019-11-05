package com.spring.bm.sale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.bm.sale.model.service.SaleService;

@Controller
public class SaleController {

	@Autowired
	SaleService service;
	
}
