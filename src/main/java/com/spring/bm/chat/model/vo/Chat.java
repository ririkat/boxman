package com.spring.bm.chat.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Chat {
	
	private int chatNo;
	private int empNo;
	private String sender;
	private String chatText;
	private Date sendDate;
		
	
	public Chat(int chatNo, int empNo, String sender, String chatText, Date sendDate) {
		super();
		this.chatNo = chatNo;
		this.empNo = empNo;
		this.sender = sender;
		this.chatText = chatText;
		this.sendDate = sendDate;
	}


	public Chat() {
		// TODO Auto-generated constructor stub
	}

}
