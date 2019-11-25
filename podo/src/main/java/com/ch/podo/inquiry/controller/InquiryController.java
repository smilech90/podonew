package com.ch.podo.inquiry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.inquiry.model.service.InquiryService;

@Controller
public class InquiryController {
	@Autowired
	private InquiryService inquiryService;
	
	@RequestMapping("myPageSelectQuestion.do")
	public ModelAndView myPageSelectQuestion(String id, ModelAndView mv) {
		System.out.println("문의");
		mv.addObject("question", id).setViewName("member/myPage");
		return mv;
	}
}
