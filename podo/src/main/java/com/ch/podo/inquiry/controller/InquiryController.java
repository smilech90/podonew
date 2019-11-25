package com.ch.podo.inquiry.controller;

import java.util.ArrayList;

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
	public ModelAndView myPageSelectQuestion(String tab, String id, ModelAndView mv) {
		ArrayList list = new ArrayList();
		System.out.println("문의");
		mv.addObject("list", list).addObject("tab", tab).setViewName("member/myPage");
		return mv;
	}
}
