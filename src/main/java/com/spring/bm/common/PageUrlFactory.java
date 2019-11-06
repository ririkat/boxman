package com.spring.bm.common;

import com.spring.bm.connection.model.vo.Connection;

import lombok.Data;

@Data
public class PageUrlFactory {
	
	/* 서버용 */
//	private String url="/rclass.iptime.org:8443/19AM_boxman_final";
	/* 로컬용 */
	private String url="/bm";
}
