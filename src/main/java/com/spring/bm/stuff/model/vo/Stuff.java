package com.spring.bm.stuff.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Stuff {
	
	private int stuffNo;
	private String stuffName;
	private int price;
	private int stuffCount;
	private int weight;
	private int size1;
	private int size2;
	private int size3;
	private String manufacturer;
	private Date manufacturingDate;
	private String manufacturingCountry;
	private String color;
	private String material;
	private String etc;
	private Date enrollDate;
	private int scNo;
	private String scName;
	private int conCode;
	private String conName;
	
	public Stuff() {
		
	}

	public Stuff(int stuffNo, String stuffName, int price, int stuffCount, int weight, int size1, int size2, int size3,
			String manufacturer, Date manufacturingDate, String manufacturingCountry, String color, String material,
			String etc, Date enrollDate, int scNo, String scName, int conCode, String conName) {
		super();
		this.stuffNo = stuffNo;
		this.stuffName = stuffName;
		this.price = price;
		this.stuffCount = stuffCount;
		this.weight = weight;
		this.size1 = size1;
		this.size2 = size2;
		this.size3 = size3;
		this.manufacturer = manufacturer;
		this.manufacturingDate = manufacturingDate;
		this.manufacturingCountry = manufacturingCountry;
		this.color = color;
		this.material = material;
		this.etc = etc;
		this.enrollDate = enrollDate;
		this.scNo = scNo;
		this.scName = scName;
		this.conCode = conCode;
		this.conName = conName;
	}

	
	
	

	
	
	

	
	
	
	
	
	
	
	
	
	
	

}
