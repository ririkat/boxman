package com.spring.bm.common;

import java.sql.Date;

public class PageBarFactory {

	public static String getPageBar(int totalCount, int cPage, 
			int numPerPage, String url) {
		String pageBar="";
		int pageBarSize=5;

		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;

		int totalPage=(int)Math.ceil((double)totalCount/numPerPage);

		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";

		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' "
					+ "href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}

		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' "
						+ "href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' "
					+ "href='javascript:fn_paging("+pageNo+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";


		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage";
		pageBar+="}";
		pageBar+="</script>";
		return pageBar;
	}

	public static String getPageBar(int totalCount, int cPage, 
			int numPerPage, String url, String type, String data) {
		String pageBar="";
		int pageBarSize=5;

		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;

		int totalPage=(int)Math.ceil((double)totalCount/numPerPage);

		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";

		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' "
					+ "href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}

		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' "
						+ "href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' "
					+ "href='javascript:fn_paging("+pageNo+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";

		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage+'&type="+type+"&data="+data+"'";
		pageBar+="}";
		pageBar+="</script>";
		return pageBar;
	}

	//데이트피커 검색용 페이지바
	public static String getPageBar(int totalCount, int cPage, 
			int numPerPage,String url, Date startDay, Date endDay, String temp) {
		String pageBar="";
		int pageBarSize=5;

		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;

		int totalPage=(int)Math.ceil((double)totalCount/numPerPage);

		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";

		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' "
					+ "href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' "
						+ "href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' "
					+ "href='javascript:fn_paging("+pageNo+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";

		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage+'&startDay="+startDay+"&endDay="+endDay+"&temp="+temp+"'";
		pageBar+="}";
		pageBar+="</script>";
		return pageBar;
	}

	//temp용 검색용 페이지바
	public static String getPageBar(int totalCount, int cPage, 
			int numPerPage,String url, String temp) {
		String pageBar="";
		int pageBarSize=5;

		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;

		int totalPage=(int)Math.ceil((double)totalCount/numPerPage);

		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";

		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' "
					+ "href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}

		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' "
						+ "href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' "
					+ "href='javascript:fn_paging("+pageNo+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";

		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage+'&temp="+temp+"'";
		pageBar+="}";
		pageBar+="</script>";
		return pageBar;
	}

	public static Object getPageBar(int totalCount, int cPage, int numPerPage, String url, Date startDay,
			Date endDay, String temp, String type, String data) {
		String pageBar="";
		int pageBarSize=5;

		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;

		int totalPage=(int)Math.ceil((double)totalCount/numPerPage);

		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";

		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' "
					+ "href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}

		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' "
						+ "href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' "
					+ "href='javascript:fn_paging("+pageNo+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";

		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.href='"+url+"?cPage='+cPage+'&startDay="+startDay+"&endDay="+endDay+"&temp="+temp+"&type="+type+"&data="+data+"'";
		pageBar+="}";
		pageBar+="</script>";
		return pageBar;
	}
	
	
	
	
}