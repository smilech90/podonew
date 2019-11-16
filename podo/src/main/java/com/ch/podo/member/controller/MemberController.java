package com.ch.podo.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.member.model.service.MemberService;
import com.ch.podo.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// @CookieValue(value="storeIdCookie", required = false) Cookie storeIdCookie
	@RequestMapping("login.do")
	public ModelAndView loginMember(Member mem, HttpSession session, ModelAndView mv,
																	boolean rememberMe, HttpServletResponse response, HttpServletRequest request) {
		
		Member loginUser = memberService.selectLoginMember(mem);
		// System.out.println("loginUser : " + loginUser);
		// System.out.println("rememberMe : " + rememberMe);
		
		if (loginUser != null) {
			if (rememberMe == true) {
				Cookie storeEmailCookie = new Cookie("email", mem.getEmail());
				Cookie storePwdCookie = new Cookie("pwd", mem.getPwd());
				storeEmailCookie.setMaxAge(60 * 60 * 24 * 7);
        storePwdCookie.setMaxAge(60 * 60 * 24 * 7);
        response.addCookie(storeEmailCookie);
        response.addCookie(storePwdCookie);
			} else {
				Cookie[] cookies = request.getCookies();
				for (int i = 0; i < cookies.length; i++) {
					if (cookies[i].getName().equals("email") || cookies[i].getName().equals("pwd")) {
						// System.out.println("cookies[" + i + "].name : " + cookies[i].getName());
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
					}
				}
			}
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:home.do");
		} else {
			mv.addObject("msg", "로그인 실패").setViewName("error/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home.do";
	}
	
	
	@RequestMapping("insertFormMember.do")
	public String insertForm() {
		return "member/memberInsertForm";
	}
	
	@RequestMapping("insertMember.do")
	public void insertMember(Member mem) {
		
	}
}
