package com.spring.bm.stuff.model.vo;

import java.sql.Date;

import com.spring.bm.stuff.controller.StuffController;

import lombok.Data;

@Data
public class StuffUpload {
	
	private int imgNo;
	private String imgOriname;
	private String imgRename;
	private int stuffNo;
	private Date imgDate;
	
	public StuffUpload() {
		
	}
	public StuffUpload(int imgNo, String imgOriname, String imgRename, int stuffNo, Date imgDate) {
		super();
		this.imgNo = imgNo;
		this.imgOriname = imgOriname;
		this.imgRename = imgRename;
		this.stuffNo = stuffNo;
		this.imgDate = imgDate;
	}
	
	

}
