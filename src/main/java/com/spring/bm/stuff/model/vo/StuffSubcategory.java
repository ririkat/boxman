package com.spring.bm.stuff.model.vo;

import lombok.Data;

@Data
public class StuffSubcategory {
	
	private int scNo;
	private String scName;
	private int mcNo;
	private String mcName;



	public StuffSubcategory() {
		
	}


	public StuffSubcategory(int scNo, String scName, int mcNo, String mcName) {
		super();
		this.scNo = scNo;
		this.scName = scName;
		this.mcNo = mcNo;
		this.mcName = mcName;
	}
	
	
	
}
	
