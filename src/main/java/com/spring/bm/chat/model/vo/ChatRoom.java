package com.spring.bm.chat.model.vo;

import lombok.Data;

@Data
public class ChatRoom {
	
	private int roomNo;
	private int receiver;
	private int sender;
	
	public ChatRoom(int roomNo, int receiver, int sender) {
		super();
		this.roomNo = roomNo;
		this.receiver = receiver;
		this.sender = sender;
	}

	public ChatRoom() {
		// TODO Auto-generated constructor stub
	}
	
	

}
