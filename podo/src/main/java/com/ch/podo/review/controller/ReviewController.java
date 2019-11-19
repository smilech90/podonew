package com.ch.podo.review.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ch.podo.review.model.service.ReviewService;
import com.ch.podo.review.model.vo.Review;

@Controller
public class ReviewController {
	
	
	@Autowired
	private ReviewService reviewService;

	@RequestMapping("reviewList.do")
	public ModelAndView reviewList(ModelAndView mv) {
		
		ArrayList<Review> list = reviewService.selectReviewList();
		
		mv.addObject("list",list).setViewName("reviewView/reviewList");
		
		System.out.println("리뷰리스트 : "  + list);
		
		return mv;
		
		
		
	}
	

}
