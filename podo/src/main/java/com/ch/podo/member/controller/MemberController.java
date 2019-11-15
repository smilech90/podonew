package com.ch.podo.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
					 
	@RequestMapping("insertForm.do")
	public String insertForm() {
		return "member/memberInsertForm";
	}
}
