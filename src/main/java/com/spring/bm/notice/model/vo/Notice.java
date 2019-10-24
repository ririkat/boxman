package com.spring.bm.notice.model.vo;

import java.sql.Date;

import lombok.Data;


@Data
public class Notice {
	private int nNo; //글 번호
	private String nName; //공지사항 글 제목
	private String nText; //공지사항 글 내용
	private String nCheck;
	private int nReadCount; //공지사항 조회수
	private Date nDate; //공지사항 등록일
	private String deptName;
	private int categoryNo;

	
	public Notice() {
		super();
	}


	public Notice(int nNo, String nName, String nText, int nReadCount, Date nDate, String deptName) {
		super();
		this.nNo = nNo;
		this.nName = nName;
		this.nText = nText;
		this.nReadCount = nReadCount;
		this.nDate = nDate;
		this.deptName = deptName;
	}


	public Notice(int nNo, String nName, String nText, String nCheck, int nReadCount, Date nDate,
			String deptName, int categoryNo) {
		super();
		this.nNo = nNo;
		this.nName = nName;
		this.nText = nText;
		this.nCheck = nCheck;
		this.nReadCount = nReadCount;
		this.nDate = nDate;
		this.deptName = deptName;
		this.categoryNo = categoryNo;
	}
	

}





