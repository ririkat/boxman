package com.spring.bm.calendar.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Calendar {
	
	private int schNo;
	private String schTitle;
	private Date schEnrolldate;
	private int schCateno;
	private String schLevel;
	private int empNo;
	private Date startDate;
	private Date endDate;
	private String color;

}
