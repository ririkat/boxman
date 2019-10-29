package com.spring.bm.chatting;

import lombok.Data;

@Data
public class RTCMessage {
	
	private int receiver;
	private int sender;
	private int roomNo;
	private String chatText;

}
