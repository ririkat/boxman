package com.spring.bm.common;

import com.spring.bm.connection.model.vo.Connection;

import lombok.Data;

@Data
public class PageUrlFactory {
	
	/* 서버용 */
//	1. 이건 https 일때
//	private String url="/rclass.iptime.org/19AM_boxman_final";
	
	
//	2. 이건 http 일때
//	private String url="/rclass.iptime.org:9999/19AM_boxman_final";
	
//	3. 이건 현빈씨
//	private String url="/19AM_boxman_final";
	/* 로컬용 */
	private String url="/bm";
	
	
}
