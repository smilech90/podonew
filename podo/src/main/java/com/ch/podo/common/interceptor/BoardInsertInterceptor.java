package com.ch.podo.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ch.podo.common.interceptor.BoardInsertInterceptor;
import com.ch.podo.member.model.service.MemberService;
import com.ch.podo.member.model.vo.Member;

public class BoardInsertInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private MemberService memberService;

	private Logger logger = LoggerFactory.getLogger(BoardInsertInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		int bid = ((Member)session.getAttribute("loginUser")).getId();
		
		int result = memberService.prohibitionBoard(bid);
		
		if(result == 1) { // 블랙리스트 회원일 때
			logger.info("블랙리스트인 상태에서 게시물 작성하려 함");
			//request.setAttribute("msg", "블랙리스트 회원은 접근 불가능한 서비스입니다.");
			
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			 
			out.println("<script>alert('블랙리스트 회원은 접근 불가능한 서비스입니다.');history.back();</script>");
			//request.getRequestDispatcher("WEB-INF/views/home.jsp").forward(request, response);
			 
			out.flush();
			
			return false;
		}
		
		return true;
	}
	
}
