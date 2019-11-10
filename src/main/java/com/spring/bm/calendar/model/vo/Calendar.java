package com.spring.bm.calendar.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Calendar {
	
	private int _id;
	private String title;
	private String description;
	private Date start;
	private Date end;
	private String type;
	private int username;
	private String backgroundColor;
	private String allDay;
	

}
