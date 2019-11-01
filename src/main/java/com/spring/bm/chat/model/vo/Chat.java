package com.spring.bm.chat.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Chat {
	
	private int chatNo;
	private int roomNo;
	private int receiver;
	private int sender;
	private String chatText;
	private Date sendDate;
		
	
	public Chat(int chatNo, int roomNo, int receiver, int sender, String chatText, Date sendDate) {
		super();
		this.chatNo = chatNo;
		this.roomNo = roomNo;
		this.receiver = receiver;
		this.sender = sender;
		this.chatText = chatText;
		this.sendDate = sendDate;
	}


	public Chat() {
		// TODO Auto-generated constructor stub
	}

}
