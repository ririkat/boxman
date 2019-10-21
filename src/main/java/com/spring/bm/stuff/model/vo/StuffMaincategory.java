package com.spring.bm.stuff.model.vo;

import lombok.Data;

@Data
public class StuffMaincategory {
	
	private int mcNo;
	private String mcName;
	
	public StuffMaincategory() {
		
	}
	
	public StuffMaincategory(int mcNo, String mcName) {
		super();
		this.mcNo = mcNo;
		this.mcName = mcName;
	}

	public StuffMaincategory(String mcName) {
		super();
		this.mcName = mcName;
	}
	
	
	

}
