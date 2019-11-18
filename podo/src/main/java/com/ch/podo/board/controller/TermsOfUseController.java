package com.ch.podo.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TermsOfUseController {
	
	@RequestMapping("termsOfUse.do")
	public ModelAndView termsOfUseView(ModelAndView mv) {
		mv.setViewName("board/termsOfUseForm");
		return mv;
	}
	
}
