package com.spring.bm.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthorityInterceptor extends HandlerInterceptorAdapter {

	// 전처리용 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Map<String, Object> map = (Map)request.getSession().getAttribute("loginEmp");
		String deptNo = String.valueOf(request.getParameter("dn"));
		String temp = String.valueOf(request.getParameter("temp"));
		
		if(!String.valueOf(map.get("JOBNO")).equals("100") && !String.valueOf(map.get("JOBNO")).equals("101")) {
			if(map == null || !(String.valueOf(map.get("DEPTNO"))).equals(deptNo)) {
				if(!temp.equals("my") && !temp.equals("search")) {
					request.setAttribute("msg", "권한이 없습니다.");
					request.setAttribute("loc", "/common/main.do");
					request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
					return false;
				} else {
					return super.preHandle(request, response, handler);
				}
			}  else {
				return super.preHandle(request, response, handler);
			}
		} else {
			return super.preHandle(request, response, handler);
		}

	}

	// 후 처리용 메소드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}


}
