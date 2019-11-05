package com.spring.bm.connection.model.vo;

import lombok.Data;

@Data
public class Connection {
	
	private int conCode;
	private String conName;
	private String conCateg;
	private String conRepname;
	private String conTel;
	private String conPhone;
	private int mcNo;
	private String conUsecheck;
	private String conTransck;
	private String conAddr;
	private int conLocy;
	private int conLocx;
	
	public Connection () {
		
	}

	public Connection(int conCode, String conName, String conCateg, String conRepname, String conTel, String conPhone,
			int mcNo, String conUsecheck, String conTransck, String conAddr, int conLocy, int conLocx) {
		super();
		this.conCode = conCode;
		this.conName = conName;
		this.conCateg = conCateg;
		this.conRepname = conRepname;
		this.conTel = conTel;
		this.conPhone = conPhone;
		this.mcNo = mcNo;
		this.conUsecheck = conUsecheck;
		this.conTransck = conTransck;
		this.conAddr = conAddr;
		this.conLocy = conLocy;
		this.conLocx = conLocx;
	}
	
	
	

}
