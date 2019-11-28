package com.ch.podo.inquiry.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.board.model.vo.PageInfo;
import com.ch.podo.common.Pagination;
import com.ch.podo.inquiry.model.service.InquiryService;
import com.ch.podo.inquiry.model.vo.Inquiry;
import com.ch.podo.review.model.dto.Review;

@Controller
public class InquiryController {
	@Autowired
	private InquiryService inquiryService;
	
	@RequestMapping("insertQuestion.do")
	public ModelAndView insertQuestion(Inquiry inq, ModelAndView mv) {
		
		int result = inquiryService.insertQuestion(inq);
		
		if(result > 0) {	// 업데이트 성공
			mv.addObject("msg", "문의 등록 성공").setViewName("member/myPage");
		}else {
			mv.addObject("msg", "문의 등록 실패").setViewName("member/myPage");
		}
		
		return mv;
	}
	
	@RequestMapping("myPageSelectQuestion.do")
	public ModelAndView myPageSelectQuestion(String tab, String id, ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		System.out.println("컨트롤러 들어옴");
		int listCount = inquiryService.myPageInquiryListCount(id);
		System.out.println("listcount : " + listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Inquiry> inquiryList = inquiryService.myPageSelectInquiryList(id,pi);
		System.out.println("inquiryList : " +inquiryList);
		mv.addObject("inquiry", inquiryList).addObject("pi", pi).addObject("tab", tab).setViewName("member/myPage");
		
		return mv;
	}
}
